require 'test_helper'

class CreatingItemsTest < ActionDispatch::IntegrationTest
  test 'creates a new item with valid data' do
    post '/items', {
      name: 'Fish',
      checked: true
    }.to_json,
    { 'Accept' => 'application/json',
      'Conttent-Type' => 'application/json'}

      assert_equal 201, response.status
      assert_equal Mime::JSON, response.content_type
      item = json(response.body)
      assert_equal item_url(item[:id]), response.location

      assert_equal 'Fish', item[:name]
      assert_equal true, :checked
    end
end
