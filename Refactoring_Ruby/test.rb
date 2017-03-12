require 'english'
at_exit do
  if $!
    puts "We crashed! #{$ERROR_INFO.inspect}"
  else
    puts "fin"
  end
end

raise "blah"
