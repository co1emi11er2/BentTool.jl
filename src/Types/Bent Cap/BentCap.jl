abstract type BentCap end

@with_kw struct RectangularBentCap{T<:ColumnInfo} <: BentCap
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
    bars_a_info::BarsAInfo
    bars_b_info::BarsBInfo
    bars_s_info::BarsSInfo
    bars_t_info::BarsTInfo
    column_info::T
end

@with_kw struct InvTBentCap{T<:ColumnInfo} <: BentCap
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
    bars_a_info::BarsAInfo
    bars_b_info::BarsBInfo
    bars_s_info::BarsSInfo
    bars_t_info::BarsTInfo
    column_info::T
end



