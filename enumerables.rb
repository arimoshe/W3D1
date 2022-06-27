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
        (0...args.length+1).each do |i|
            temp=[self[i]]
            args.each do |arg|
                temp << arg[i]
            end
            new_arr << temp
        end
        new_arr
    end

end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]