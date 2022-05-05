list = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def o_squared(list)
  longest = ""
  list.each do |fish1|
    list.each do |fish2|
      longest = fish1 if fish1.length > fish2.length
    end
  end
  longest
end
p o_squared(list)


class Array
  def merge_sort
    return self if count <=1
    mid = count / 2
    sorted_left = self.take(mid).merge_sort
    sorted_right = self.drop(mid).merge_sort

    Array.merge(sorted_left, sorted_right)
  end

    private

    def self.merge(left, right)
      merged = []

      until left.empty? || right.empty?
        case left.first.length <=> right.first.length
        when -1
          merged << left.shift
        when 0
          merged << left.shift
        when 1
          merged << right.shift
        end
      end
      merged.concat(left)
      merged.concat (right)
      merged
    end
  end

  def nlogn(list)
    list.merge_sort[-1]
  end
p nlogn(list)


def on(list)
  max = list[0]
  list.each do |fish|
    max = fish if fish.length > max.length
  end
  max
end

p on(list)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


def slow_dance(dir, tiles_array)
  (0...tiles_array.length).each do |idx|
    return idx if tiles_array[idx] == dir
  end
end

p slow_dance('left-up', tiles_array)

def new_tiles_data_structure(tiles_array)
  dict = {}
  tiles_array.each_with_index do |dir, idx|
    dict[dir] = idx
  end
  dict
end

new_tiles_data_structure = new_tiles_data_structure(tiles_array)

def fast_dance(dir, new_tiles_data_structure)
  return new_tiles_data_structure[dir]
end

p fast_dance('left-up',new_tiles_data_structure )
