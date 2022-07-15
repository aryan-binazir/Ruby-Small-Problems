class TodoList
  attr_accessor :list
  attr_reader :name

  def initialize(name)
    @name = name
    @list = []
  end

  def add(item)
    raise TypeError, "Can only add Todo objects" unless item.class == Todo
    self.list << item
  end

  alias_method :<<, :add

  def size
    list.size
  end

  def first
    list.first
  end

  def last
    list.last
  end

  def to_a
    list.clone
  end

  def done?
    list.all? { |item| item.done? }
  end

  def item_at(index)
    list.fetch(index)
  end

  def mark_done_at(index)
    list.fetch(index).done = true
  end

  def mark_undone_at(index)
    list.fetch(index).done = false
  end

  def done!
    list.each do |item|
      item.done = true
    end
  end

  def shift
    list.shift
  end

  def pop
    list.pop
  end

  def remove_at(index)
    return_value = list.fetch(index)
    list.delete_at(index)
    return_value
  end
  
  def to_s
    system "clear"
    puts "----#{name}----"
    return_str = list.shift.to_s
    list.each do |item|
      return_str += "\n" + item.to_s
    end
    return_str
  end
end


class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# # ---- Interrogating the list -----

# # size
puts list.size                       # returns 3

# first
puts list.first                      # returns todo1, which is the first item in the list

# last
puts list.last                       # returns todo3, which is the last item in the list

#to_a
puts list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# puts list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done
 
# ---- Deleting from the list -----

# shift
# puts list.shift                      # removes and returns the first item in list

# pop
# puts list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# puts list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
puts list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym