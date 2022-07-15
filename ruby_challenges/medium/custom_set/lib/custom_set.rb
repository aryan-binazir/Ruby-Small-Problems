class CustomSet
  def initialize(array=[])
    @set = array.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include?(element)
  end

  def subset?(other_obj)
    return true if set.empty?

    set.each do |element|
      return false unless other_obj.set.include?(element)
    end
    true
  end

  def disjoint?(other_obj)
    return true if set.empty?

    set.each do |element|
      return false if other_obj.set.include?(element)
    end
    true
  end

  def eql?(other_obj)
    # binding.pry
    return false unless set.length == other_obj.set.length

    set.all? { |element| other_obj.set.include?(element) }
  end

  def add(element)
    set.push(element) unless contains?(element)
    self
  end

  def intersection(other_obj)
    result = []

    set.each do |element|
      included = other_obj.set.include?(element)
      result.push(element) if included
    end
    CustomSet.new(result)
  end

  def difference(other_obj)
    result = []
    set.each do |element|
      not_included = other_obj.set.include?(element)
      result.push(element) unless not_included
    end
    CustomSet.new(result)
  end

  def union(other_obj)
    result = (set + other_obj.set).uniq
    CustomSet.new(result)
  end

  def ==(other_obj)
    eql?(other_obj)
  end

  protected

  attr_reader :set
end
