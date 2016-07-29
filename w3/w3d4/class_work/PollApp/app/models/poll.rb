class Poll < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :author_id, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :questions,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Question

  def self.questions_per_poll
    poll_questions = {}
    questions = self
      .all
      .select("polls.title, COUNT(questions.*) AS num_questions")
      .joins("JOIN questions ON questions.poll_id = polls.id")
      .group("polls.id")

    questions.each do |question|
      poll_questions[question.title] = question.num_questions
    end

    poll_questions
  end

end
