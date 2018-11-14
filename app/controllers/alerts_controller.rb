class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :destroy, :update]

  def index
    @alert = Alert.where(monitoring_point_id: params[:monitoring_point_id])
    render json: @alert.to_json
  end

  def show
    render json: @alert.to_json
  end

  def destroy
    if @alert.destroy
      render json: @alert.to_json
    else
      render json: @alert.errors.to_json
    end
  end

  def update
    if @alert.update(alert_params)
      render json: @alert.to_json
    else
      render json: @alert.errors.to_json
    end
  end

  def create
    @alert = Alert.new(alert_params)
    if @alert.save
      render json: @alert.to_json
    else
      render json: @alert.errors.to_json
    end
  end


  private 

  def alert_params
    params.require(:alert).permit(:title, :type, :max_value)
          .merge(monitoring_point_id: params[:monitoring_point_id])   
  end

  def set_alert
    @alert = Alert.find(params[:id])
  end
end
