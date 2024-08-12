# ----------------
# SIMPLE SPAN
# ----------------

"""
    struct SimpleSpan

Contains information for the slab of a bridge.

# Fields
- `slab::Slab` - slab of span
- `girder_info::GirderInfo` - girder information for the span
- `length` -  length of the span

# Constuctors
```
SimpleSpan(slab, girder_info, length)
SimpleSpan(; slab, girder_info, length)
```
"""
@with_kw_noshow struct SimpleSpan <: Span
    slab::Slab
    girder_info::GirderInfo
    length::float_ft
end

Base.show(io::IO, x::SimpleSpan) = custom_show(io, x)


"""
    init_simple_span(;width, length, girder_type::GirderType.T, n_girders::Int, spacing, haunch_height=3inch)

Given the slab width, span length, girder type, number of girders, spacing of girders, and the haunch height, a SimpleSpan object is constructed.

"""
function init_simple_span(;width, length, girder_type::GirderType.T, n_girders::Int, spacing, haunch_height=3inch)
    width = width |> to_ft
    length = length |> to_ft
    spacing = spacing |> to_ft
    # set spacing to proper size
    if size(spacing) == ()
        spacing = vec(sequence(n_girders-1, 1, spacing, 0.0ft))
    elseif size(spacing) != (n_girders-1,)
        error("Incorrect size of `spacing`. Got $(size(spacing)), expected $((n_girders-1,))")
    end
    total_spacing = sum(spacing)
    osoh = (width - total_spacing)/2
    slab = Slab(width=width)
    girder_info = GirderInfo(
        Girder(girder_type; haunch_height = haunch_height), 
        n_girders, 
        [osoh, spacing...],
        )

    return SimpleSpan(
        slab = slab,
        girder_info = girder_info,
        length = length,
    )
end


# s = init_simple_span(width=38ft, length=100ft, girder_type="Tx54", spacing=8ft, n_girders = 5)
function Plots.plot(s::SimpleSpan)
    # plot girders
    girder_xs, girder_ys = points(s.girder_info)
    plot(
        girder_xs, 
        girder_ys; 
        aspectratio=:equal, 
        lc=:black, 
        legend=:none,
        xlabel="",
        ylabel="",
        dpi = 500,
        )

    # plot slab
    x, y = points(s.slab)
    plot!(
        x, 
        y; 
        aspectratio=:equal, 
        lc=:black, 
        legend=:none,
        )

    # plot dimensions of girders
    plot_h_dimensions!(girder_xs, girder_ys; error=3inch)
end

function Plots.plot(bk::SimpleSpan, fd::SimpleSpan)
    plt1 = plot(bk)
    title!("Back Span")
    plt2 = plot(fd)
    title!("Forward Span")
    plot(plt1, plt2, layout = grid(2, 1), dpi=500)
end