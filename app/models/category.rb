class Category < ActiveRecord::Base
    has_many :games    

    def platforms
        available_platforms = []

        games.each do |game|
            if !available_platforms.include? game.platform
                available_platforms << game.platform
            end
        end

        available_platforms
    end

    def self.highest_rated
        highest_rated_game = nil
        highest_rating = -1.0;
        Game.all.each do |game|
            game_average = game.average_rating
            if game_average > highest_rating
                highest_rating = game_average
                highest_rated_game = game
            end
        end
        highest_rated_game.category
    end
end