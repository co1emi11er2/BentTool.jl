# ----------------
# PEDESTAL
# ----------------

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