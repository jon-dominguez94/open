require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end
    
    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise 'not a real title'
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        payment = @salaries[employee.title]
        if payment < @funding
            employee.pay(payment)
            @funding -= payment
        else
            raise 'not enough funding'
        end
    end

    def payday
        @employees.each {|person| self.pay_employee(person)}
    end

    def average_salary
        sum = 0
        @employees.each {|person| sum += @salaries[person.title]}
        sum / @employees.length.to_f
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k,v|
            @salaries[k] = v if !@salaries.has_key?(k)
        end
        @employees += startup.employees
        startup.close
    end
end
