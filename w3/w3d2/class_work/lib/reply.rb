class Reply < ModelBase

  attr_accessor :body
  attr_reader :question_id, :parent_reply_id, :user_id

  # def self.all
  #   replies = QuestionsDatabase.instance.execute("SELECT * FROM replies")
  #   replies.map { |reply| Reply.new(reply) }
  # end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options["id"]
    @body = options["body"]
    @question_id = options["question_id"]
    @parent_reply_id = options["parent_reply_id"]
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

  def question
    result = QuestionsDatabase.instance.execute(<<-SQL, @question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    raise "can't find question" if result.empty?
    Question.new(result.first)
  end

  def parent_reply
    result = QuestionsDatabase.instance.execute(<<-SQL, @parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil if result.empty?
    Reply.new(result.first)
  end

  def child_replies
    results = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL

    return nil if results.empty?
    results.map { |reply| Reply.new(reply) }
  end

end
