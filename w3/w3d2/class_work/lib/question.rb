class Question < ModelBase

  attr_accessor :title, :body
  attr_reader :user_id

  def self.find_by_author_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    return nil if questions.empty?
    questions.map { |question| Question.new(question) }
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @user_id = options["user_id"]
  end

  def author
    result = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    raise "can't find author" if result.empty?
    User.new(result.first)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
end
