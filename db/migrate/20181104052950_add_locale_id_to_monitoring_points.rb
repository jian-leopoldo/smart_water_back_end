class AddLocaleIdToMonitoringPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :monitoringpoints, :locale_id, :integer
  end
end
