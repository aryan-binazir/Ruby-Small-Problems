class TodoList
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

  def each
    counter = 0

    while counter < list.size
      yield(list[counter])
      counter += 1
    end
    list
  end

  private
  
  attr_accessor :list
  attr_reader :name
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

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end