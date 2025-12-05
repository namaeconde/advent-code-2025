require 'minitest/autorun'
require_relative 'main'

class TestGiftShop < Minitest::Test
  def setup
    @gift_shop = GiftShop.new
  end

  def test_filter_invalid_ids_with_test_file
    # Test with the test_product_ids.txt file
    result = @gift_shop.filter_invalid_ids('test_product_ids.txt')
    
    # Verify the method executes without errors
    assert_equal [11, 22, 99, 1010, 1188511885, 222222, 446446, 38593859], result
  end

  def test_additional_invalid_ids_with_test_file
    # Test with the test_product_ids.txt file
    result = @gift_shop.additional_invalid_ids('test_product_ids.txt')
    
    # Verify the method executes without errors
    assert_equal [11, 22, 99, 111, 999, 1010, 1188511885, 222222, 446446, 38593859, 565656, 824824824, 2121212121], result
  end
end