require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
require 'byebug'

class SQLObject

  def self.columns
    table = self.table_name
    @table_names ||= DBConnection.execute2(<<-SQL)
      SELECT * FROM #{table}
    SQL
    @table_names.first.map { |name| name.to_sym }
  end

  def self.finalize!
    self.columns.each do |col_name|
      define_method(col_name) do
        attributes[col_name]
      end

      define_method("#{col_name}=") do |value|
        attributes[col_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.ancestors.first.to_s.tableize
  end

  def self.all
    table = "#{self.table_name}"
    rows = DBConnection.execute(<<-SQL)
      SELECT
        #{table}.*
      FROM
        #{table}
    SQL
    self.parse_all(rows)
  end

  def self.parse_all(results)
    objects = []
    results.each do |col_values|
      new_self = self.new(col_values)
      finalize!
      objects << new_self
    end
    objects
  end

  def self.find(id)
    table = "#{self.table_name}"
    result = DBConnection.execute(<<-SQL, id)
      SELECT * FROM #{table} WHERE #{table}.id = ?
    SQL
    self.parse_all(result).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" unless
      self.class.columns.include?(attr_name)

      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |attribute|
      self.send(attribute)
    end
  end

  def insert
    table = "#{self.class.table_name}"
    cols = self.class.columns.drop(1)
    col_names = cols.map(&:to_s).join(', ')
    question_marks = (["?"] * cols.count).join(', ')
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{table} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    table = "#{self.class.table_name}"
    set_line = self.class.columns.map do |attr_name|
      "#{attr_name} = ?"
    end.join(', ')
    id = self.id
    DBConnection.execute(<<-SQL, *attribute_values)
      UPDATE
        #{table}
      SET
        #{set_line}
      WHERE
        id = #{id}
    SQL
  end

  def save
    self.id.nil? ? insert : update
  end
end
