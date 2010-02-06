require 'test_helper'
require 'orbiter'

class OrbiterTest < Test::Unit::TestCase
  context "new orbiter" do
    should "override defaults" do
      child = Orbiter.new
      orbiter = Orbiter.new :sub_orbits => [child]
      assert_equal [child], orbiter.sub_orbits
    end
  end
end
