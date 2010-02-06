require 'base_class'
require 'rubygems'
require 'gl'
require 'glu'

include Gl
include Glu

require 'angle'

class Orbiter < BaseClass
  attribute :sub_orbits, []
  attribute :distance, 20
  attribute :size, 10
  attribute :axis, Angle.new
  attribute :orbit, Angle.new

  def update
    sub_orbits.each(&:update)
  end

  def draw
    size = 20
    glPushMatrix
      glRotate angle, 0, 0, 0.1
      glTranslate length, length, 0
      glRotate -angle, 0, 0, 0.1
      half = -(size/2)
      glTranslated half, half, 0
      glBegin GL_QUADS
        glColor4f 1.0,1.0,1.0,1.0
        
        glVertex2i 0, 0
        glVertex2i size, 0
        glVertex2i size, size      
        glVertex2i 0, size
      glEnd

      sub_orbits.each(&:draw)
      
    glPopMatrix
  end
end
