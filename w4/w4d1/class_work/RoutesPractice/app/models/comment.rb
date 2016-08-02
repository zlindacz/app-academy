class Comment < ActiveRecord::Base
  validates :body, presence: true, uniqueness: true

  belongs_to :commentable, polymorphic: true
end
