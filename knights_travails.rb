def knight_moves(startpos, endpos)
  starting_path = [startpos]
  queue = []
  queue.unshift(starting_path)
  loop do
    path = queue.pop
    return path if path_correct(path, endpos)

    possible_continuations(path).each { |c| queue.unshift c }
  end
end
