require 'minitest/autorun'
require_relative 'main'

class TestSecretEntrance < Minitest::Test
  def setup
    @entrance = SecretEntrance.new
  end

  def test_rotate_secret_dial_with_test_file
    # Test with the test_rotations.txt file
    result = @entrance.rotate_secret_dial('test_rotations.txt')
    
    # Verify the method executes without errors
    assert_equal 3, result
  end

  def test_additional_rotation_with_test_file
    # Test with the test_rotations.txt file
    result = @entrance.additional_rotation('test_rotations.txt')
    
    # Verify the method executes without errors
    assert_equal 6, result
  end
end
