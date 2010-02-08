require 'base_class'

class Angle < BaseClass
  attribute :angle, 0
  attribute :rpm, 10
  attribute :steps, :smooth
  attribute :type, :absolute

  def initialize(options = {})
    write_attribute :defaults, {:angle=>0, :rpm=>1, :steps=>:smooth, :type=>:absolute}
    super options
  end

  def update
    self.angle = angle + rpm
  end
end
