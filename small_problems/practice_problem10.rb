arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  hsh2 = {}
  hsh.each do |key, value|
    hsh2[key] = value + 1
  end
  hsh2
end
