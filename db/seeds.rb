# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Color.delete_all
Pips.delete_all

Color.create([{name: 'red'}, {name: 'blue'}, {name: 'green'}, {name: 'yellow'}, {name:'purple'}])
Pip.create([{value: 1}, {value: 2}, {value: 3}, {value: 4}, {value: 5}, {value: 6}])


def neighbor (coordinate, full_list)
  orthogonal = full_list.find_all{|c|
    (c[:x] == coordinate[:x] and c[:y] == coordinate[:y] + 1) or
        (c[:x] == coordinate[:x] and c[:y] == coordinate[:y] - 1) or
        (c[:x] == coordinate[:x] + 1 and c[:y] == coordinate[:y]) or
        (c[:x] == coordinate[:x] - 1 and c[:y] == coordinate[:y])
  }
  diagonal = full_list.find_all{|c|
    (c[:x] == coordinate[:x] + 1 and c[:y] == coordinate[:y] + 1) or
        (c[:x] == coordinate[:x] + 1 and c[:y] == coordinate[:y] - 1) or
        (c[:x] == coordinate[:x] - 1 and c[:y] == coordinate[:y] + 1) or
        (c[:x] == coordinate[:x] - 1 and c[:y] == coordinate[:y] - 1)
  }
  {
      orthogonal: orthogonal,
      diagonal: diagonal
  }
end

c_id = 0
res = 4.times.map {|y|
  5.times.map {|x|
    c_id += 1
    {id: c_id, x: x, y: y}
  }
}.flatten

n_id = 0
neighbor_list = res.map{|c|
  neighbor(c, res).map{|type, neighbors|
    neighbors.map{|n|
      n_id += 1
      {
          id: n_id,
          coordinate_id: c[:id],
          neighbor_id: n[:id],
          type: type
      }
    }
  }
}.flatten