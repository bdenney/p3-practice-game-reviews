class User < ActiveRecord::Base
    has_many :reviews
    has_many :games, through: :reviews
    
    
    def write_review(game, content, rating)
        Review.create(content: content, rating: rating,  user: self, game: game)
    end

    def self.most_reviews
        user_with_most_reviews = nil
        most_reviews = -1
        User.all.each do |user|
            number_of_reviews = user.reviews.length
            if number_of_reviews > most_reviews
                user_with_most_reviews = user
            end
        end
        user_with_most_reviews
    end
end