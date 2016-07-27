class QuestionFollow < ModelBase

  attr_reader :user_id, :question_id

  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_follows AS qf
      JOIN
        users ON qf.user_id = users.id
      WHERE
        qf.question_id = ?
    SQL
    return nil if users.empty?
    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_follows AS qf
      JOIN
        questions ON qf.question_id = questions.id
      WHERE
        qf.user_id = ?
    SQL
    return nil if questions.empty?
    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_follows AS qf
      JOIN
        questions ON qf.question_id = questions.id
      GROUP BY
        qf.question_id
      ORDER BY
        COUNT(qf.question_id) DESC
      LIMIT
        ?
    SQL

    return nil if questions.empty?
    questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @user_id = options["user_id"]
    @question_id = options["question_id"]
  end

  def create
    raise "#{self} already exists in database" if @user_id && @question_id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id)
      INSERT INTO
        question_follows (user_id, question_id)
      VALUES
        (?, ?)
    SQL
  end


end
