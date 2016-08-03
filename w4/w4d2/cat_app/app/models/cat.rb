class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(black white orange brown gray),
  message: "%{value} is not a real color"}
  validates :birth_date, :uniqueness =>
   {:scope => [:color, :name, :sex, :description]}
validates :sex, inclusion: { in: %w(M F),
  message: "Please choose M or F"}

  has_many :cat_rental_requests, dependent: :destroy

  def age
    Time.now.year - self.birth_date.year
  end
end
