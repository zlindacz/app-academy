class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validate :no_more_than_five

  has_many :shortened_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls,
    -> { distinct },
    through: :visits,
    source: :shortened_url

  has_many :taggings,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Tagging

  has_many :tag_topics,
    -> { distinct },
    through: :taggings,
    source: :tag_topics

    def no_more_than_five
      previously_submitted = ShortenedUrl.where(user_id: id, created_at: 1.minutes.ago)
      unless previously_submitted.length < 5
        errors[:too_many] << "URLs submitted within the last minute"
      end
    end

    def visited_urls_distinct
      visited_urls.count
      # self.visited_urls { self.visits.shortened_url_id }
      # self.visited_urls { shortened_urls }
    end
end
