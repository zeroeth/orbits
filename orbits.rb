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

# GEMS
require 'rubygems'
require 'bundler/setup'
require 'chingu'
require 'logger'
require 'gl'
require 'glu'

include Gosu
include Gl
include Glu

# LOCALS
require 'orbiter_tree'

# SETUP
$log = Logger.new("log/log.log")
$log.level = Logger::DEBUG
puts "[Logger $log started in log/log.log]"
$log.info "** Server Start #{Time.now}"

class Orbits < Chingu::Window
  attr_accessor :tree

  def initialize
    super
    self.input = { :esc => :exit }
    self.tree = OrbiterTree.new self
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
