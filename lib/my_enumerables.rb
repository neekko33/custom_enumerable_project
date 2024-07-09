module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    index = 0
    for i in self
      yield(i, index)
      index += 1
    end
  end

  def my_select
    self.my_each do |ele|
      return ele if yield(ele)
    end
    nil
  end

  def my_all?
    self.my_each do |ele|
      return false unless yield(ele)
    end
    true
  end

  def my_any?
    self.my_each do |ele|
      return true if yield(ele)
    end
    false
  end

  def my_none?
    self.my_each do |ele|
      return false if yield(ele)
    end
    true
  end

  def my_count
    count = 0
    self.my_each do |ele|
      if block_given?
        count += 1 if yield(ele)
      else
        count += 1
      end
    end
    count
  end

  def my_map
    result = []
    self.my_each do |ele|
      result << yield(ele)
    end
    result
  end

  def my_inject(initial_operand)
    result = initial_operand
    self.my_each do |ele|
      result = yield(result, ele)
    end
    result
  end
end
