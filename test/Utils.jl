# Test find_middle function with integer_ft
let 
    expected = [5ft; 15ft; 25ft]
    calc = BentTool.sequence(3, 5ft, 10ft)
    @test calc == expected
    @test_broken typeof(calc) == typeof(expected)
end

# Test sequence function with float_ft
let 
    expected = [5.0ft; 15.0ft; 25.0ft]
    calc = BentTool.sequence(3, 5.0ft, 10.0ft)
    @test calc == expected
    @test typeof(calc) == typeof(expected)
end

# add tests for 2D sequence
@test_broken 1 == 2 #replace with 2D sequence test of integer_ft
@test_broken 1.0 == 2.0 #replace with 2D sequence test of float_ft


# Test for import_data function
let 
    csv_file_name = "GirderInfo.csv"
    lookup_col_name = :type
    lookup_value = string(GirderType.Tx54)
    girder = BentTool.import_data(lookup_value, lookup_col_name, csv_file_name)
    @test girder.type == "Tx54"
    @test girder.depth_in == 54
    @test girder.weight_plf == 880
    @test girder.brg_width == 3.0
    @test girder.bott_flange_width == 32
    @test girder.end_gap_in == 3
end

