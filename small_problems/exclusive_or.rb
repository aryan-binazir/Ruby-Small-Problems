
def xor?(arg1, arg2)
  return true if (arg1 && !arg2)
  return true if (arg2 && !arg1)
  false
end

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
