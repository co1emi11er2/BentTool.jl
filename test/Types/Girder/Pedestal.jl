using StructuralUnits
# ----------------
# PEDESTAL
# ----------------

# Pedestal constructor
let 
    expected = Pedestal(
        width=36inch,
        height=1.5inch
    )

    calc = Pedestal(width=36inch)
    calc2 = Pedestal(3, 1.5)

    @test expected == calc
    @test expected == calc2
end