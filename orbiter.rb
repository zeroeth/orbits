require 'rubygems'
require 'dm-core'

# If you want the logs displayed you have to do this before the call to setup
DataMapper::Logger.new($stdout, :debug)

# An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite3:orbits.lite')

require 'base_class'
require 'rubygems'
require 'gl'
require 'glu'

include Gl
include Glu

require 'angle'

class Orbiter
  include DataMapper::Resource

  has n, :sub_orbits, 'Orbiter'
  belongs_to :orbiter, :required => false

  property :id, Serial
  property :distance, Float, :default => 2.0
  property :size, Float, :default => 20.0
  property :orbit_speed, Float, :default => 1.0
  property :orbit_angle, Float, :default => 0.0
  property :axis_speed, Float, :default => 1.0
  property :axis_angle, Float, :default => 0.0
  property :name, String, :default => 'unamed'
  def color
    @color ||= {:red => rand, :green => rand, :blue => rand, :alpha => 1.0}
  end

  def parent=(value)
    parent = Orbiter.first(:name => value)
    self.orbiter = parent unless parent.nil?
  end

  def update
    $log.info "#{name} :: #{object_id} :: update #{orbit_angle} #{axis_angle}"
    self.orbit_angle += 1/orbit_speed unless orbit_speed == 0
    self.axis_angle += axis_speed unless axis_speed == 0
    sub_orbits.each(&:update)
  end

  # normalize all these into values relating to each other, and scale universe accordingly
  def axis_speed
    attribute_get(:axis_speed) * 1
  end

  def orbit_speed
    attribute_get(:orbit_speed) * 0.1
  end

  def size
    size = attribute_get(:size)
    size > 100 ? 5 : size
  end

  # separate into a 'view'
  def draw
    $log.info "#{name} :: #{object_id} :: draw"
    glPushMatrix
      glRotate orbit_angle, 0, 0, 1
      glTranslate distance, distance, 0 # not precise..
      glRotate -orbit_angle, 0, 0, 1 # if relative

      glPushMatrix
        glRotate axis_angle, 0, 0, 1
        glBegin GL_TRIANGLE_FAN
          resolution = 20
          glVertex2i 0, 0
          step = (Math::PI*2)/resolution
          (resolution+1).times do |n|
            glColor4f *[color[:red], color[:green], color[:blue], color[:alpha]]
            glVertex2i Math::sin(n*step)*size*0.5, Math::cos(n*step)*size*0.5
          end
        glEnd
      glPopMatrix

      sub_orbits.each(&:draw)
      
    glPopMatrix
  end
end
