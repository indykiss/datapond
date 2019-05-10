class Changerenamecolumn < ActiveRecord::Migration[5.2]
  def change
    change_column :data_packages, :category, :integer 
    rename_column :data_packages,  :category, :category_id
  end
end
