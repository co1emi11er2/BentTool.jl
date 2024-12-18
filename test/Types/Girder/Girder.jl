using StructuralUnits
# ----------------
# GIRDER
# ----------------

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
    calc2 = Girder("Tx54")

    # auto unit construction
    calc3 = Girder(
        type=GirderType.Tx54,
        haunch_height = 3,
        depth=54,
        bott_flange_width=32,
        weight=880
    )

    @test expected == calc
    @test expected == calc2
    @test expected == calc3
end
