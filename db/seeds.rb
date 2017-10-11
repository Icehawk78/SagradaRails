# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Color.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Color.table_name)
Pip.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Pip.table_name)

Neighbour.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Neighbour.table_name)
Coordinate.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Coordinate.table_name)

def load_seeds model
  model.create(YAML::load_file(Rails.root.join('db', 'seeds', "#{model.table_name}.yml")))
end

def neighbor (coordinate, full_list)
  {
      orthogonal: full_list.find_all{ |c|
        (c.x == coordinate.x and c.y == coordinate.y + 1) or
            (c.x == coordinate.x and c.y == coordinate.y - 1) or
            (c.x == coordinate.x + 1 and c.y == coordinate.y) or
            (c.x == coordinate.x - 1 and c.y == coordinate.y)
      },
      diagonal: full_list.find_all{ |c|
        (c.x == coordinate.x + 1 and c.y == coordinate.y + 1) or
            (c.x == coordinate.x + 1 and c.y == coordinate.y - 1) or
            (c.x == coordinate.x - 1 and c.y == coordinate.y + 1) or
            (c.x == coordinate.x - 1 and c.y == coordinate.y - 1)
      }
  }
end

# Color.create(YAML::load_file(Rails.root.join('db', 'seeds', 'color.yml')))
load_seeds(Color)
load_seeds(Pip)
# Pip.create([{value: 1}, {value: 2}, {value: 3}, {value: 4}, {value: 5}, {value: 6}])


res = 4.times.map {|y|
  5.times.map {|x|
    Coordinate.create(x: x, y: y)
  }
}.flatten

neighbor_list = res.map{|c|
  neighbor(c, res).map{|direction, neighbors|
    neighbors.map{|n|
      Neighbour.create(start_coordinate: c, neighbour_coordinate: n, direction: direction)
    }
  }
}.flatten