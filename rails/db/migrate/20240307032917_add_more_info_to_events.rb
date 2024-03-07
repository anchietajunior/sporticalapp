class AddMoreInfoToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :more_info, :text
  end
end
