
class Player
    
    attr_reader :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def select_field
        puts "#{@name}, select a field to place your symbol"
        gets.chomp.to_i
    end
end