abstract type BentCap end

@with_kw struct RectangularBentCap <: BentCap
    density::float_pcf = 150.0pcf
    fc::float_ksi = 4.0ksi
    fy::float_ksi = 60.0ksi
    exposure::String = "Class 1"
    skew::float_deg = 0.0°
    length::float_ft 
    bk_bm1_to_cap_end::float_ft
    fd_bm1_to_cap_end::float_ft
    depth::float_inch
    width::float_inch
    offset_to_leveling_pad::float_inch = 12.0inch
end

@with_kw struct InvTBentCap <: BentCap
    density::float_pcf = 150.0pcf
    fc::float_ksi = 4.0ksi
    fy::float_ksi = 60.0ksi
    exposure::String = "Class 1"
    skew::float_deg = 0.0°
    length::float_ft
    bk_bm1_to_cap_end::float_ft
    fd_bm1_to_cap_end::float_ft
    ledge_depth::float_inch
    full_depth::float_inch #TODO: Verify this is full depth
    stem_width::float_inch
    bottom_width::float_inch
    offset_to_leveling_pad::float_inch = 12.0inch
    earwall_left::float_ft
    earwall_right::float_ft
end

@with_kw struct Bar
    size::Int8
    area::float_inch2
    weight::float_plf
    diameter::float_inch
end

@with_kw struct BarsAInfo
    size::Int8
    dist_btwn_rows::float_inch
    n_row1::Int8
    n_row2::Int8
    n_row3::Int8
end

@with_kw struct BarsBInfo
    size::Int8
    dist_btwn_rows::float_inch
    n_row1::Int8
    n_row2::Int8
    n_row3::Int8
end

@with_kw struct BarsSInfo
    size::Int8
    n_bundle::Int8
end

@with_kw struct BarsTInfo
    size::Int8
    n_bars_face::Int8
end

