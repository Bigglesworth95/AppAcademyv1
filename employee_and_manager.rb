class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  def bonus(multiplier)
    bonus = @salary * multiplier
    bonus
  end

  def boss=(boss)
    @boss = boss.add_employee(self) unless boss == nil
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss=nil)
    super
    @employees = []
  end
  def add_employee(employee)
    @employees << employee
  end
  def bonus(multiplier)
    self.sal_subtotal * multiplier
  end

  def sal_subtotal(employee)
    subtotal = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        subt0tal += employee.salary + employee.sal_subtotal
      else
        subtotal += employee.salary
      end
      subtotal
  end
end
