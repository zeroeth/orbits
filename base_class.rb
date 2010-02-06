class BaseClass
  attr_accessor :defaults

  def self.attribute(sym, default = nil, &block)
     raise 'Default value or block required' unless !default.nil? || block
     define_method(sym, block_given? ? block : Proc.new { default })
     class_eval("def #{sym}=(value)\nclass << self; attr_reader :#{sym} end\n@#{sym} = value\nend\n", __FILE__, __LINE__)
  end

  def write_attribute(name, value)
    send "#{name}=", value
  end

  def initialize(options = {})
    defaults = {} if defaults.nil?
    options = defaults.merge options
    options.each{|name, value| write_attribute name, value}
  end
end
