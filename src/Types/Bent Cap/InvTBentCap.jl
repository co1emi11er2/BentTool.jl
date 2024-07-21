Base.@kwdef struct InvTBentCap{T<:ColumnInfo} <: BentCap
    length::float_ft
    stem_width::float_inch
    bottom_width::float_inch
    ledge_depth::float_inch
    full_depth::float_inch #TODO: Verify this is full depth
    bk_bm1_to_cap_end::float_ft
    fd_bm1_to_cap_end::float_ft
    earwall_left::float_ft
    earwall_right::float_ft
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


    function InvTBentCap(
        length,
        stem_width,
        bottom_width,
        ledge_depth,
        full_depth,
        bk_bm1_to_cap_end,
        fd_bm1_to_cap_end,
        earwall_left,
        earwall_right,
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
            stem_width |> to_inch,
            bottom_width |> to_inch,
            ledge_depth |> to_inch,
            full_depth |> to_inch,
            bk_bm1_to_cap_end |> to_ft,
            fd_bm1_to_cap_end |> to_ft,
            earwall_left |> to_ft,
            earwall_right |> to_ft,
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
            offset_to_leveling_pad |> to_inch, 
        )
        
    end
end

Base.show(io::IO, x::InvTBentCap) = custom_show(io, x)



