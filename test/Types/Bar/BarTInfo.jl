using StructuralUnits
import BentTool: BarTInfo, Bar

# ----------------
# BarTInfo
# ----------------
let 
    expected = BarTInfo(
        bar = Bar("#6"),
        n_bars_face = 6
    )

    @test BarTInfo(Bar("#6"), 6) == expected
    @test BarTInfo(Bar("#6"), "6") == expected
    @test BarTInfo(Bar("#6"), 6.0) == expected
end