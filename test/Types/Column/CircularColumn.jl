import BentTool: CircularColumn

let 
    expected = CircularColumn(
        diameter = 108inch,
        height = 20ft
    )
    @test CircularColumn(108.0, 20) == expected
    @test CircularColumn(9ft, "20") == expected
    
end