require 'pry'
class Node
    attr_accessor :data, :child, :parent

    def initialize(data)
        @data = data
        @child = nil
        @parent = nil
    end
end

class Options
    def initialize()
        @possibilities = [[1, 2], [2, 1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-1, -2], [-2, -1]]
        @used = []
    end

    def nextMove(data, goal)
        return goal if data.include?(goal)
        temp = []
        if data == [[4, 4]]
            root = Node.new(data)
        end
        queue = [data]
        while queue 
            data.each do |arr|
                temp = getNext(arr)
                data.shift
                temp.each do |dataValue|
                    data.push(dataValue)
                end
                if data.include?([4, 4])
                    binding.pry
                    queue = false
                    break
                end
            end
        end
        puts "s"
    end

    def getNext(arr)
        temp = []
        @possibilities.each do |num|
            x = arr[0] + num[0]
            y = arr[1] + num[1]
            if @used.include?([x, y]) == false
                temp.push([x, y])
                @used.push([x, y])
            end
        end
    return temp
    end

end

knight = Options.new

p knight.nextMove([[4, 4]], [1,1])