# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT name
    FROM countries
    WHERE gdp > (
      SELECT max(gdp)
      FROM countries
      WHERE continent = 'Europe'
    )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT continent, name, area
    FROM countries
    WHERE (continent, area) IN (
      SELECT continent, max(area)
      FROM countries
      GROUP BY continent
    )
    ORDER BY continent
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.

  execute(<<-SQL)
    SELECT largest_countries.name, largest_countries.continent
    FROM countries AS largest_countries
    WHERE largest_countries.population > (SELECT 3*MAX(second_largest_countries.population)
      FROM countries AS second_largest_countries
      WHERE largest_countries.name != second_largest_countries.name
        AND largest_countries.continent = second_largest_countries.continent)
    GROUP BY largest_countries.continent, largest_countries.name
  SQL

end
