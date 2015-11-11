class AddTypeToContentNodeCaches < ActiveRecord::Migration
  def change
    add_column :content_node_caches, :content_node_type, :string
    add_index :content_node_caches, :content_node_type
  end
end
