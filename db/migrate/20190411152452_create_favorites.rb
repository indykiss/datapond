class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :data_package_id
      t.integer :user_id

    end
  end
end
