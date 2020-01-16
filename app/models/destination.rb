class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts(num)
    most_recent_posts = self.posts.last(num)
  end

  def most_liked_post
    posts = self.posts
    posts.max_by { |post| post[:likes] }
  end

  def average_age
    bloggers = self.bloggers
    bloggers = bloggers.uniq
    blogger_count = bloggers.count
    total_age = 0
    bloggers.each do |b|
      total_age += b.age 
    end
    average_age = (total_age / blogger_count)
    average_age
  end

end