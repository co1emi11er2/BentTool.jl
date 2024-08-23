using StructuralUnits
import BentTool: RectangularColumn

let 
    expected = RectangularColumn(
        width = 72inch,
        length = 96inch,
        height = 20ft
    )
    @test RectangularColumn(72, 96.0, 20) == expected
    @test RectangularColumn(6ft, 96, "20") == expected
    
end