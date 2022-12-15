class AddDefaultValueToColor < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :color, "#263949"
  end
end
