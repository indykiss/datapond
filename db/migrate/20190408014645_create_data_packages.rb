class CreateDataPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :data_packages do |t|
      t.string :name
      t.string :category_id
      t.integer :user_id

    end
  end
end
