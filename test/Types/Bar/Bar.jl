using StructuralUnits
import BentTool: Bar, BarSize, bar_size
# ----------------
# BAR
# ----------------

# Test BarSize enum
@test bar_size("#11") == BarSize.n11
@test bar_size(BarSize.n11) == BarSize.n11
@test string(BarSize.n11) == "#11"

# Test Bar constructor
let 
    expected = Bar(
        size = BarSize.n11,
        area = 1.563inch^2,
        weight = 5.313plf,
        diameter = 1.41inch,
        ld = 48.16inch
    )

    @test Bar(BarSize.n11) == expected
    @test Bar("#11") == expected
    
end
