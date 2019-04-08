class CreateDataPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :data_packages do |t|
      t.string :name 
      t.string :type 
      t.boolean :favorite, :default => "false" 
      t.integer :user_id
      t.integer :document_id

      t.timestamps
    end
  end
end
