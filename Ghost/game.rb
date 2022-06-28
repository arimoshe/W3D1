class Game

    def initialize(*players, fragment, dictionary)
        @player_1 = players[0]
        @player_2 = players[1]
        @current_player = @player_1
        @fragment = fragment
        @dictionary = {}
        dictionary.each do |word|
            @dictionary[word] = true
        end

    end
    
    def current_player
        @current_player
    end

    

end