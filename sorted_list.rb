class SortedList
  include Enumerable

  def initialize
    @data = []
  end

  def <<(element)
    (@data << element).sort!
  end

  def >>(other)
    @data.delete(other)
  end

  def each(&block)
    @data.each(&block)
  end
end

list = SortedList.new

list << 1
list << 2
list << 3

list >> 2
list.each { |item| puts item }
