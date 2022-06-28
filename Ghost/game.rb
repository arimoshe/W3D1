class Game

    def initialize(*players, fragment, dictionary)
        @player_1 = players[0]
        @player_2 = players[1]
        @current_player = @player_1
        @previous_player = @player_2
        @fragment = fragment
        @dictionary = {}
        dictionary.each do |word|
            @dictionary[word] = true
        end

    end
    
    def current_player
        @current_player
    end

    def previous_player
        @previous_player
    end

    def next_player!
        if @current_player == @player_1
            @previous_player = @current_player
            @current_player = @player_2
        else   
            @previous_player = @current_player
            @current_player = @player_1
        end
    end

    def take_turn(player)
        guess = player.guess
        if valid_play?(guess)
            @fragment += guess
        end 
        if lose?(guess) 
            puts "#{@current_player.name} loses."
        else
            @fragment += guess
            self.next_player!
            take_turn(@current_player)
        end
    end

    def valid_play?(guess)
        @dictionary.keys.any? do |word|
            word[0..@fragment.length].include?(@fragment + guess)
        end
    end

    def lose?(guess)
        
    end

end