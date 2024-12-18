using StructuralUnits
import BentTool: BarBInfo, Bar

# ----------------
# BarBInfo
# ----------------
let 
    expected = BarBInfo(
        bar = Bar("#11"),
        dist_btwn_rows = 4inch,
        n_row1 = 11,
        n_row2 = 0,
        n_row3 = 0
    )

    @test BarBInfo(Bar("#11"), 4, 11) == expected
    @test BarBInfo(Bar("#11"), "4", "11") == expected
    @test BarBInfo(Bar("#11"), "4", "11", "0", 0.0) == expected
end