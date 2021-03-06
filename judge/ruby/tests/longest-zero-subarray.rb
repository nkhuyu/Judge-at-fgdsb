@num_test = 110
@in_0 = []
@in_org_0 = []
@out = []

def test_ret(arr, answer_len)
		return false if arr.length != answer_len
		sum = 0
		arr.each { |num| sum += num }
    sum == 0
end

def load_test
    f = File.new("judge/tests/longest-zero-subarray.txt")
    @in_0 = read_int_matrix(f)
    @in_org_0 = @in_0.dup
    @out = read_int_matrix(f)
    f.close
end

def judge
    load_test
    capture_stdout

    start_time = Time.now

    (0...@num_test).each do |i|
       puts 'Testing case #' + (i+1).to_s
        answer = longest_subarray(@in_0[i]) 
        if (!test_ret(answer, @out[i].length))
            release_stdout
            print "#{i+1} / #{@num_test};"
            print @in_org_0[i].to_s
            print ';'
            print answer.to_s
            print ';'
            print @out[i].to_s
            puts
            return
        end
    end

    release_stdout
    runtime = (Time.now - start_time) * 1000.0
    puts('Accepted;' + runtime.to_i.to_s)
end
