class CreateMonitoringPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :monitoring_points do |t|
      t.string :title
      t.text :description
      t.integer :locale_id

      t.timestamps
    end
  end
end
