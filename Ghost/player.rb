class Player

    def initialize(name)
        @name = name
    end

    def guess
        letter = gets.chomp
        self.alert_invalid_guess(letter)
    end

    def alert_invalid_guess(letter)
        if letter.length == 1 && ('a'..'z').include?(letter)
            return letter
        else
            puts "Invalid letter. Please type a letter"
            self.guess
        end
    end
end