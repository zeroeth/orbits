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
  attribute :orbit_speed, 1
  attribute :orbit_angle, 0
  attribute :axis_speed, 1
  attribute :axis_angle, 0
  attribute :axis, lambda { Angle.new } 
  attribute :orbit, lambda { Angle.new }
  attribute :name, 'unamed'

  def initialize(options = {})
    write_attribute :defaults, { :sub_orbits=>[], :distance=>50, :size=>20, :axis=>Angle.new, :orbit=>Angle.new, :name=>'unamed', :orbit_speed => 1, :axis_speed => 1, :orbit_angle => 0, :axis_angle => 0 }
    super options
  end

  def size=(value)
    # convert from earth radius (1.0) into
    @size = value * 10
  end

  def distance=(value)
    # convert from AU
    @distance = value * 25
  end

  def update
    $log.info "#{name} :: #{object_id} :: #{axis.object_id}"
    axis.update
    orbit.update
    self.orbit_angle += 1/orbit_speed
    self.axis_angle += axis_speed
    sub_orbits.each(&:update)
  end

  # separate into a 'view'
  def draw
    glPushMatrix
      glRotate orbit_angle, 0, 0, 0.1
      glTranslate distance, distance, 0    # not precise..
      glRotate -orbit_angle, 0, 0, 0.1 # if relative

      #half = -(size/2)
      #glTranslated half, half, 0

      glPushMatrix
        #glBegin GL_QUADS
        glRotate axis_angle, 0, 0, 0.1
        glBegin GL_TRIANGLE_FAN
          
          glVertex2i 0, 0
          step = (Math::PI*2)/20
          (21+1).times do |n|
            glColor4f (1.0/40)*distance,(1.0/900)*distance,(1.0/22)*n,1.0
            glVertex2i Math::sin(n*step)*size*0.5, Math::cos(n*step)*size*0.5
          end
        #  glVertex2i size, 0
        #  glVertex2i size, size      
        #  glVertex2i 0, size
        glEnd
      glPopMatrix

      sub_orbits.each(&:draw)
      
    glPopMatrix
  end
end
