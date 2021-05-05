class AddDisplayedToLoggedOutUsersToContentNodes < ActiveRecord::Migration[5.2]
  def change
    add_column :content_nodes, :displayed_to_logged_out_users, :boolean, default: true
  end
end
