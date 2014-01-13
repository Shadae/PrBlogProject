class AddColumnsToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :ip_address, :string
    add_column :visitors, :page_visits, :integer, default: 0
    add_column :visitors, :last_visit, :datetime
    add_column :visitors, :mobile, :boolean
  end
end
