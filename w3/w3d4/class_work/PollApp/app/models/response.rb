class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, presence: true
  validate :respondent_already_answered, :not_author


  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :respondent_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: id)
  end

  def respondent_already_answered
    if self.sibling_responses.exists?(respondent_id: respondent_id)
      errors[:duplicate_response] << "You have already answered this question"
    end
  end

  def not_author
    if self.question.poll.author.id == respondent_id
      errors[:own_poll] << "You can't answer your own poll"
    end
  end




end
