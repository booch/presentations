class Quaternion
  attr_accessor :i
  def initialize(i)
    self.i = i
  end
  def +(other)
    case other
    when Quaternion
      Quaternion.new(self.i + other.i)
    else
      Quaternion.new(self.i + other)
    end
  end
    def coerce(other)
    puts "Quaternion#coerce called"
    [Quaternion.new(other), self]
  end

  def to_s
    "Quaternion(#{i})"
  end
end
puts 2 + Quaternion.new(1)
