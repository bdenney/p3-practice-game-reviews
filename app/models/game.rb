class Game < ActiveRecord::Base    
    belongs_to :category
    has_many :reviews
    has_many :users, through: :reviews

    def average_rating
        total = reviews.reduce(0) do |sum, curr|
            sum + curr.rating
        end

        total.to_f / reviews.length.to_f
    end

    def self.find_by_platform(platform)
        Game.all.filter do |game|
            game.platform == platform
        end
    end
end