require 'test_helper'
require 'orbiter'

class OrbiterTest < Test::Unit::TestCase
  context "new orbiter" do
    should "override defaults" do
      child = Orbiter.new
      orbiter = Orbiter.new :sub_orbits => [child]
      assert_equal [child], orbiter.sub_orbits
    end

    context "defaults" do
      should "keep attribute" do
        orbiter = Orbiter.new
        assert_equal orbiter.sub_orbits.object_id, orbiter.sub_orbits.object_id
      end

      should "not share attribute" do
        orbiter1 = Orbiter.new
        orbiter2 = Orbiter.new
        assert_not_equal orbiter1.sub_orbits.object_id, orbiter2.sub_orbits.object_id
      end
    end
  end
end
