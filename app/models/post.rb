class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( Non-Fiction Fiction)}
  validate :is_clickbait?

  # def is_clickbait?
  #     clickbait_titles = ["Won't Believe", "Secret", "Top" , "Guess"]
  #     clickbait_titles.any? {|bait| self.title.to_s.include? sbait}
  # end

  # def is_clickbait?
  #   clickbait_titles = ["Won't Believe", "Secret", "Top" , "Guess"]
  #   if clickbait_titles.none? { |bait| self.title.include? bait }
  #     errors.add(:title, "must be clickbait")
  #   end
  # end
end
