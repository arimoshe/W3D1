class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])

            i += 1
        end

        self
    end

    def my_select(&prc)
        new_arr = []

        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end

        new_arr 
    end

    def my_reject(&prc)
        new_arr = []

        self.my_each do |ele|
            new_arr << ele unless prc.call(ele)
        end

        new_arr 
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end

        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end

        true
    end

    def my_flatten

        flatten = []
        self.each do |ele|
            if ele.is_a? (Array)
                flatten += ele.my_flatten
            else
                flatten << ele
            end
        end
        flatten
    end
    
    def my_zip(*args)
        new_arr=[]

        (0...self.length).each do |i|
            temp=[self[i]] # original element of array
            args.each do |arg|
                temp << arg[i]
            end
            new_arr << temp
        end
        new_arr
    end

    def my_rotate(num = 1)
        new_arr = self.dup

        if num == 0
            return new_arr
        elsif num > 0
            num.times do 
                new_arr << new_arr.shift
            end
        else
            (num * -1).times do
                new_arr.unshift(new_arr.pop)
            end
        end

        new_arr
    end

    def my_join(str = "")
        new_str = ""

        self.each do |ele|
            new_str += (ele + str)
        end
        
        new_str
    end

    def my_reverse
        new_arr = []
        i=self.length-1
        while i >= 0
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end

    def 

end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]