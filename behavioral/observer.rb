# Observer
# - Lets you define a subscription mechanism to notify multiple objects

# Subject
class Employee
  attr_reader :name, :title, :salary, :observers

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def add_observer(observer)
    observers << observer
  end

  def delete_observer(observer)
    observers.delete(observer)
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    observers.each { |observer| observer.update(self) }
  end
end

# Observers
class Payroll
  def update(changed_employee)
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan
  def update(changed_employee)
    puts("Send #{changed_employee.name} a new tax bill!")
  end
end

fred = Employee.new('Fred', 'Crane Operator', 30000.0)
payroll = Payroll.new
tax_man = TaxMan.new
fred.add_observer(payroll)
fred.add_observer(tax_man)
fred.salary = 35000.0
