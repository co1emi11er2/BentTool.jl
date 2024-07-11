Base.@kwdef struct RectangularBentCap{T<:ColumnInfo} <: BentCap
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
    bar_a_info::BarAInfo
    bar_b_info::BarBInfo
    bar_s_info::BarSInfo
    bar_t_info::BarTInfo
    column_info::T

    function RectangularBentCap(
        density,
        fc,
        fy,
        exposure,
        skew,
        length,
        bk_bm1_to_cap_end,
        fd_bm1_to_cap_end,
        depth,
        width,
        offset_to_leveling_pad,
        bar_a_info,
        bar_b_info,
        bar_s_info,
        bar_t_info,
        column_info::T
    ) where T
        new{T}(
            density |> to_pcf,
            fc |> to_ksi,
            fy |> to_ksi,
            exposure,
            skew |> to_deg,
            length |> to_ft,
            bk_bm1_to_cap_end |> to_ft,
            fd_bm1_to_cap_end |> to_ft,
            depth |> to_inch,
            width |> to_inch,
            offset_to_leveling_pad  |> to_inch,
            bar_a_info,
            bar_b_info,
            bar_s_info,
            bar_t_info,
            column_info
        )
        
    end
end