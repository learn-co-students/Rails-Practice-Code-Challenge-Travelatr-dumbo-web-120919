class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  def total_likes
    total_likes = 0
    self.posts.each do |post|
      post_likes = post.likes
      total_likes += post_likes
    end
    total_likes
  end

  def most_liked_post
    posts = self.posts
    posts.max_by { |post| post[:likes] }
  end

  def top_five_destinations
    destinations = self.destinations
    destination_count = {}
    destinations.each do |dest|
      all_posts = dest.posts
      post_num = all_posts.count 
      destination_count[dest] = post_num
    end
    sorted = destination_count.sort_by { |d, num| num }
    top_five_destinations = sorted.last(5)
    top_five_array = top_five_destinations.collect{|dest_array| dest_array[0]}
    top_five_array
  end

end
