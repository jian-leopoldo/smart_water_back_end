class LocalesController < ApplicationController
  before_action :set_locale, only: [:show, :destroy, :update, :show_monitoring_points]

  def index
    @locales = @admin.locales
    render json: @locales.to_json
  end

  def show
    render json: @locale.to_json
  end

  def get_charts_data
    render json: MonitoringPoint.show_charts(params[:id_1], params[:id_2])
  end

  def destroy
  end

  def show_monitoring_points
    render json: @locale.as_json.merge(alerts: MonitoringPoint.show_alerts(@locale.monitoring_points.pluck(:id)),  monitoring_points: @locale.monitoring_points.map(&:monitoring_logs_response))
  end

  def update

  end

  def create
    @locale = Locale.new(locale_params)
    if @locale.save
      render json: @locale.to_json
    else
      render json: @local.errors.to_json
    end
  end


  private 

  def locale_params
    params.require(:locale).permit(:title, :description, :address)
                            .merge(user_id: @admin.id)    
  end

  def set_locale
    @locale = Locale.find(params[:id] || params[:locale_id])
  end

end
