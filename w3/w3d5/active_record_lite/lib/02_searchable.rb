require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    table = "#{self.table_name}"
    where_line = params.keys.map do |attr_name|
      "#{attr_name} = ?"
    end.join(' AND ')

    results = DBConnection.execute(<<-SQL, *params.values)
      SELECT * FROM #{table} WHERE #{where_line}
    SQL
    self.parse_all(results)
  end
end

class SQLObject
  extend Searchable
end
