import BentTool: BarAInfo, Bar

# ----------------
# BarAInfo
# ----------------
let 
    expected = BarAInfo(
        bar = Bar("#11"),
        dist_btwn_rows = 4inch,
        n_row1 = 11,
        n_row2 = 0,
        n_row3 = 0
    )

    @test BarAInfo(Bar("#11"), 4, 11) == expected
    @test BarAInfo(Bar("#11"), "4", "11") == expected
    @test BarAInfo(Bar("#11"), "4", "11", "0", 0.0) == expected
end
