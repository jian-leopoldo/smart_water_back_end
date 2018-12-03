class MonitoringLogsController < ApplicationController
  before_action :set_monitoring_log, only: [:show, :destroy, :update]

  def index
    @monitoring_log = MonitoringLog.where(monitoring_point_id: params[:monitoring_point_id])
    render json: @monitoring_log.map(&:as_api_response).to_json
  end

  def show
    render json: @monitoring_log.to_json
  end

  def destroy
    if @monitoring_log.destroy
      render json: @monitoring_log.to_json
    else
      render json: @monitoring_log.errors.to_json
    end
  end

  def update
    if @monitoring_log.update(monitoring_log_params)
      render json: @monitoring_log.to_json
    else
      render json: @monitoring_log.errors.to_json
    end
  end

  def create
    @monitoring_log = MonitoringLog.new(monitoring_log_params)
    if @monitoring_log.save
      render json: @monitoring_log.to_json
    else
      render json: @monitoring_log.errors.to_json
    end
  end


  private 

  def monitoring_log_params
    params.require(:monitoring_log).permit(:monitoring_point_id, :point_value, :current_value)
          .merge(monitoring_point_id: params[:monitoring_point_id])   
  end

  def set_monitoring_log
    @monitoring_log = MonitoringLog.find(params[:id])
  end
end
