App.factory 'switchArrow', ->
  switching = (flags, next_direction) ->
    for direction, flag of flags
      if direction == next_direction
        flags[direction] = true
      else
        flags[direction] = false
  {switching: switching}


