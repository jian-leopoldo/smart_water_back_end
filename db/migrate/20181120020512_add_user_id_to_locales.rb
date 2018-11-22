class AddUserIdToLocales < ActiveRecord::Migration[5.2]
  def change
    add_column :locales, :user_id, :integer
  end
end
