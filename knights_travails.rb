require 'matrix'

def knight_moves(startpos, endpos)
  starting_path = [startpos]
  queue = []
  queue.unshift(starting_path)
  loop do
    path = queue.pop
    return path if path_correct?(path, endpos)

    possible_continuations(path).each { |c| queue.unshift c }
  end
end

def path_correct?(path, endpos)
  path.last == endpos
end

def possible_continuations(path)
  move_vectors = [[1, 2],
                  [2, 1],
                  [2, -1],
                  [1, -2],
                  [-1, -2],
                  [-2, -1],
                  [-2, 1],
                  [-1, 2]]
  lastpos = path.last
  next_positions = move_vectors.map { |v| sum(v, lastpos) }
  next_positions = next_positions.filter { |p| position_allowed? p}
  next_positions.map { |p| path + [p] }
end

def sum(a1, a2)
  v1 = Vector.elements(a1)
  v2 = Vector.elements(a2)
  (v1 + v2).to_a
end

def position_allowed?(pos)
  pos[0].between?(0, 7) && pos[1].between?(0, 7)
end
