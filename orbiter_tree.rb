require 'orbiter'

class OrbiterTree
  attr_accessor :root_node
  attr_accessor :window
  def initialize(window)
    self.window = window

    # build orbiter nest and set speed/direction/offset
    sun = Orbiter.new
    earth = Orbiter.new
    jupiter = Orbiter.new
    moon = Orbiter.new
    self.root_node = Orbiter.new
    sun.sub_orbits.push earth, jupiter
    earth.sub_orbits.push moon 
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
