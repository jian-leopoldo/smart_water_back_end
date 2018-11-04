class CreateLocales < ActiveRecord::Migration[5.2]
  def change
    create_table :locales do |t|
      t.string :title
      t.text :address
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
