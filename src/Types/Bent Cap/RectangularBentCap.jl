Base.@kwdef struct RectangularBentCap{T<:ColumnInfo} <: BentCap
    length::float_ft 
    width::float_inch
    depth::float_inch
    bk_bm1_to_cap_end::float_ft
    fd_bm1_to_cap_end::float_ft
    bar_a_info::BarAInfo
    bar_b_info::BarBInfo
    bar_s_info::BarSInfo
    bar_t_info::BarTInfo
    column_info::T
    skew::float_deg = 0.0°
    density::float_pcf = 150.0pcf
    fc::float_ksi = 4.0ksi
    fy::float_ksi = 60.0ksi
    exposure::String = "Class 1"
    offset_to_leveling_pad::float_inch = 12.0inch

    function RectangularBentCap(
        length,
        width,
        depth,
        bk_bm1_to_cap_end,
        fd_bm1_to_cap_end,
        bar_a_info,
        bar_b_info,
        bar_s_info,
        bar_t_info,
        column_info::T,
        skew,
        density,
        fc,
        fy,
        exposure,
        offset_to_leveling_pad,
    ) where T
        new{T}(
            length |> to_ft,
            width |> to_inch,
            depth |> to_inch,
            bk_bm1_to_cap_end |> to_ft,
            fd_bm1_to_cap_end |> to_ft,
            bar_a_info,
            bar_b_info,
            bar_s_info,
            bar_t_info,
            column_info,
            skew |> to_deg,
            density |> to_pcf,
            fc |> to_ksi,
            fy |> to_ksi,
            exposure,
            offset_to_leveling_pad  |> to_inch,
        )
    end
end

Base.show(io::IO, x::RectangularBentCap) = custom_show(io, x)