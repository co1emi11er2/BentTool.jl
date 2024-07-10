# Test Girder construction
let
    expected = Girder(
        type=GirderType.Tx54,
        haunch_height = 3inch,
        depth=54inch,
        bott_flange_width=32inch,
        weight=880plf
    )

    # simple construction
    calc = Girder(GirderType.Tx54)

    # auto unit construction
    calc2 = Girder(
        type=GirderType.Tx54,
        haunch_height = 3,
        depth=54,
        bott_flange_width=32,
        weight=880
    )

    @test expected == calc
    @test expected == calc2
end

# BearingPad constructor
let 
    expected = BearingPad(
        width=2ft,
        height=2.75inch,
        distance=12inch
    )

    calc = BearingPad(width=24inch)
    calc2 = BearingPad(2, 2.75, 12)

    @test expected == calc
    @test expected == calc2
end

# Pedestal constructor
let 
    expected = BearingPad(
        width=2ft,
        height=2.75inch,
        distance=12inch
    )

    calc = BearingPad(width=24inch)
    calc2 = BearingPad(2, 2.75, 12)

    @test expected == calc
    @test expected == calc2
end

# Pedestal constructor
let 
    expected = Pedestal(
        width=32inch,
        height=1.5inch
    )

    calc = Pedestal(width=32inch)
    calc2 = Pedestal(32, 1.5)

    @test expected == calc
    @test expected == calc2
end