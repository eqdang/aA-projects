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
    WHERE
      gdp > (
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
    SELECT DISTINCT
      a.continent, STRING_AGG (a.name, ' ') AS country_name, a.area/1.0
    FROM countries a
    JOIN countries b 
      ON a.continent = b.continent AND a.area = b.area AND a.name = b.name
    WHERE a.area > (
      SELECT b.area
      FROM countries
      WHERE a.continent = b.continent
    )
    GROUP BY a.continent
    LIMIT 1

  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT name, continent
    FROM countries
    JOIN 
  SQL
end
