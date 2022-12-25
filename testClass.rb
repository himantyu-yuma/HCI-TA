class A
    def initialize(msg)
        @msg = msg
    end
    def repeat_msg(iter)
        iter.times do |i|
            puts @msg
        end
    end
end

a = A.new("hoge")
a.repeat_msg(3)