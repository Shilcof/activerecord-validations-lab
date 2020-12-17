class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :summary, length: { maximum: 250 }
    validates :content, length: { minimum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction) }
    validates_each :title do |record, attr, value|
        record.errors.add(attr, "must be clickbaity") if value && !value.match(/(Won't Believe)|(Secret)|(Top \d*)|(Guess)/)
    end
end
