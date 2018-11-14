class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.string :type
      t.string :title
      t.integer :monitoring_point_id
      t.float :max_value

      t.timestamps
    end
  end
end
