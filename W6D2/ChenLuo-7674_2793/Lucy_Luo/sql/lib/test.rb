# == Schema Information
#
# Table name: cats
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  breed       :string
#
# Table name: toys
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  price       :integer
#
# Table name: cat_toys
#
#  id          :integer      not null, primary key
#  cat_id      :integer      not null, foriegn key
#  toy_id      :integer      not null, foreign key

require_relative '../data/pg_helper.rb'

def russian_blue
  # Find the name and price for all toys owned by cats with the breed 
  # `Russian Blue`.
  # Order alphabetically by toy name.

  execute(<<-SQL)
    SELECT toys.name, toys.price
    FROM toys
    JOIN cat_toys ON toys.id = toy_id
    JOIN cats ON cats.id = cat_id
    WHERE cats.breed = 'Russian Blue'
    ORDER by toys.name
  SQL
end

def top_cat
  # There is one cat who has the most toys.
  # List the name of the cat and the number of toys.

  execute(<<-SQL)
    SELECT cats.name, max_toys.count_toys
    FROM cats
    JOIN (
      SELECT cats.id, COUNT(toy_id) as count_toys
      FROM cats
      JOIN cat_toys ON cats.id = cat_id
      GROUP BY cats.id
      ORDER BY COUNT(toy_id) DESC
      limit 1) max_toys
      ON cats.id = max_toys.id
    
  SQL
end

def cheap_toys_and_their_cats
  # Find the cheapest toy. Then list the name of all the cats that own that toy.
  # Order alphabetically by cat name

  execute(<<-SQL)
    SELECT cats.name
    FROM cats
    JOIN cat_toys ON cats.id = cat_id
    JOIN toys ON toys.id = toy_id
    WHERE toys.price = (
      SELECT MIN(price)
      FROM toys)
    ORDER BY cats.name
    
  SQL
end

def cats_like_johnson
  # Find the breed of the `Lavender` colored cat named `Johnson`. 
  # Then find the names of all the other cats that belong to that breed. 
  # Include the original `Lavender` colored cat named `Johnson` in your results.
  # Order alphabetically by cat name.

  execute(<<-SQL)
    SELECT cats.name
    FROM cats
    WHERE cats.breed = (
      SELECT breed
      FROM cats
      WHERE color = 'Lavender' AND name = 'Johnson')
    ORDER BY cats.name
  SQL
end

def most_expensive_shiny_mouse
  # There are multiple 'Shiny Mouse' toys that all have different prices.
  # Your goal is to list all names and prices of the toys with the same price
  # as the most expensive `Shiny Mouse` toy.

  # Exclude the `Shiny Mouse` toy from your results.
  # Order alphabetically by toy name.

  execute(<<-SQL)
    SELECT toys.name, toys.price
    FROM toys
    WHERE price = (
      SELECT MAX(price)
      FROM toys
      WHERE name = 'Shiny Mouse')
      AND toys.name != 'Shiny Mouse'
    ORDER BY toys.name
  SQL
end