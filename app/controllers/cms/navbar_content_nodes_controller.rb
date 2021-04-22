# encoding: utf-8
module Cms
  class NavbarContentNodesController < ApplicationController
    helper_method :content_node_options

    def index
      @content_nodes = ContentNode.asc_by_position.used_in_navbar
    end

    def select
      @content_nodes_for_selection = ContentNode.not_used_in_navbar.order(:title).pluck(:title, :id)
    end

    def add
      @content_node = load_object
      @content_node.add_to_navbar!
      redirect_to navbar_content_nodes_path
    end

    def remove
      @content_node = load_object
      @content_node.remove_from_navbar!
      redirect_to navbar_content_nodes_path
    end

    def positions
      ids = ContentNode.currently_in_navbar.pluck(:id)
      render json: ids.map.with_index { |x, i| [x, i + 1] }.to_h
    end

    def toggle_access
      @content_node = load_object
      touch_parent_node
      @content_node.update_attribute(:access, @content_node.public? ? 'private' : 'public')
      redirect_to navbar_content_nodes_path
    end

    private

    def touch_parent_node
      ContentNode.find_by(id: @content_node.parent_id)&.touch
    end

    def load_object
      ContentNode.find(params[:id])
    end
  end
end
