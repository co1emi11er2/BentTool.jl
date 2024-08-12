import BentTool: Slab
# ----------------
# SLAB
# ----------------

# Test Slab construction
let
    expected = Slab(
        width = 40ft, 
        thickness = 8.5inch, 
        density = 0.15kcf, 
        fws_thickness = 0.0inch, 
        fws_density = 0.15kcf, 
        cross_slope = 0.0
        )

    # simple construction
    calc = Slab(40)

    @test expected == calc

end

# Test Slab construction
let
    expected = Slab(
        width = 40ft, 
        thickness = 8.5inch, 
        density = 0.15kcf, 
        fws_thickness = 0.0inch, 
        fws_density = 0.15kcf, 
        cross_slope = 0.02 
        )

    # simple construction
    calc = Slab(width=40, cross_slope=0.02)

    @test expected == calc

end