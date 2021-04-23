# encoding: utf-8
module Cms
  module Concerns
    module Tree

      extend ActiveSupport::Concern

      included do

        def ancestors
          node, nodes = self, []
          nodes << node = node.parent while node.parent
          nodes
        end

      end

    end
  end
end
