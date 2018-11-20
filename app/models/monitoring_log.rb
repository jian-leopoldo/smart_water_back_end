class MonitoringLog < ApplicationRecord
    belongs_to :monitoring_point

    def as_api_response
      self.as_json.merge(log_date: created_at.strftime('%d/%m/%y %H:%M'))
    end
end
