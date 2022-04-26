require "employee"
require "byebug"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    attr_reader :name, :funding, :salaries, :employees

    def valid_title?(title)
        salaries.include?(title)
    end

    def >(startup)
        funding > startup.funding
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise ArgumentError.new("Invalid title.")
            return
        end

        @employees << Employee.new(employee_name, title)
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        pay_amt = salaries[employee.title]
        #debugger
        if funding >= pay_amt
            employee.pay(pay_amt)
            @funding -= pay_amt
        else
            raise StandardError.new("Not enough funding!")
        end
    end

    def payday
        employees.each{|employee| pay_employee(employee)}
    end

    def average_salary
        employees.reduce(0){|sum_sal, emp| sum_sal + salaries[emp.title]} / employees.length.to_f
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire (startup)
        @funding+=startup.funding
        @salaries = startup.salaries.merge(salaries)
        @employees += startup.employees
        startup.close
    end
end
