def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

p compute { 'a' + 'b' } == 'ab'
p compute { 5 + 3 } == 8
p compute == 'Does not compute.'