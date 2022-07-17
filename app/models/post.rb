class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :title_is_clickbait?

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def title_is_clickbait?
        if CLICKBAIT.none? {|titleEl| titleEl.match title} 
            errors.add(:title, "not clickbait-y enough")
        end
    end

end
