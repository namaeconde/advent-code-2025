require 'minitest/autorun'
require_relative 'main'

class TestPrinter < Minitest::Test
  def setup
    @printer = Printer.new
  end
  
  def test_get_accessible_rolls
    paper_rolls_matrix = @printer.get_paper_rolls('test_paper_rolls.txt')
    result = @printer.get_accessible_rolls(paper_rolls_matrix)
    assert_equal 13, result.length
  end

  def test_remove_accessible_rolls
    paper_rolls_matrix = [
      "..@@.@@@@.",
      "@@@.@.@.@@",
      "@@@@@.@.@@",
      "@.@@@@..@.",
      "@@.@@@@.@@",
      ".@@@@@@@.@",
      ".@.@.@.@@@",
      "@.@@@.@@@@",
      ".@@@@@@@@.",
      "@.@.@@@.@."
    ]
    paper_rolls_matrix = @printer.get_paper_rolls('test_paper_rolls.txt')
    accessible_rolls = @printer.get_accessible_rolls(paper_rolls_matrix)
    updated_matrix = @printer.remove_accessible_rolls(accessible_rolls, paper_rolls_matrix)
    expected_matrix = [
      "..xx.xx@x.",
      "x@@.@.@.@@",
      "@@@@@.x.@@",
      "@.@@@@..@.",
      "x@.@@@@.@x",
      ".@@@@@@@.@",
      ".@.@.@.@@@",
      "x.@@@.@@@@",
      ".@@@@@@@@.",
      "x.x.@@@.x."
    ]
    assert_equal expected_matrix, updated_matrix
  end

  def test_remove_all_accessible_rolls
    all_accessible_rolls = @printer.remove_all_accessible_rolls('test_paper_rolls.txt')
    assert_equal 43, all_accessible_rolls
  end
end