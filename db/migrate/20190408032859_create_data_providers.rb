

class CreateDataProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :data_providers do |t|
      t.string :name
      t.text :type

      t.timestamps
    end
  end
end
