#!/usr/bin/env ruby -rubygems
# an orbit drawing program
# orbits have:
# - distance from center parent/rootpoint
# - size
# - speed (angular, axial)
# - initial offset (angular, axial)
# - sub orbits
# - absolute (0 degrees) OR relative to parents angle, axial
# - smooth or stepped angle advancing. (angular, axial)
# - step count per rotation (determins step size and time to step)

# helper to 'space out' elements evenly
require 'rubygems'
require 'chingu'

include Gosu
require 'gl'
require 'glu'

include Gl
include Glu

require 'orbiter_tree'

class Orbits < Chingu::Window
  attr_accessor :tree

  def initialize
    super
    self.input = { :esc => :exit }
    self.tree = OrbiterTree.new self
    @color = Color.new(0xFFFF0000)
  end

  def update
    super
    tree.update
  end

  def draw
    super
    tree.draw
  end
end

Orbits.new.show
