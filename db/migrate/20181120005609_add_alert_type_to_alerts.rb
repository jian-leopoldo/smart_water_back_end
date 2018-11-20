class AddAlertTypeToAlerts < ActiveRecord::Migration[5.2]
  def change
    add_column :alerts, :alert_type, :string
  end
end
