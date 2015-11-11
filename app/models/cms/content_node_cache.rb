module Cms
  class ContentNodeCache < ActiveRecord::Base

    self.table_name = :content_node_caches

    belongs_to :content_node

    validates :content_node, presence: true
    validates :path, presence: true
    validates :content, presence: true

    before_validation :render_content

    class << self

      def create_or_update(content_node)
        attrs = {
          content_node: content_node,
          path: content_node.path,
          content_node_type: content_node.type
        }
        if cache = self.find_by_content_node_id(content_node.id)
          cache.update_attributes(attrs)
        else
          self.create(attrs)
        end
      end

    end

    def render_content
      raise NotImplementedError, 'Add a content_node_cache decorator and implement a render_content method. See spec/models/cms/content_node_cache_spec.rb how this works.'
    end

    protected

    def controller
      @controller ||= CacheRenderController.new
    end

    def render(template, format)
      controller.instance_variable_set('@content_node', content_node)
      controller.render_to_string(template: template, formats: format)
    end

  end
end
