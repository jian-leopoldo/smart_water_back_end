class MonitoringLog < ApplicationRecord
    belongs_to :monitoring_point

    after_create :create_alert

    def create_alert
      monitoring_point.alerts.each do |alert|
        total_value = monitoring_point.monitoring_logs.sum(:point_value)
        AlertMessage.create(alert: alert) if total_value > alert.max_value
      end
    end

    def as_api_response
      self.as_json.merge(log_date: created_at.strftime('%d/%m/%y %H:%M'))
    end
end
