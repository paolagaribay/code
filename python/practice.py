def is_even(x):
  if x % 2 == 0:
    return True
  else:
    return False
  
def is_int(x):
  i = abs(x)
  if  i == int(i):
    return True
  else:
    return False

def digit_sum(n):
  s = str(n)
  sum = 0
  for i in s:
    sum += int(i)
  return sum

def factorial(x):
  f = 1
  for i in range(1, x+1):
    f *= i
  return f
  
def is_prime(x):
  if x < 2:
    return False
  else:
    for i in range(2, x-1):
      if x % i == 0:
        return False
    else:
      return True

def reverse(text):
  s = ""
  l = len(text)
  for i in range(l-1, -1, -1):
    s += text[i]
  return s

def anti_vowel(text):
  v = "aeiouAEIOU"
  s = ""
  for i in text:
    if i not in v:
      s += i
  return s

score = {"a": 1, "c": 3, "b": 3, "e": 1, "d": 2, "g": 2, 
         "f": 4, "i": 1, "h": 4, "k": 5, "j": 8, "m": 3, 
         "l": 1, "o": 1, "n": 1, "q": 10, "p": 3, "s": 1, 
         "r": 1, "u": 1, "t": 1, "w": 4, "v": 4, "y": 4, 
         "x": 8, "z": 10}

def scrabble_score(word, dic):
  total = 0
  w = word.lower()
  for c in w:
      total += dic[c]
  return total

def censor(text, word):
  censor = "*" *len(word)
  word_list = text.split()
  for i,w in enumerate(word_list):
    if w == word:
      word_list[i] = censor
  censored = " ".join(word_list)
  return censored

def count(sequence, item):
  count = 0
  for i in sequence:
    if i == item:
      count += 1
  return count      

def purify(nums):
  evens = []
  for i in nums:
    if i % 2 == 0:
      evens.append(i)
  return evens  

def product(ints):
  total = 1
  for i in ints:
    total *= i
  return total

def remove_duplicates(dups):
  new= []
  for i in dups:
    if i not in new:
      new.append(i)
  return new

def median(nums):
  sort_nums = sorted(nums)
  l = len(sort_nums)
  median = 0
  if l % 2 == 0:
    half1 = sort_nums[l/2] 
    half2 = sort_nums[l/2 - 1]
    median = (half1 + half2)/2.0
  else:
    median = sort_nums[l/2]

threes_and_fives = [x for x in range(1,16) if x%3==0 or x%5==0]

garbled = "!XeXgXaXsXsXeXmX XtXeXrXcXeXsX XeXhXtX XmXaX XI"
message = garbled[::-2]
print message

garbled = "IXXX aXXmX aXXXnXoXXXXXtXhXeXXXXrX sXXXXeXcXXXrXeXt mXXeXsXXXsXaXXXXXXgXeX!XX"
message = filter(lambda x: x!= "X", garbled)
print message

def check_bit4(input):
  mask = 0b1000
  desired = input & mask
  if desired > 0:
    return "on"
  else:
    return "off"

def flip_bit(number, n):
  mask = 0b1 << (n -1)
  result = number ^ mask
  return bin(result)

class Fruit(object):
  """A class that makes various tasty fruits."""
  def __init__(self, name, color, flavor, poisonous):
    self.name = name
    self.color = color
    self.flavor = flavor
    self.poisonous = poisonous

  def description(self):
    print "I'm a %s %s and I taste %s." % (self.color, self.name, self.flavor)

  def is_edible(self):
    if not self.poisonous:
      print "Yep! I'm edible."
    else:
      print "Don't eat me! I am super poisonous."

lemon = Fruit("lemon", "yellow", "sour", False)

lemon.description()
lemon.is_edible()

class Animal(object):
  """Makes cute animals."""
  is_alive = True
  health = "good"
  def __init__(self, name, age):
    self.name = name
    self.age = age
  # Add your method here!
  def description(self):
    print self.name
    print self.age

hippo = Animal("Betty", 4)
hippo.description()
sloth = Animal("Harry", 10)
ocelot = Animal("Jerry", 7)
print hippo.health
print sloth.health
print ocelot.health

class ShoppingCart(object):
  """Creates shopping cart objects
  for users of our fine website."""
  
  def __init__(self, customer_name):
    self.customer_name = customer_name
    self.items_in_cart = {}
  def add_item(self, product, price):
    """Add product to the cart."""
    if not product in self.items_in_cart:
      self.items_in_cart[product] = price
      print product + " added."
    else:
      print product + " is already in the cart."

  def remove_item(self, product):
    """Remove product from the cart."""
    if product in self.items_in_cart:
      del self.items_in_cart[product]
      print product + " removed."
    else:
      print product + " is not in the cart."
      
my_cart = ShoppingCart("Joe")
my_cart.add_item("Coffee", 2.49)

class Customer(object):
  """Produces objects that represent customers."""
  def __init__(self, customer_id):
    self.customer_id = customer_id

  def display_cart(self):
    print "I'm a string that stands in for the contents of your shopping cart!"

class ReturningCustomer(Customer):
  """For customers of the repeat variety."""
  def display_order_history(self):
    print "I'm a string that stands in for your order history!"

monty_python = ReturningCustomer("ID: 12345")
monty_python.display_cart()
monty_python.display_order_history()

class Shape(object):
  """Makes shapes!"""
  def __init__(self, number_of_sides):
    self.number_of_sides = number_of_sides

# Add your Triangle class below!
class Triangle(Shape):
  def __init__(self, side1, side2, side3):
    self.side1 = side1
    self.side2 = side2
    self.side3 = side3
    
class Employee(object):
  def __init__(self, name):
    self.name = name
  def greet(self, other):
    print "Hello, %s" % other.name

class CEO(Employee):
  def greet(self, other):
    print "Get back to work, %s!" % other.name

ceo = CEO("Emily")
emp = Employee("Steve")
emp.greet(ceo)
# Hello, Emily
ceo.greet(emp)
# Get back to work, Steve!

class Employee(object):
  """Models real-life employees!"""
  def __init__(self, employee_name):
    self.employee_name = employee_name

  def calculate_wage(self, hours):
    self.hours = hours
    return hours * 20.00

# Add your code below!
class PartTimeEmployee(Employee):
  def calculate_wage(self, hours):
    self.hours = hours
    return hours * 12.00
  def full_time_wage(self, hours):
    return super(PartTimeEmployee, self).calculate_wage(hours)
  
milton = PartTimeEmployee("Milton")
print milton.full_time_wage(10)

class Triangle(object):
  number_of_sides = 3
  def __init__(self, angle1, angle2, angle3):
    self.angle1 = angle1
    self.angle2 = angle2
    self.angle3 = angle3
  def check_angles(self):
    if (self.angle1 + self.angle2 + self.angle3) == 180:
      return True
    else: 
      return False
class Equilateral(Triangle):
  angle = 60
  def __init__(self):
    self.angle1 = self.angle
    self.angle2 = self.angle
    self.angle3 = self.angle
    
my_triangle = Triangle(90, 30, 60)
print my_triangle.number_of_sides
print my_triangle.check_angles()

class Car(object):
  condition = "new"
  def __init__(self, model, color, mpg):
    self.model = model
    self.color = color
    self.mpg   = mpg
  def display_car(self):
    return "This is a %s %s with %s MPG." % (self.color, self.model, self.mpg)
  def drive_car(self):
    self.condition = "used"
class ElectricCar(Car):
  def __init__(self, model, color, mpg, battery_type):
    super(ElectricCar, self).__init__(model, color, mpg)
    self.battery_type = battery_type
  def drive_car(self):
    self.condition = "like new"

my_car = ElectricCar("DeLorean", "silver", 88, "molten salt")

print my_car.condition
my_car.drive_car()
print my_car.condition

class Point3D(object):
  def __init__(self, x, y, z):
    self.x = x
    self.y = y
    self.z = z
  def __repr__(self):
    return "(%d, %d, %d)" % (self.x, self.y, self.z)
  
my_point = Point3D(1, 2, 3)
print my_point

with open("text.txt", "w") as my_file:
  my_file.write("My Data!")
  
if not file.closed:
  file.close()

print my_file.closed