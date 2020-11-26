SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

SELECT name, continent, population FROM world

SELECT name FROM world
  WHERE population >= 200000000

SELECT name, gdp/population FROM world
  WHERE population >= 200000000

SELECT name, population/1000000
  FROM world
  WHERE continent = 'South America'

SELECT name, population
  FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

SELECT name
  FROM world
  WHERE name LIKE '%United%'

SELECT name, population, area
  FROM world
  WHERE area > 3000000 OR population >250000000

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
  FROM world
  WHERE continent = 'South America'

SELECT name, ROUND( gdp/population, -3)
  FROM world
  WHERE gdp >= 1000000000000

SELECT name, capital
  FROM world
  WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital
  FROM world
  WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital

SELECT name
  FROM world
  WHERE
    name LIKE '%a%' AND
    name LIKE '%e%' AND
    name LIKE '%i%' AND
    name LIKE '%o%' AND
    name LIKE '%u%'
  AND name NOT LIKE '% %'

SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950

SELECT winner
  FROM nobel
  WHERE yr = 1962
  AND subject = 'Literature'

Select yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein'

SELECT winner
  FROM nobel
  WHERE subject = 'Peace' AND yr >= 2000

SELECT yr, subject, winner
  FROM nobel
  WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

SELECT * FROM nobel
   WHERE winner IN (
     'Theodore Roosevelt',
     'Woodrow Wilson',
     'Jimmy Carter',
     'Barack Obama'
   )

SELECT winner
  FROM nobel
  WHERE winner LIKE 'John %'

SELECT yr, subject, winner
  FROM nobel
  WHERE
    yr = 1980 AND subject = 'Physics' OR
    subject='Chemistry' AND yr = 1984

SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')

SELECT yr, subject, winner
  FROM nobel
  WHERE
    subject = 'Medicine' AND yr < 1910 OR
    subject = 'Literature' AND yr >= 2004

SELECT yr, subject, winner
  FROM nobel
  WHERE winner = 'Peter Grünberg'

SELECT yr, subject, winner
  FROM nobel
  WHERE winner = 'EUGENE O\'NEILL'

SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir %'
  ORDER BY yr DESC, winner

SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics','Chemistry'), subject, winner

SELECT name FROM world
  WHERE population > (SELECT population FROM world WHERE name='Russia')

SELECT name
  FROM world
  WHERE continent='Europe' AND
  gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom')

SELECT name, continent
  FROM world
  WHERE continent IN (
    SELECT continent
    FROM world
    WHERE name = 'Argentina' OR name = 'Australia'
  )
  ORDER BY name

SELECT name
  FROM world
  WHERE population > (
    SELECT population
    FROM world
    WHERE name = 'Canada'
  ) AND population < (SELECT population FROM world WHERE name = 'Poland')

SELECT
  name,
  CONCAT(
    ROUND(
      population /
      (SELECT population FROM world WHERE name = 'Germany') * 100
    ), '%'
  ) as percentage
  FROM world
  WHERE continent = 'Europe'
