require './lib/field'


field = Field.new

while true
  puts field
  puts '------------------------------------'
  field.next_step
  sleep 0.1
end

