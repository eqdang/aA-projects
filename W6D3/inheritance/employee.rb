class Employee
    attr_accessor :name, :title, :salary, :boss

    def initialize(name,title,salary,boss= nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss 

    end

    def

    def bonus(multiplier)
        bonus =  self.salary * multiplier 
    end

end

class Manager < Employee

    attr_reader :employees

    def initialize(name,title,salary,boss) #(Darren, TA manager, 78000, Ned)
        #(name,title,salary,boss)
        @employees = [] 
        super 
    end

    def add_employee(employee)          # emplyee=  David
      # if darren == darren, employees << david 
        @employees << employee
    end
    

    def bonus(multiplier)
        bonus = @employees.salary * multiplier 
    end

end

# ned.bonus(5) # => 500_000 (1000000 * .2)
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000


# when employee is passed in , if boss ==  nil => bonus == n