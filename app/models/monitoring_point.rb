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

  def self.show_charts(id_1, id_2)
    monitoring_point_1 = MonitoringPoint.find(id_1)
    monitoring_point_2 = MonitoringPoint.find(id_2)
    array_to_return = []
    (1..7).each do |i|
      response = {}
      response['name'] = select_day_of_week(i)
      response['amt'] = 2000
      day = Date.today.beginning_of_week - 1.week + i.days
      response[monitoring_point_1.title] = monitoring_point_1.monitoring_logs.where(created_at: day.beginning_of_day..day.end_of_day)
      .sum(:point_value)
      response[monitoring_point_2.title] = monitoring_point_2.monitoring_logs.where(created_at: day.beginning_of_day..day.end_of_day)
            .sum(:point_value)
      array_to_return.push(response)
   end
   array_to_return
  end

  private 

  def self.select_day_of_week(day_of_week)
    case day_of_week
    when 1
      'segunda'
    when 2
      'terça'
    when 3
      'quarta'
    when 4
      'quinta'
    when 5
      'sexta'
    when 6
      'sabado'
    when 7
      'domingo'
    end

  end
end
