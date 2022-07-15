class Element
  attr_reader :datum, :next
  attr_writer :next

  def initialize(datum, next_el=nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :list
  attr_writer :head

  def initialize
    @list = []
    @head = nil
  end

  def empty?
    list.empty?
  end

  def push(el)
    new_element = Element.new(el)
    new_element.next = head
    list.push(new_element)
    self.head = new_element
  end

  def pop
    list.pop.datum
  end

  def peek
    element = list.last
    element.nil? ? nil : element.datum
  end

  def head
    element = @head
    element.nil? ? nil : element
  end

  def self.from_a(array)
    array = [] if array.nil?

    new_element = SimpleLinkedList.new
    array.reverse_each { |datum| new_element.push(datum) }
    new_element
  end

  def size
    list.size
  end

  def to_a
    array = []
    current_el = head
    while !current_el.nil?
      array.push(current_el.datum)
      current_el = current_el.next
    end
    array
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_el = head
    while !current_el.nil?
      new_list.push(current_el.datum)
      current_el = current_el.next
    end
    new_list
  end
end
