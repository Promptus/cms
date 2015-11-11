FactoryGirl.define do
  factory :cms_content_node_cach, :class => 'Cms::ContentNodeCache' do
    path "MyString"
content "MyText"
content_node nil
  end

end
