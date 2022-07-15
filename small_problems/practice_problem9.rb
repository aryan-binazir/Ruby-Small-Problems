arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |subarr|
  subarr.sort do |element1, element2|
    element2 <=> element1
  end
end
