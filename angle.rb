require 'base_class'

class Angle < BaseClass
  attribute :axis_angle, 0
  attribute :axis_rpm,   10
  attribute :axis_steps, :smooth
  attribute :axis_type, :absolute
end
