# Proxy
# - Lets you provide a substitute or placeholder for another object.
#   A proxy controls access to the original object, allowing you to perform something either before or
#   after the request gets through to the original object.

# RealService
class BankAccount
  attr_reader :balance

  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
    puts balance
  end

  def withdraw(amount)
    @balance -= amount
    puts balance
  end
end

# ServiceProxy
class BankAccountProxy
  def initialize(real_object, owner_name)
    @real_object = real_object
    @owner_name = owner_name
  end

  def balance
    check_access
    @real_object.balance
  end

  def deposit(amount)
    check_access
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @real_object.withdraw(amount)
  end

  def check_access
    if @owner_name != 'test'
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end
end

account = BankAccount.new(100)
proxy = BankAccountProxy.new(account, 'test')
proxy.deposit(50)
proxy.withdraw(10)
