class Alert < ApplicationRecord
  belongs_to :monitoring_point
  has_many :alert_messages
end
