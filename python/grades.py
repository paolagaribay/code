grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

def print_grades(grades_input):
  for grade in grades_input:
    print grade

def grades_sum(scores):
  total = 0
  for score in scores: 
    total += score
  return total
    
def grades_average(grades_input):
  sum_of_grades = grades_sum(grades_input)
  average = sum_of_grades / float(len(grades_input))
  return average

def grades_variance(scores):
  avg = grades_average(scores)
  var = 0
  for i in scores:
    var += (avg - i)**2
  variance = var/float(len(scores))
  return variance

def grades_std_deviation(variance):
  sd = variance **0.5
  return sd

print "Grades:"
print_grades(grades)
print "\nSum:"
print grades_sum(grades)
print"\nAverage:"
print grades_average(grades)
print "\nVariance:"
print grades_variance(grades)
print "\nStandard Deviation:"
print grades_std_deviation(grades_variance(grades))