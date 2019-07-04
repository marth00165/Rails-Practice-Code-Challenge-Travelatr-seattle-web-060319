class Blogger < ApplicationRecord
  validates :name, {presence: true, uniqueness: true}
  validates :age, {presence: true, numericality: { greater_than: 0 }}
  validates :bio, length: {minimum: 30}
  has_many :posts


  def total_likes
    self.posts.map { |post| post.likes }.sum
  end

  def most_liked
    self.posts.sort_by{|post| post.likes}.last
  end












end
