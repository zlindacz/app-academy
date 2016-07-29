class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Poll

  has_many :responses,
    primary_key: :id,
    foreign_key: :respondent_id,
    class_name: :Response

  def completed_polls
    left_outer_join = <<-SQL
    LEFT OUTER JOIN (
      SELECT
        responses.*
      FROM
        responses
      WHERE
        respondent_id = #{self.id}) AS user_responses
      ON user_responses.answer_choice_id = answer_choices.id
    SQL
    completed = Poll.joins(questions: :answer_choices)
      .joins(left_outer_join).group("polls.id")
      .having("count(DISTINCT questions.*) = count(user_responses.*)")

    completed.map(&:title)
  end
end
