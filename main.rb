class Node
  attr_accessor :data, :parent

  def initialize(data)
    @data = data
    @parent = nil
  end
end

class Options
  def initialize()
    @possibilities = [[1, 2], [2, 1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-1, -2], [-2, -1]]
    @used = []
  end

  def nextMove(original, goal)
    final = 0
    return goal if original == goal
    temp = []
    root = Node.new(original)
    data = [root]
    data.each do |arr|
      root = arr
      arr = arr.data
      temp = getNext(arr, root)
      data.shift
      temp.each do |dataValue|
        data.push(dataValue)
      end
      data.each do |dataValue|
        if dataValue.data == goal
          final = dataValue
          break
        end
      end
    end
    counter = 0
    finalPath = [final.data]
    while final.data != original
      counter += 1
      final = final.parent
      finalPath << final.data
    end
    puts "You made it in #{counter} moves! Here's your path: "
    puts ""
    final = final.parent
    finalPath.reverse!
    finalPath.each do |i|
      print i
      puts ""
    end
  end

  def getNext(arr, root)
    temp = []
    @possibilities.each do |num|
      x = arr[0] + num[0]
      y = arr[1] + num[1]
      test = Node.new([x, y])
      if @used.include?(test.data) == false && x.between?(0, 7) && y.between?(0, 7)
        test.parent = root
        temp.push(test)
        @used.push([x, y])
      end
    end
    return temp
  end
end

knight = Options.new

knight.nextMove([0, 0], [7, 7])
