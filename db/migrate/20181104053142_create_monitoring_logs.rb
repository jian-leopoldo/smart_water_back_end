class CreateMonitoringLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :monitoring_logs do |t|
      t.integer :monitoring_point_id
      t.float :point_value

      t.timestamps
    end
  end
end
