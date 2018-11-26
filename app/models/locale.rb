class Locale < ApplicationRecord
    has_many :monitoring_points
    belongs_to :user
end
