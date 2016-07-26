# == Schema Information
#
# Table name: stops
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: routes
#
#  num         :string       not null, primary key
#  company     :string       not null, primary key
#  pos         :integer      not null, primary key
#  stop_id     :integer

require_relative './sqlzoo.rb'

def num_stops
  # How many stops are in the database?
  execute(<<-SQL)
    SELECT count(*)
    FROM stops
  SQL
end

def craiglockhart_id
  # Find the id value for the stop 'Craiglockhart'.
  execute(<<-SQL)
    SELECT id
    FROM stops
    WHERE name = 'Craiglockhart'
  SQL
end

def lrt_stops
  # Give the id and the name for the stops on the '4' 'LRT' service.
  execute(<<-SQL)
    SELECT stops.id, stops.name
    FROM stops
    JOIN routes
      ON stops.id = routes.stop_id
    WHERE routes.num = '4' AND routes.company = 'LRT'
  SQL
end

def connecting_routes
  # Consider the following query:
  #
  # SELECT
  #   company,
  #   num,
  #   COUNT(*)
  # FROM
  #   routes
  # WHERE
  #   stop_id = 149 OR stop_id = 53
  # GROUP BY
  #   company, num
  #
  # The query gives the number of routes that visit either London Road
  # (149) or Craiglockhart (53). Run the query and notice the two services
  # that link these stops have a count of 2. Add a HAVING clause to restrict
  # the output to these two routes.
  execute(<<-SQL)
    SELECT
      company, num, COUNT(*)
    FROM
      routes
    WHERE
      stop_id = 149 OR stop_id = 53
    GROUP BY
      company, num
    HAVING
      count(*) = 2
  SQL
end

def cl_to_lr
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   a.stop_id,
  #   b.stop_id
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # WHERE
  #   a.stop_id = 53
  #
  # Observe that b.stop_id gives all the places you can get to from
  # Craiglockhart, without changing routes. Change the query so that it
  # shows the services from Craiglockhart to London Road.
  execute(<<-SQL)
    SELECT
      cl.company, cl.num, cl.stop_id, lr.stop_id
    FROM
      routes AS cl
    JOIN
      routes AS lr
      ON (cl.company = lr.company AND cl.num = lr.num)
    WHERE
      cl.stop_id = 53 AND lr.stop_id = 149
  SQL
end

def cl_to_lr_by_name
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   stopa.name,
  #   stopb.name
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # JOIN
  #   stops stopa ON (a.stop_id = stopa.id)
  # JOIN
  #   stops stopb ON (b.stop_id = stopb.id)
  # WHERE
  #   stopa.name = 'Craiglockhart'
  #
  # The query shown is similar to the previous one, however by joining two
  # copies of the stops table we can refer to stops by name rather than by
  # number. Change the query so that the services between 'Craiglockhart' and
  # 'London Road' are shown.
  execute(<<-SQL)
    SELECT
      cl.company,
      cl.num,
      cl_stops.name,
      lr_stops.name
    FROM
      routes AS cl
    JOIN
      routes AS lr
      ON (cl.company = lr.company AND cl.num = lr.num)
    JOIN
      stops as cl_stops
      ON (cl_stops.id = cl.stop_id)
    JOIN
      stops as lr_stops
      ON (lr_stops.id = lr.stop_id)
    WHERE
      lr_stops.name = 'London Road' AND cl_stops.name = 'Craiglockhart'
  SQL
end

def haymarket_and_leith
  # Give the company and num of the services that connect stops
  # 115 and 137 ('Haymarket' and 'Leith')
  execute(<<-SQL)
    SELECT DISTINCT
      hm.company, hm.num
    FROM
      routes AS hm
    JOIN
      routes AS leith
      ON hm.company = leith.company AND hm.num = leith.num
    WHERE
      hm.stop_id = 115 AND leith.stop_id = 137
  SQL
end

def craiglockhart_and_tollcross
  # Give the company and num of the services that connect stops
  # 'Craiglockhart' and 'Tollcross'
  execute(<<-SQL)
    SELECT DISTINCT
      cl.company, cl.num
    FROM
      routes AS cl
    JOIN
      routes AS tc
      ON cl.company = tc.company AND cl.num = tc.num
    JOIN
      stops AS cl_stops
      ON cl.stop_id = cl_stops.id
    JOIN
      stops AS tc_stops
      ON tc.stop_id = tc_stops.id
    WHERE cl_stops.name = 'Craiglockhart' AND tc_stops.name = 'Tollcross'
  SQL
end

def start_at_craiglockhart
  # Give a distinct list of the stops that can be reached from 'Craiglockhart'
  # by taking one bus, including 'Craiglockhart' itself. Include the stop name,
  # as well as the company and bus no. of the relevant service.
  execute(<<-SQL)
    SELECT DISTINCT
      dests.name, cl_routes.company, cl_routes.num
    FROM
      stops AS cl
    JOIN routes AS cl_routes
      ON cl_routes.stop_id = cl.id
    JOIN routes AS dests_routes
      ON cl_routes.company = dests_routes.company
        AND cl_routes.num = dests_routes.num
    JOIN stops AS dests
      ON dests.id = dests_routes.stop_id
    WHERE
      cl.name = 'Craiglockhart'
  SQL
end

def craiglockhart_to_sighthill
  # Find the routes involving two buses that can go from Craiglockhart to
  # Sighthill. Show the bus no. and company for the first bus, the name of the
  # stop for the transfer, and the bus no. and company for the second bus.
  execute(<<-SQL)
    SELECT DISTINCT
      cl_routes.num, cl_routes.company, transfer_stops.name, sh_routes.num, sh_routes.company
    FROM
      stops as cl_stop
    JOIN routes as cl_routes
      ON cl_routes.stop_id = cl_stop.id
    JOIN routes as first_transfer_routes
      ON first_transfer_routes.company = cl_routes.company
      AND first_transfer_routes.num = cl_routes.num
    JOIN stops as transfer_stops
      ON transfer_stops.id = first_transfer_routes.stop_id
    JOIN routes as second_transfer_routes
      ON second_transfer_routes.stop_id = transfer_stops.id
    JOIN routes as sh_routes
      ON sh_routes.company = second_transfer_routes.company
      AND sh_routes.num = second_transfer_routes.num
    JOIN stops as sh_stop
      ON sh_stop.id = sh_routes.stop_id
    WHERE
      cl_stop.name = 'Craiglockhart' AND sh_stop.name = 'Sighthill'
  SQL
end
