class CreateContentNodeCaches < ActiveRecord::Migration
  def change
    create_table :content_node_caches do |t|
      t.references :content_node, index: true
      t.string :path, index: true
      t.text :content

      t.timestamps null: false
    end
  end
end
