BLOCK_PAIRS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(str)
  upcase_str = str.upcase
  BLOCK_PAIRS.none? { |pair| upcase_str.count(pair) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
