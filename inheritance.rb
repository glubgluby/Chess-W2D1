require "byebug"

class Employee
    attr_reader :name, :salary, :title, :boss

    def initialize(n, s, t, b = nil)
        @name = n
        @salary = s
        @title = t
        # debugger
        unless b.nil?
            b.employees << self
        end
        @boss = b

    end

    def bonus(multi)
        salary * multi
    end

    def salsum
        return self.salary unless self.is_a?(Manager)
        self.employees.map{|e| e.salsum}.flatten.sum + self.salary
    end
end

class Manager < Employee
    attr_accessor :employees

    def initialize(n, s, t, b = nil)
        @employees = []
        # debugger
        super(n,s,t,b)
    end

    def bonus(multi)
        res = []
        employees.each do |x|
            # debugger
            res << x.salsum
        end
        res.sum * multi
    end


end

y= Manager.new("Ned", 1000000, "Founder", nil)
x = Manager.new("Darren", 78000, "TA Manager", y)
z= Employee.new("David", 10000, "TA", x)
a= Employee.new("Sahwn", 12000, "TA", x)

p y.bonus(5)
p x.bonus(4)
p z.bonus(3)

