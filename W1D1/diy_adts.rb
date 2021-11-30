class Stack
  def initialize
    @stack = []
  end

  def push(element)
    @stack << element
  end

  def pop
    @stack.pop
  end

  def peek
    return @stack.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(element)
    @queue << element
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    self.delete(key) if @map.any? { |kv| kv[0] == key }
    @map << [key, value]
  end

  def get(key)
    @map.each { |kv| return kv[1] if kv[0] == key }
  end

  def delete(key)
    @map.each { |kv| @map.delete(kv) if kv[0] == key }
  end

  def show
    p @map
  end
end
