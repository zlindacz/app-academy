class Question < ActiveRecord::Base
  validates :question, presence: true, uniqueness: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def n_plus_one_count_results
    answer_choices = self.answer_choices
    choices = {}
    answer_choices.each do |choice|
      choices[choice.answer_choice] = choice.responses.length
    end
    choices
  end

  def better_count_results
    answer_choices = self.answer_choices.includes(:responses)
    choices = {}
    answer_choices.each do |choice|
      choices[choice.answer_choice] = choice.responses.length
    end
    choices
  end

  def best_count_results
    response_count = {}

    answer_choices = self
      .answer_choices
      .select("answer_choices.*, COUNT(responses.*) AS num_responses")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .group("answer_choices.id")

    answer_choices.each do |choice|
      response_count[choice.answer_choice] = choice.num_responses
    end

    response_count
  end
end
