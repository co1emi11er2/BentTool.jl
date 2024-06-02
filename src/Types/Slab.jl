

@with_kw struct Slab
    width::float_ft
    thickness::float_inch = 8.5inch
    fws_thickness::float_inch = 0.0inch
    fws_density::float_kcf = 0.15kcf
    cross_slope::Float64 = 0.0
end



@with_kw struct PGL
    radius::float_ft = 0.0ft
    offset::float_ft = 0.0ft
end


@with_kw struct Rail
    type::String
    height::float_inch
    width::float_ft
    weight::float_plf
end

"""
    Rail(type)

Will construct a Rail object based on the type.
"""
function Rail(type)
    # initialize dataframe
    data_dir = joinpath(@__DIR__, "..", "..", "data", "Rails.csv") #TODO: fix data directory
    df = CSV.read(data_dir, DataFrame)

    # filter by type
    rail = @chain df begin
        @filter(type==!!type)
        first
    end

    # return a rail object
    Rail(
        rail.type, 
        rail.height_in*inch, 
        rail.width_ft*ft, 
        rail.weight_plf*plf)
end


@with_kw struct RailInfo
    dist_outside_to_all::Bool
    rail_left::Rail
    rail_right::Rail
    rail_3rd::Rail
    dist_bk_start::Int64
    dist_bk_end::Int64
    dist_fd_start::Int64
    dist_fd_end::Int64
end

@with_kw struct Sidewalk
    width::float_ft = 0.0ft
    thickness::float_ft = 0.0ft
    density::float_kcf = 0.15kcf
    dist_bk_start::Int64
    dist_bk_end::Int64
    dist_fd_start::Int64
    dist_fd_end::Int64
end

