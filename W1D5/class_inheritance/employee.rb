class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manger < Employee
  def initialize(employees)
    @employees = employees
  end
  def bonus(multiplier)
    @employees.flatten.length * multiplier
  end
end
