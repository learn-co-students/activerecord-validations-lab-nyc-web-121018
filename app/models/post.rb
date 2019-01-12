class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validate  :is_clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }


  def is_clickbait
    title_needs = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title != nil
      click = title_needs.find do |comparison|
                self.title.include?(comparison) == true
              end
    end
    if click == nil
      errors.add(:title, "Title must be more clickbait-y")
    end
  end


end
