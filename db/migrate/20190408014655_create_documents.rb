class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :raw_data
      t.integer :data_package_id

    end
  end
end
