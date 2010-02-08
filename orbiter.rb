require 'base_class'
require 'rubygems'
require 'gl'
require 'glu'

include Gl
include Glu

require 'angle'

class Orbiter < BaseClass
  attribute :sub_orbits, lambda { Array.new }
  attribute :distance, 2
  attribute :size, 20
  attribute :axis, lambda { Angle.new } 
  attribute :orbit, lambda { Angle.new }
  attribute :name, 'unamed'

  def initialize(options = {})
    write_attribute :defaults, { :sub_orbits=>[], :distance=>50, :size=>20, :axis=>Angle.new, :orbit=>Angle.new, :name=>'unamed' }
    super options
  end

  def update
    $log.info "#{name} :: #{object_id} :: #{axis.object_id}"
    axis.update
    orbit.update
    sub_orbits.each(&:update)
  end

  # separate into a 'view'
  def draw
    glPushMatrix
      glRotate orbit.angle, 0, 0, 0.1
      glTranslate distance, distance, 0    # not precise..
      glRotate -orbit.angle, 0, 0, 0.1 # if relative

      half = -(size/2)
      glTranslated half, half, 0

      glBegin GL_QUADS
        glColor4f (1.0/100)*distance,(1.0/100)*distance,1.0,1.0
        
        glVertex2i 0, 0
        glVertex2i size, 0
        glVertex2i size, size      
        glVertex2i 0, size
      glEnd

      sub_orbits.each(&:draw)
      
    glPopMatrix
  end
end
