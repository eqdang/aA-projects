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
        if salaries.has_key?(title)
            return true 
        else
            return false
        end
    end

    def >(startup)
        if self.funding > startup.funding
            return true
        else
            return false
        end
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            error
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        title = employee.title
        if self.funding >= @salaries[title]
            employee.pay(@salaries[title])
            @funding -= @salaries[title]
        else
            error
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) } 
    end

    def average_salary
        sum = 0
        @employees.each do |employee| 
            title = employee.title
            sum += @salaries[title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        
        startup.salaries.each do |title, salary|
            if !self.salaries.has_key?(title)
                self.salaries[title] = salary
            end

        end

        startup.employees.each do |employee|
            self.employees << employee
        end
        
        startup.close
    end

end
