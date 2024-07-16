import BentTool: BarSInfo, Bar

# ----------------
# BarSInfo
# ----------------
let 
    expected = BarSInfo(
        bar = Bar("#6"),
        n_bundle = 1
    )

    @test BarSInfo(Bar("#6")) == expected
    @test BarSInfo(Bar("#6"), "1") == expected
    @test BarSInfo(Bar("#6"), 1.0) == expected
    @test_throws "n_bundle must be 1, 2, or 3, got 4" BarSInfo(Bar("#6"), 4)
end