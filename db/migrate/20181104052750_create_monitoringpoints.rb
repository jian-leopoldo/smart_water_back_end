class CreateMonitoringpoints < ActiveRecord::Migration[5.2]
  def change
    create_table :monitoringpoints do |t|
      t.string :title
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
