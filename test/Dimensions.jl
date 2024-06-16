# Test find_middle function with 1 input
let 
    a = [
        1 2 3
        4 5 6
        7 8 9
        ]
    expected = [4; 5; 6]
    @test BentTool.find_middle(a) == expected
end

# Test find_middle function with 2 inputs
let 
    a = [
        1 2 3
        4 5 6
        7 8 9
        ]
    expected_1 = [4; 5; 6]
    expected_2 = [4; 5; 6]
    expected = (expected_1, expected_2)
    @test BentTool.find_middle(a, a) == expected
end


# Test find_spacing function
let 
    a = [1; 3; 7; 20; 30]
    expected = [2; 4; 13; 10]
    @test BentTool.find_spacing(a) == expected
end

# Test find_spacing function
let 
    a = [1]
    err = ErrorException("Vector must have a length greater than 1")
    @test_throws err BentTool.find_spacing(a)
end


# Test find_midpoints function
let 
    a = [10; 20; 30; 40; 50]
    expected = [15; 25; 35; 45]
    @test BentTool.find_midpoints(a) == expected
end

# Test find_midpoints function
let 
    a = [1]
    err = ErrorException("Vector must have a length greater than 1")
    @test_throws err BentTool.find_midpoints(a)
end
