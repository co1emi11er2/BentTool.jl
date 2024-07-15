@with_kw_noshow struct SimpleSpan <: Span
    slab::Slab
    girder_info::GirderInfo
    osoh_left::float_ft
    osoh_right::float_ft
    length::float_ft
end

Base.show(io::IO, x::SimpleSpan) = custom_show(x)


"""
    init_simple_span(;width, length, girder_type::GirderType.T, n_girders::Int, spacing, haunch_height=3inch)

Given the slab width, span length, girder type, number of girders, spacing of girders, and the haunch height, a SimpleSpan object is constructed.

"""
function init_simple_span(;width, length, girder_type::GirderType.T, n_girders::Int, spacing, haunch_height=3inch)

    # set spacing to proper size
    if size(spacing) == ()
        spacing = vec(sequence(n_girders-1, 1, spacing, 0.0ft))
    elseif size(spacing) != (n_girders-1,)
        error("Incorrect size of `spacing`. Got $(size(spacing)), expected $((n_girders-1,))")
    end
    total_spacing = sum(spacing)
    osoh = (width - total_spacing)/2
    slab = Slab(width=width)
    girder_info = init_girder_info(
        type = girder_type, 
        n_girders = n_girders, 
        osoh_left = osoh, 
        spacing = spacing,
        haunch_height = haunch_height
        )
    return SimpleSpan(
        slab = slab,
        girder_info = girder_info,
        osoh_left = osoh,
        osoh_right = osoh,
        length = length,
    )
end


# s = init_simple_span(width=38ft, length=100ft, girder_type="Tx54", spacing=8ft, n_girders = 5)
function Plots.plot(s::SimpleSpan)
    # plot girders
    plot(
        s.girder_info.x_points, 
        s.girder_info.y_points; 
        aspectratio=:equal, 
        lc=:black, 
        legend=:none,
        xlabel="",
        ylabel="",
        dpi = 500,
        )

    # plot slab
    x = [0.0ft, s.slab.width, s.slab.width, 0.0ft, 0.0ft]
    y = [0.0inch, 0.0inch, s.slab.thickness, s.slab.thickness, 0.0inch]
    plot!(
        x, 
        y; 
        aspectratio=:equal, 
        lc=:black, 
        legend=:none,
        )

    # plot dimensions of girders
    plot_h_dimensions!(s.girder_info.x_points, s.girder_info.y_points; error=3inch)
end

function Plots.plot(bk::SimpleSpan, fd::SimpleSpan)
    plt1 = plot(bk)
    title!("Back Span")
    plt2 = plot(fd)
    title!("Forward Span")
    plot(plt1, plt2, layout = grid(2, 1), dpi=500)
end