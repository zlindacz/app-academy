class Comment < ActiveRecord::Base
  validates :body, :commentable_type, :commentable_id, presence: true

  belongs_to :commentable, polymorphic: true
end
