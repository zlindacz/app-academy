class Employee
  attr_reader :salary, :employees

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    set_boss(boss)
    @employees = []
  end

  def set_boss(new_boss)
    new_boss.employees << self unless new_boss.nil? || new_boss.employees.include?(self)
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super
  end

  def bonus(multiplier)
    employee_salaries * multiplier
  end

  def employee_salaries
    total = 0
    @employees.each do |employee|
      unless employee.employees.empty?
        total += employee.employee_salaries
      end
      total += employee.salary
    end
    total
  end
end

ned=Manager.new("Ned","F", 1000000, nil)
darren=Manager.new("Darren","TAM", 78000, ned)
david=Employee.new("David","TA", 10000, darren)
shawna=Employee.new("Shawna","TA", 12000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
