class A
  def a
    1
  end
end

class B < A
  def a
    2
  end
end

puts B.new.a
# => 2

class B
  undef a
end

puts B.new.a

