# takes three scores as integers
# calculates average of three scores
# assigns letter grade based on score average
# returns letter grade

def get_grade(sc1, sc2, sc3)
  # get average of scores
  avg = (sc1 + sc2 + sc3) / 3

  # assign letter grade
  # return letter grade
  case avg
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95)
