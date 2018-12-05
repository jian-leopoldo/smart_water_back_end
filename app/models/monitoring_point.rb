class MonitoringPoint < ApplicationRecord
  belongs_to :locale
  has_many :monitoring_logs
  has_many :alerts


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
  
  def self.show_alerts(monitoring_id)
    resp = []
    Alert.where(monitoring_point_id: monitoring_id).each do |alert|
      alert.alert_messages.each { |am| resp.push(alert.as_json.merge(monitoring_title: alert.monitoring_point.title)) }
    end
    [resp[0], resp[1],resp[2],resp[3],resp[4]]
  end

  def self.show_charts(id_1, id_2)
    monitoring_point_1 = MonitoringPoint.find(id_1)
    monitoring_point_2 = MonitoringPoint.find(id_2)
    array_to_return = []
    (0..6).each do |i|
      response = {}
      response['amt'] = 2000
      day = Date.today
      day = day - i.days
      response['name'] = select_day_of_week(day.wday)
      response[monitoring_point_1.title] = monitoring_point_1.monitoring_logs.where(created_at: day.beginning_of_day..day.end_of_day)
      .sum(:point_value)
      response[monitoring_point_2.title] = monitoring_point_2.monitoring_logs.where(created_at: day.beginning_of_day..day.end_of_day)
            .sum(:point_value)
      array_to_return.push(response)
   end
   array_to_return_2 = []
   monitoring_point_1.locale.monitoring_points.limit(5).each do |monitoring_point|
    resp = {}
    resp[:subject] = monitoring_point.title
    resp[:A] = monitoring_point.monitoring_logs.sum(:point_value)
    resp[:B] = monitoring_point.monitoring_logs.sum(:point_value)
    resp[:fullMark] = 10000
    monitoring_point
    array_to_return_2.push(resp)
   end
   response = {}
   response[:array_1] = array_to_return
   response[:array_2] = array_to_return_2
   response
  end

  private 

  def self.select_day_of_week(day_of_week)
    case day_of_week
    when 0
      'segunda'
    when 1
      'terça'
    when 2
      'quarta'
    when 3
      'quinta'
    when 4
      'sexta'
    when 5
      'sabado'
    when 6
      'domingo'
    end

  end
end
