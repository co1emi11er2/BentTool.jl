using StructuralUnits
import BentTool: Sidewalk
# ----------------
# SIDEWALK
# ----------------

# Test Sidewalk construction without inputs
let
    expected = Sidewalk(
        width = 0.0ft, 
        thickness = 0.0inch, 
        density = 0.15kcf, 
        dist_bk_start = 0, 
        dist_bk_end = 0, 
        dist_fd_start = 0, 
        dist_fd_end = 0
        )

    # simple construction
    calc = Sidewalk() 

    @test calc == expected

end

# Test Sidewalk construction with inputs
let
    expected = Sidewalk(
        width = 10ft, 
        thickness = 4inch, 
        density = 0.15kcf, 
        dist_bk_start = 0, 
        dist_bk_end = 0, 
        dist_fd_start = 0, 
        dist_fd_end = 0
        )

    # simple construction
    calc = Sidewalk(10, 4) 

    @test calc == expected

end