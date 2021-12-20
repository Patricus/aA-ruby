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
  attr_reader :employees
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def sub_employees(boss)
    return [] if boss.class != Manger

    boss
      .employees
      .map { |employee| [employee.salary] + sub_employees(employee) }
      .flatten
  end

  def bonus(multiplier)
    sub_employees(self).sum * multiplier
  end
end

ned =
  Manger.new(
    'Ned',
    'Founder',
    1_000_000,
    nil,
    [
      darren =
        Manger.new(
          'Darren',
          'TA Manager',
          78_000,
          ned,
          [
            shawna = Employee.new('Shawna', 'TA', 12_000, darren),
            david = Employee.new('David', 'TA', 10_000, darren),
          ],
        ),
    ],
  )

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
