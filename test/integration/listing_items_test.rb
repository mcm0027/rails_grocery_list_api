require 'test_helper'

class ListingItemsTest < ActionDispatch::IntegrationTest

  setup do
    Item.create!(name: 'Fish', checked: true)
  end

  test 'lists items in JSON' do
    get '/items', {}, {'Accept' => 'application/json'}

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    # assert_equal 1, json(response.body).size
  end

end
