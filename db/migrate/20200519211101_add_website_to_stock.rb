class AddWebsiteToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :website, :string
  end
end
