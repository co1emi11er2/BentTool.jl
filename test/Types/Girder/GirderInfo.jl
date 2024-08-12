import BentTool: GirderInfo

# ----------------
# GIRDER INFO
# ----------------

# Test GirderInfo construction
let
    expected = GirderInfo(
        girder=Girder("Tx54"),
        n_girders = 5,
        spacing = [3ft, 8ft, 8ft, 8ft, 8ft],
        brg = BearingPad(3ft),
        pdstl = Pedestal(3ft+4inch)
    )

    # simple construction
    calc = GirderInfo(
        Girder("Tx54"),
        5,
        [3, 8, 8, 8, 8],
    ) 

    for field in fieldnames(typeof(calc))
        @test getfield(calc, field) == getfield(expected, field)
    end

end