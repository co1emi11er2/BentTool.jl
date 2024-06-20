
# ----------------
# SLAB
# ----------------

@with_kw struct Slab
    width::float_ft
    thickness::float_inch = 8.5inch
    fws_thickness::float_inch = 0.0inch
    fws_density::float_kcf = 0.15kcf
    cross_slope::Float64 = 0.0

    function Slab(width, thickness, fws_thickness, fws_density, cross_slope)
        new(
            width           |> to_ft,
            thickness       |> to_inch,
            fws_thickness   |> to_inch,
            fws_density     |> to_kcf,
            cross_slope     |> to_float
        )
    end
end


# ----------------
# PGL
# ----------------

# Enum for PGL curve direction
"Curve type of PGL. Set to `left` if no curve"
@enumx CurveType begin
    left
    right
end

"""
    curve_type(curve::String)

If curve is of type *Sting*, the function 
will output the corresponding curve direction in enum format.
"""
function curve_type(curve::String)
    @match curve begin
        "left" => CurveType.left
        "right" => CurveType.right
        _ => error("Girder type: $girder not found")
    end
end

@with_kw struct PGL
    radius::float_ft = 0.0ft
    offset::float_ft = 0.0ft
    curve_direction::CurveType.T = CurveType.left
end

# ----------------
# RAIL
# ----------------
@enumx RailType begin
    None
    SSCB
    T1F
    T1W
    T1P
    T2P
    T221
    T222
    T223
    T224
    T401
    T402
    T411
    T551
    T552
    T631
    T631LS
    T66
    T77
    SSTR
    T80HT
    T80SS
    C1W
    C2P
    C221
    C223
    C402
    C411
    C412
    C66
    PR1orPR11
    PR2
    PR22
    PR3
    T10
    T203
    T501
    T502
    T503
    T504
    T6
    HT
    C203
    C501
    C502
    B3
    SSR
end

@with_kw struct Rail
    type::RailType.T
    height::float_inch
    width::float_ft
    weight::float_plf
end

"""
    Rail(type)

Will construct a Rail object based on the type.
"""
function Rail(type::RailType.T)
    # initialize dataframe
    csv_file_name = "Rails.csv"
    lookup_col_name = :type
    lookup_value = string(type)
    rail = import_data(lookup_value, lookup_col_name, csv_file_name)

    # return a rail object
    Rail(
        type, 
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


