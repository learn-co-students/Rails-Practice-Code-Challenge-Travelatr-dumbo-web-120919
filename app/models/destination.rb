class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        self.posts.last(5)
    end

    def average_age
        total_bloggers = self.bloggers.uniq.length
        sum_of_ages = self.bloggers.uniq.sum{|blogger| blogger.age}
        sum_of_ages / total_bloggers
    end
end
