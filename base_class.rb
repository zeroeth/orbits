class BaseClass
  attr_accessor :defaults

  def self.attribute(sym, default = nil)
     raise 'Default value or block required' unless !default.nil?
     #define_method(sym, block_given? ? block : Proc.new { default })
     class_eval "attr_accessor :#{sym}"
     #@@defaults ||= {}
     #@@defaults[sym] = default.kind_of?(Proc) ? default : Proc.new { default }
     #puts @@defaults.collect{|k,v| [k, v.class]}.inspect
  end

  def write_attribute(name, value)
    send "#{name}=", value
  end

  def initialize(options = {})
    #@@defaults.each{|name, value| defaults[name] = value.call }
    options = (defaults || {}).merge options
    options.each{|name, value| write_attribute name, value}
  end
end
