require 'rails_helper'

module Cms
  RSpec.describe ContentNodeCache, type: :model do

    let(:node) { create(:test_node) }

    ContentNodeCache.class_eval do

      def render_content
        self.content = render('templates/cache/test_node', :html)
      end

      class CacheRenderController < ::ActionController::Base
        helper TestHelper
      end

    end

    context "render_content" do

      it 'renders the view' do
        cache = ContentNodeCache.new
        cache.content_node = node
        cache.path = node.path
        cache.save
        expect(cache.reload.content).to be_present
      end

    end

    context "create_or_update" do

      it 'creates or updates the cache' do
        expect{ ContentNodeCache.create_or_update(node) }.to change{ ContentNodeCache.count }.by(1)
        expect{ ContentNodeCache.create_or_update(node) }.to change{ ContentNodeCache.count }.by(0)
      end

    end

  end
end
