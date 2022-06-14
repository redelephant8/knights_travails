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
    end

    def nextMove(data, goal)
        return goal if data.include?(goal)
        temp = []
        if data == [[4, 4]]
            root = Node.new(data)
        end

        data.each do |arr|
            @possibilities.each do |num|
                x = arr[0] + num[0]
                y = arr[1] + num[1]
                temp.push([x, y])
            end
        end
        queue=[]
        temp.each do |arr|
            

        root = Node.new(temp)
        root.child = nextMove(temp, goal)
    end

end

knight = Options.new

p knight.nextMove([[4, 4]], [0,0])