require 'minitest/autorun'
require_relative 'main'

class TestLobby < Minitest::Test
  def setup
    @lobby = Lobby.new
  end

  def test_highest_joltage_with_test_file
    # Test with the test_product_ids.txt file
    result = @lobby.get_highest_joltage('test_batteries.txt')
    
    # Verify the method executes without errors
    assert_equal [98, 89, 78, 92], result
  end

  def test_additional_joltage_with_test_file
    # Test with the test_product_ids.txt file
    result = @lobby.get_additional_joltage('test_batteries.txt')
    
    # Verify the method executes without errors  
    assert_equal [987654321111, 811111111119, 434234234278, 888911112111], result
  end
end