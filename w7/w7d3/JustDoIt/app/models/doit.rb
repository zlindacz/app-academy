class Doit < ActiveRecord::Base
  validates :title, :body, presence: true
end
