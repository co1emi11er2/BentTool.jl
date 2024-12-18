using StructuralUnits
# ----------------
# BEARING PAD
# ----------------

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