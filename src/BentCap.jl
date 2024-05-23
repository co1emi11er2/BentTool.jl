abstract type BentCap end

struct RectangularBentCap <: BentCap
    density::float_pcf
    fc::float_ksi
    fy::float_ksi
    exposure::String
    skew::float_deg
    length::float_ft
    bk_bm1_to_cap_end::float_ft
    fd_bm1_to_cap_end::float_ft
    depth::float_inch
    width::float_inch
    offset_to_leveling_pad::float_inch
end

struct InvTBentCap <: BentCap
    density::float_pcf
    fc::float_ksi
    fy::float_ksi
    exposure::String
    skew::float_deg
    length::float_ft
    bk_bm1_to_cap_end::float_ft
    fd_bm1_to_cap_end::float_ft
    ledge_depth::float_inch
    full_depth::float_inch #TODO: Verify this is full depth
    stem_width::float_inch
    bottom_width::float_inch
    offset_to_leveling_pad::float_inch
    earwall_left::float_ft
    earwall_right::float_ft
end

struct BarsAInfo
    size::String
    dist_btwn_rows::float_inch
    n_row1::Int64 #TODO: could probably do Int8
    n_row2::Int64
    n_row3::Int64
end

struct BarsBInfo
    size::String
    dist_btwn_rows::float_inch
    n_row1::Int64 #TODO: could probably do Int8
    n_row2::Int64
    n_row3::Int64
end

struct BarsSInfo
    size::String
    n_bundle::Int64 #TODO: Do this instead of string?
end

struct BarsTInfo
    size::String
    n_bars_face::Int64 #TODO: Do this instead of string?
end

