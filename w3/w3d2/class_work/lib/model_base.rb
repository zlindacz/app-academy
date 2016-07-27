class ModelBase

  TABLE_NAMES = {User: "users",
                 Question: "questions",
                 Reply: "replies",
                 QuestionLike: "question_likes",
                 QuestionFollow: "question_follows"}

  def self.find_by_id(id)
    table_name = TABLE_NAMES[self.to_s.to_sym]
    id_results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL

    return nil if id_results.empty?
    self.new(id_results.first)
  end

  def self.all
    table_name = TABLE_NAMES[self.to_s.to_sym]
    results = QuestionsDatabase.instance.execute("SELECT * FROM #{table_name}")
    results.map { |result| self.new(result) }
  end


  def self.parse_for_where(options)
    parsed_arr = []
    options.each do |key, value|
      parsed_arr << "#{key.to_s} = '#{value}'"
    end
    parsed_arr.join(' AND ')
  end

  def self.where(options)
    table_name = TABLE_NAMES[self.to_s.to_sym]
    parsed_string = self.parse_for_where(options)
    QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{parsed_string}
    SQL
  end

  def table_name
    TABLE_NAMES[self.class.to_s.to_sym]
  end

  def parse_for_create
    variables = self.instance_variables # [:@id, :@fname, :@lname]
    variables.delete(:@id)
    insert_interpolation = variables.map { |var| var.to_s[1..-1] }
    values_interpolation = variables.map do |var|
      "'#{self.instance_variable_get(var)}'"
    end
    ["(#{insert_interpolation.join(', ')})",
      "(#{values_interpolation.join(', ')})"]
  end

  def parse_for_update
    variables = self.instance_variables # [:@id, :@fname, :@lname]
    variables.delete(:@id)
    set_interpolation = variables.map do |var|
      "#{var.to_s[1..-1]} = '#{self.instance_variable_get(var)}'"
    end
    # title = ?, body = ?, user_id = ?
    "#{set_interpolation.join(', ')}"
  end

  def save
    @id ? update : create
  end

  def create
    insert_interpolation, values_interpolation = parse_for_create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL)
      INSERT INTO
        #{table_name} #{insert_interpolation}
      VALUES
        #{values_interpolation}
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @id)
      UPDATE
        #{table_name}
      SET
        #{parse_for_update}
      WHERE
        id = ?
    SQL
  end

end
