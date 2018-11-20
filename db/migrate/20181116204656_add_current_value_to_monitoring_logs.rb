class AddCurrentValueToMonitoringLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :monitoring_logs, :current_value, :float
  end
end
