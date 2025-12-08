require 'minitest/autorun'
require_relative 'main'

class TestCafeteria < Minitest::Test
  def setup
    @cafeteria = Cafeteria.new
  end

  def test_get_ingredient_data
    ranges, ids = @cafeteria.get_ingredient_data('test_ingredients.txt')
    expected_ranges = [[3,5], [10, 14], [16, 20], [12, 18]]
    expected_ids = [1, 5, 8, 11, 17, 32]
    assert_equal expected_ranges, ranges
    assert_equal expected_ids, ids
  end

  def test_count_fresh
    fresh_count = @cafeteria.count_fresh('test_ingredients.txt')
    assert_equal 3, fresh_count
  end

  def test_new_fresh_count
    fresh_count = @cafeteria.new_fresh_count('test_ingredients.txt')
    assert_equal 14, fresh_count
  end
end