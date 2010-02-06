require 'test_helper'
require 'angle'

class AngleTest < Test::Unit::TestCase
  context "angle" do
    setup do
      @angle = Angle.new
    end

    should "assign defaults" do
      assert_equal  0, @angle.axis_angle
      assert_equal 10, @angle.axis_rpm
      assert_equal :smooth, @angle.axis_steps
      assert_equal :absolute, @angle.axis_type
    end
  end
end
