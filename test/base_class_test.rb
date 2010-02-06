require 'test_helper'
require 'base_class'

class BaseClassTest < Test::Unit::TestCase
  context "base class" do
    setup do
      @base = BaseClass.new
    end

    should "write attribute" do
      value = {:one => 1}
      @base.write_attribute :defaults, value
      assert_equal value, @base.defaults
    end
  end
end
