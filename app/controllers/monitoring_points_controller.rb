class MonitoringPointsController < ApplicationController
  before_action :set_monitoring_point, only: [:show, :destroy, :update, :monitoring_logs_show]

  def index
    @monitoring_point = MonitoringPoint.all
    render json: @monitoring_point.to_json
  end

  def show
    render json: @monitoring_point.to_json
  end

  def monitoring_logs_show
    render json: @monitoring_point.monitoring_logs_response
  end

  def destroy
    if @monitoring_point.destroy
      render json: @monitoring_point.to_json
    else
      render json: @monitoring_point.errors.to_json
    end
  end

  def update
    if @monitoring_point.update(monitoring_point_params)
      render json: @monitoring_point.to_json
    else
      render json: @monitoring_point.errors.to_json
    end
  end

  def create
    @monitoring_point = MonitoringPoint.new(monitoring_point_params)
    if @monitoring_point.save
      render json: @monitoring_point.to_json
    else
      render json: @monitoring_point.errors.to_json
    end
  end


  private 

  def monitoring_point_params
    params.require(:monitoring_point).permit(:title, :description, :locale_id)    
  end

  def set_monitoring_point
    @monitoring_point = MonitoringPoint.find(params[:id] || params[:monitoring_point_id])
  end
end
