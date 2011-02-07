# GEMS
require 'rubygems'
require 'bundler/setup'
require 'gl'
require 'glu'
require 'dm-core'

include Gl
include Glu

# LOCALS
require 'base_class'
require 'angle'


# SETUP

# If you want the logs displayed you have to do this before the call to setup
DataMapper::Logger.new($stdout, :debug)

# An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite3:orbits_planets.lite')


class Orbiter
  include DataMapper::Resource

  has n, :sub_orbits, 'Orbiter'
  belongs_to :orbiter, :required => false

  property :id, Serial
  property :distance,    Float, :default =>  1.0 # Astronomical Units 154.5 million kilometers.
  property :size,        Float, :default =>  1.0 # Radius ratio to 1 Earth 6,710 kilometers.
  property :orbit_speed, Float, :default =>  1.0 # Earth Years
  property :orbit_angle, Float, :default =>  0.0 
  property :axis_speed,  Float, :default =>  1.0 # Earth Days
  property :axis_angle,  Float, :default =>  0.0
  property :name, String, :default => 'unamed'

  def color
    @color ||= {:red => rand, :green => rand, :blue => rand, :alpha => 1.0}
  end

  def parent=(value)
    parent = Orbiter.first(:name => value)
    self.orbiter = parent unless parent.nil?
  end

  def update
    if $window.fps > 0
      $log.info "[#{$window.fps}] #{name} :: #{object_id} :: update #{orbit_angle} #{axis_angle}"
      self.orbit_angle += orbit_speed if orbit_speed.finite?
      self.axis_angle += axis_speed if axis_speed.finite?
      sub_orbits.each(&:update)
    end
  end

  # normalize all these into values relating to each other, and scale universe accordingly
  def axis_speed
    (1.0/attribute_get(:axis_speed)) * ((2.0*Math::PI)/($window.fps+0.01))
  end

  def orbit_speed
    (1.0/attribute_get(:orbit_speed)) * ((2.0*Math::PI)/($window.fps+0.01))
  end

  def size
    size = attribute_get(:size)
    size = size > 100 ? 0.1 : size
    10
  end

  def distance
    distance = attribute_get(:distance)
    if id == 1
      0
    else
      $window.height/3.0
      (id-1) * (($window.height*1.0)/3.0/9.0)
    end
  end

  # separate into a 'view'
  def draw
    glPushMatrix
      glRotate orbit_angle, 0, 0, 1
      glTranslate distance, distance, 0 # not precise..
      glRotate -orbit_angle, 0, 0, 1 # if relative

      glPushMatrix
        glRotate axis_angle, 0, 0, 1
        glBegin GL_TRIANGLE_FAN
          resolution = 6
          glVertex2i 0, 0
	  # TODO replace with display list, and a scale
          step = (Math::PI*2)/resolution
          (resolution+1).times do |n|
            glColor4f *[color[:red], color[:green], color[:blue], color[:alpha]]
            glVertex2f Math::sin(n*step)*size, Math::cos(n*step)*size
          end
        glEnd
      glPopMatrix

      sub_orbits.each(&:draw)
      
    glPopMatrix
  end
end
