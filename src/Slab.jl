

struct Slab
    width::float_ft
    thickness::float_inch
    fws_thickness::float_inch
    fws_density::float_kcf
    cross_slope::Float64
end

struct BearingPad
    width::float_ft
    height::float_inch
    distance::float_inch
end

struct Pedestal
    width::float_inch
    height::float_inch
end

struct PGL
    radius::float_ft
    offset::float_ft
end


struct Rail
    type::String
    height::float_inch
    width::float_ft
    weight::float_plf
end

struct RailInfo
    dist_outside_to_all::Bool
    rail_left::Rail
    rail_right::Rail
    rail_3rd::Rail
    dist_bk_start::Int64
    dist_bk_end::Int64
    dist_fd_start::Int64
    dist_fd_end::Int64
end

struct Sidewalk
    width::float_ft
    thickness::float_ft
    density::float_kcf
    dist_bk_start::Int64
    dist_bk_end::Int64
    dist_fd_start::Int64
    dist_fd_end::Int64
end


