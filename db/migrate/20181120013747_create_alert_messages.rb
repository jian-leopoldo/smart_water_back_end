class CreateAlertMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :alert_messages do |t|
      t.integer :alert_id

      t.timestamps
    end
  end
end
