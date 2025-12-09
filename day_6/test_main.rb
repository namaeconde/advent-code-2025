require 'minitest/autorun'
require_relative 'main'

class TestTrashCompactor < Minitest::Test
  def setup
    @compactor = TrashCompactor.new
  end

  def test_get_worksheet
    data, operations = @compactor.get_worksheet('test_worksheet.txt')
    expected_data = [
      [123, 328, 51, 64],
      [45, 64, 387, 23],
      [6, 98, 215, 314],
    ]

    expected_operations = ["*", "+", "*", "+"]
    assert_equal expected_data, data
    assert_equal expected_operations, operations
  end

  def test_get_grand_total
    total = @compactor.get_grand_total('test_worksheet.txt')
    assert_equal 4277556, total
  end

  def test_get_rtl_worksheet
    rtl_data, operations = @compactor.get_rtl_worksheet('test_worksheet.txt')
    expected_rtl_data = [
      [356, 24, 1],
      [8, 248, 369],
      [175, 581, 32],
      [4, 431, 623]
    ]

    expected_operations = ["*", "+", "*", "+"]
    assert_equal expected_rtl_data, rtl_data
    assert_equal expected_operations, operations
  end

  def test_get_rtl_grand_total
    rtl_total = @compactor.get_rtl_grand_total('test_worksheet.txt')
    assert_equal 3263827, rtl_total
  end
end