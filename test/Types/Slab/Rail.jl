import BentTool: RailType, Rail
# ----------------
# RAIL
# ----------------

# Test Girder construction
let
    expected = Rail(
        type=RailType.T222,
        height = 36inch,
        width=1.0ft,
        weight=413.0plf,
    )

    # simple construction
    calc = Rail(RailType.T222)
    calc2 = Rail("T222")

    # auto unit construction
    calc3 = Rail(
        type=RailType.T222,
        height = 36,
        width=1.0,
        weight="413.0",
    )

    @test expected == calc
    @test expected == calc2
    @test expected == calc3
end