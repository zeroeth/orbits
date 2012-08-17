require 'test_helper'
require 'angle'

class AngleTest < Test::Unit::TestCase
  context "angle" do
    setup do
      @angle = Angle.new
    end

    should "assign defaults" do
      assert_equal  0, @angle.angle
      assert_equal 1, @angle.rpm
      assert_equal :smooth, @angle.steps
      assert_equal :absolute, @angle.type
    end
  end
end
