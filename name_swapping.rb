def swap_name(name)
  arr_name = name.split
  "#{arr_name[1]}, #{arr_name[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
