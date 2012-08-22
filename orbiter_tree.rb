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

    # web app for entering new orbit trees
    #
    self.root_node = Orbiter.first
  end

  def update
    root_node.update
  end
  
  def draw
    glPushMatrix
      glTranslate window.width/2, window.height/2, 0
      #glScale 6, 6, 6 # should map AU to screen space
      root_node.draw_borders(true)
      root_node.draw(false)
      # tree vs element.. rotation code in tree? element only knows its own code? sounds good.
    glPopMatrix
  end
end
