import BentTool: RailInfo, Rail

# ----------------
# RAIL INFO
# ----------------

# Test RailInfo construction
let
    expected = RailInfo(
        rail_left = Rail("T222"),
        rail_right = Rail("T222"),
        rail_3rd = Rail(RailType.None),
        dist_outside_to_all = false,
        dist_bk_start = 0,
        dist_bk_end = 0,
        dist_fd_start = 0,
        dist_fd_end = 0,
    )

    # simple construction
    calc = RailInfo(
        Rail("T222"),
        Rail("T222"),
    ) 

    for field in fieldnames(typeof(calc))
        @test getfield(calc, field) == getfield(expected, field)
    end

end