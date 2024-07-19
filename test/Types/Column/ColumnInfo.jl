import BentTool: ColumnInfo

# Test Rectangular column integration
let 
    r = RectangularColumn(
        width = 72inch,
        length = 96inch,
        height = 20ft
    )
    

    expected = ColumnInfo(
        column = r,
        n_columns = 1,
        spacing = [10ft]
    )
    

    calc = ColumnInfo(
        r,
        1, # test string parsing
        10
    )

    for field in fieldnames(typeof(calc))
        @test getfield(calc, field) == getfield(expected, field)
    end

    # test n_columns and spacing match
    err = "spacing entries must equal n_columns.Got length(spacing) = 2 vs n_columns = 1"
    @test_throws err ColumnInfo(r, 1, [10, 5])

    # test n_columns and spacing match
    err = "number of columns must be greater than or equal to 1. Got -1"
    @test_throws err ColumnInfo(r, -1, [10])
end

# Test Circular column integration
let 
    c = CircularColumn(
        diameter = 108inch,
        height = 20ft
    )

    expected = ColumnInfo(
        column = c,
        n_columns = 2,
        spacing = [10ft, 5ft]
    )

    calc = ColumnInfo(
        c,
        2,
        [10, 5]
    )

    for field in fieldnames(typeof(calc))
        @test getfield(calc, field) == getfield(expected, field)
    end
end