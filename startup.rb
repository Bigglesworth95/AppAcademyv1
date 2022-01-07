#works in tandem with employee
require_relative "employee"
class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    if @salaries.keys.include?(title)
      true
    else
      false
    end
  end

  def >(other_startup)
    if self.funding>other_startup.funding
      true
    else
      false
    end
  end

  def hire(employee_name, title)
    if valid_title?(title)
      employee = Employee.new(employee_name, title)
      employees << employee
    else
      raise 'error'
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    if @funding >= salary
      @funding -= salary
      employee.pay(salary)
    else
      raise 'error'
    end

    def payday
      @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
      sum = 0
      @employees.each {|employee| sum += @salaries[employee.title]}
      sum/employees.length
    end

    def close
      @employees = []
      @funding = 0
    end

    def acquire(startup)
      @funding += startup.funding
      startup.salaries.each do |k, v|
        if !@salaries.has_key?(k)
          @salaries[k] = v
        end
      end
      @employees += startup.employees
      startup.close
    end
  end

  #def pay_employee(employee)
  #  title = nil
  #  newEmployee = ''
  #  @employees.each do |i|
  #    if i.name == employee
  #      title = i.title
  #      newEmployee = i
  #    end
  #  end
  #  salary = @salaries[title]
  #  if @funding > salary
  #    newEmployee.pay(salary)
  #    @funding -= salary
  #  else
  #    raise 'error'
  #  end
  #  puts @funding
  #  puts newEmployee.earnings
  #end

end
