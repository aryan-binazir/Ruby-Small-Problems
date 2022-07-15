status = ['awake', 'tired'].sample
message = ''

if status == 'awake'
  message = 'Be productive!'
else 
  message = 'Go to sleep!'
end

puts message