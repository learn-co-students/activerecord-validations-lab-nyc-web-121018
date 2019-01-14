class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:summary, { :length => { :maximum => 250 } })
  validates(:content, { :length => { :minimum => 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?
  CLICKBAIT_TITLES = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait?
    if CLICKBAIT_TITLES.none? { |word| word.match title }
      errors.add(:title, "not clickbait")
    end
  end
end
