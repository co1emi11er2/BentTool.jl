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
        bars_a_info,
        bars_b_info,
        bars_s_info,
        bars_t_info,
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
            bars_a_info,
            bars_b_info,
            bars_s_info,
            bars_t_info,
            column_info
        )
        
    end
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

    function InvTBentCap(
        density, 
        fc, 
        fy, 
        exposure,
        skew, 
        length,
        bk_bm1_to_cap_end,
        fd_bm1_to_cap_end,
        ledge_depth,
        full_depth,
        stem_width,
        bottom_width,
        offset_to_leveling_pad, 
        earwall_left,
        earwall_right,
        bars_a_info,
        bars_b_info,
        bars_s_info,
        bars_t_info,
        column_info::T,
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
            ledge_depth |> to_inch,
            full_depth |> to_inch,
            stem_width |> to_inch,
            bottom_width |> to_inch,
            offset_to_leveling_pad |> to_inch, 
            earwall_left |> to_ft,
            earwall_right |> to_ft,
            bars_a_info,
            bars_b_info,
            bars_s_info,
            bars_t_info,
            column_info,
        )
        
    end
end



