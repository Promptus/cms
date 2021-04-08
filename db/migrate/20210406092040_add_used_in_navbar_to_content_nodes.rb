class AddUsedInNavbarToContentNodes < ActiveRecord::Migration[5.2]
  def change
    add_column :content_nodes, :used_in_navbar, :boolean, default: false
  end
end
