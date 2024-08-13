"""
    struct RectangularBentCap{T<:ColumnInfo} <: BentCap

A rectangualr bent cap.

# Fields
- `length::float_ft` - length of cap
- `width::float_inch` - width of cap
- `depth::float_inch` - depth of cap
- `bar_a_info::BarAInfo` - bar A information for cap
- `bar_b_info::BarBInfo` - bar B information for cap
- `bar_s_info::BarSInfo` - bar S information for cap
- `bar_t_info::BarTInfo` - bar T information for cap
- `column_info::T` - column information of cap
- `offset::float_ft` - distance from left edge of slab to left edge of cap (- for left of slab)
- `skew::float_deg = 0.0°` - skew of bent cap to PGL
- `density::float_pcf = 150.0pcf` - density of cap
- `fc::float_ksi = 4.0ksi` - strength of cap
- `fy::float_ksi = 60.0ksi` - strength of rebar in cap
- `exposure::String = "Class 1`" - exposure of cap
- `offset_to_leveling_pad::float_inch = 12.0inch` - offset to leveling pad

# Constructors
```
RectangularBentCap(
        length,
        width,
        depth,
        bar_a_info,
        bar_b_info,
        bar_s_info,
        bar_t_info,
        column_info,
        offset,
        skew,
        density,
        fc,
        fy,
        exposure,
        offset_to_leveling_pad,
    ) -> RectangularBentCap

RectangularBentCap(;
        length,
        width,
        depth,
        bar_a_info,
        bar_b_info,
        bar_s_info,
        bar_t_info,
        column_info,
        offset,
        skew,
        density,
        fc,
        fy,
        exposure,
        offset_to_leveling_pad,
    ) -> RectangularBentCap
```

# Examples
```julia-repl
julia> RectangularColumn(72, 96, 21)
RectangularColumn
    width: 72.0 inch
    length: 96.0 inch
    height: 21.0 ft

```
"""
Base.@kwdef struct RectangularBentCap{T<:ColumnInfo} <: BentCap
    length::float_ft 
    width::float_inch
    depth::float_inch
    bar_a_info::BarAInfo
    bar_b_info::BarBInfo
    bar_s_info::BarSInfo
    bar_t_info::BarTInfo
    column_info::T
    offset::float_ft
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
        bar_a_info,
        bar_b_info,
        bar_s_info,
        bar_t_info,
        column_info::T,
        offset,
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
            bar_a_info,
            bar_b_info,
            bar_s_info,
            bar_t_info,
            column_info,
            offset |> to_ft,
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

# bk_bm1_to_cap_end::float_ft # TODO: Change to spacing from left edge of slab
# fd_bm1_to_cap_end::float_ft
function points(cap::RectangularBentCap)
    x = [0.0ft, cap.length, cap.length, 0.0ft, 0.0ft]
    y = [0.0ft, 0.0ft, -cap.depth, -cap.depth, 0.0inch]
    return x, y
end

# function Plots.plot(cap::RectangularBentCap, x_offset=0.0ft, y_offset=0.0ft)
#     # plot cap
#     cap_xs, cap_ys = points(cap)

#     ## adjust points for x and y offset
#     cap_xs = cap_xs .- x_offset
#     cap_xs = cap_xs .- x_offset

#     plt = plot(
#         cap_xs, 
#         cap_ys; 
#         aspectratio=:equal, 
#         lc=:black, 
#         legend=:none,
#         xlabel="",
#         ylabel="",
#         dpi = 500,
#         )

#     # plot columns
#     col_xs, col_ys = points(cap.column_info)

#     ## adjust x dimensions
#     col_xs = [col .- x_offset for col in col_xs]

#     ## adjust y dimensions
#     y_offset = y_offset + cap.depth
#     col_ys = [col .- y_offset for col in col_ys]


#     plot!(
#         col_xs, 
#         col_ys; 
#         aspectratio=:equal, 
#         lc=:black, 
#         legend=:none,
#         )

#     # plot dimensions of girders
#     if cap.column_info.n_columns != 1
#         plot_h_dimensions!(col_xs, col_ys; error=3inch)
#     end
#     plt
# end

@recipe function f(cap::RectangularBentCap;)
    linecolor   --> :black
    seriestype  :=  :shape
    fillcolor := :lightgrey
    legend := false
    aspect_ratio := :equal

    x_offset = 0.0ft
    y_offset = 0.0ft
    
    @series begin
    # plot cap
    cap_xs, cap_ys = points(cap)

    ## adjust points for x and y offset
    cap_xs = cap_xs .- x_offset
    cap_xs = cap_xs .- x_offset

    cap_xs, cap_ys
    end

    # plot columns
    col_xs, col_ys = points(cap.column_info)

    ## adjust x dimensions
    col_xs = [col .- x_offset for col in col_xs]

    ## adjust y dimensions
    y_offset = y_offset + cap.depth
    col_ys = [col .- y_offset for col in col_ys]

    col_xs, col_ys
end

function ix(cap::RectangularBentCap)
    Ix = ix_rectangle(cap.width, cap.depth)
    return Ix
end

function ix_rectangle(b, h)
    Ix = b*h^3/12
end

