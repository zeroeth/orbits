require 'orbiter'

class OrbiterTree
  attr_accessor :root_node
  attr_accessor :window
  def initialize(window)
    self.window = window

    # build orbiter nest and set speed/direction/offset
    # build file of data..
    # load. read extents and set opengl to accomodate
    # delegate attribute
    # proper defaults
    # year value inverse
    sun = Orbiter.new :name => 'sun', :size => 1, :distance => 0
    mercury = Orbiter.new :name => 'mercury', :size => 0.383, :distance => 0.4, :axis_speed => 1407.5, :orbit_speed => 0.2408
    venus = Orbiter.new :name => 'venus', :size => 0.95, :distance => 0.7, :axis_speed => -5832, :orbit_speed => 0.6152
    earth = Orbiter.new :name => 'earth', :size => 1, :distance => 1.0, :axis_speed => 23.9, :orbit_speed => 1.0
    moon = Orbiter.new :name => 'moon', :size => 2, :distance => 20
    mars = Orbiter.new :name => 'mars', :size => 0.533, :distance => 1.5, :axis_speed => 24.622, :orbit_speed => 1.88

    jupiter = Orbiter.new :name => 'jupiter', :size => 11.3, :distance => 5.2, :axis_speed => 90.0, :orbit_speed => 11.859
    self.root_node = sun
    sun.sub_orbits.push mercury, venus, earth, mars, jupiter
    #earth.sub_orbits.push moon 
  end

  def update
    root_node.update
  end
  
  def draw
    glPushMatrix
      glTranslate window.width/2, window.height/2, 0
      root_node.draw
      # tree vs element.. rotation code in tree? element only knows its own code? sounds good.
    glPopMatrix
  end
end
