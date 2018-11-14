class MonitoringPoint < ApplicationRecord
  belongs_to :locale
  has_many :monitoring_logs


  def monitoring_logs_response
    response = {}
    response[:value] = monitoring_logs.sum(:point_value)
    date = ''
    date = monitoring_logs.last.created_at.strftime('%d/%m/%y %H:%M') if monitoring_logs.present?
    date = 'hoje' if monitoring_logs.last.created_at.to_date.eql?(Time.now.to_date) if monitoring_logs.present?
    response[:last_log] = date
    response[:title] = title
    response[:id] = id
    response
  end
end
