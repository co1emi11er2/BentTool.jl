import BentTool: CurveType, PGL
# ----------------
# PGL
# ----------------

# PGL constructor
let 
    expected = PGL(
        curve_direction=CurveType.left,
        offset=5.5ft,
        radius=1000ft
    )

    calc = PGL("left", 5.5, 1000)
    calc2 = PGL(CurveType.left, "5.5", 1000)

    @test expected == calc
    @test expected == calc2
end

# Default PGL constructor
let 
    expected = PGL(
        curve_direction=CurveType.straight,
        offset=0.0ft,
        radius=0.0ft
    )

    calc = PGL()

    @test expected == calc
end