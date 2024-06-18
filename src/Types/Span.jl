


abstract type Span end

@with_kw struct SimpleSpan <: Span
    slab::Slab
    girder_info::GirderInfo
    osho_left::float_ft
    osho_right::float_ft
    length::float_ft
end

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
    osho = (width - total_spacing)/2
    slab = Slab(width=width)
    girder_info = init_girder_info(
        type = girder_type, 
        n_girders = n_girders, 
        osho_left = osho, 
        spacing = spacing,
        haunch_height = haunch_height
        )
    return SimpleSpan(
        slab = slab,
        girder_info = girder_info,
        osho_left = osho,
        osho_right = osho,
        length = length,
    )
end

abstract type BridgeUnit end

@with_kw struct SimpleUnit{T<:BentCap}
    bk::SimpleSpan
    fd::SimpleSpan
    bent::T
    pgl::PGL
    rail::RailInfo
    sw::Sidewalk
    has_super::Bool
    dsgn_speed::float_mph
end #TODO: This is where I left off. How will I distinguish single column vs multicolumn


# s = init_simple_span(width=38ft, length=100ft, girder_type="Tx54", spacing=8ft, n_girders = 5)
# function Plots.plot(s::SimpleSpan)
#     # plot girders
#     plot(
#         s.girder_info.x_points, 
#         s.girder_info.y_points; 
#         aspectratio=:equal, 
#         lc=:black, 
#         legend=:none,
#         xlabel="",
#         ylabel="",
#         )

#     # plot slab
#     x = [0.0ft, s.slab.width, s.slab.width, 0.0ft, 0.0ft]
#     y = [0.0inch, 0.0inch, s.slab.thickness, s.slab.thickness, 0.0inch]
#     plot!(
#         x, 
#         y; 
#         aspectratio=:equal, 
#         lc=:black, 
#         legend=:none,
#         )

#     # plot dimensions of girders
#     plot_h_dimensions!(s.girder_info.x_points, s.girder_info.y_points; error=3inch)
# end

# function Plots.plot(bk::SimpleSpan, fd::SimpleSpan)
#     plt1 = plot(bk)
#     title!("Back Span")
#     plt2 = plot(fd)
#     title!("Forward Span")
#     plot(plt1, plt2, layout = grid(2, 1))
# end

# function Plots.plot(u::SimpleUnit)
#     plt1 = plot(u.bk)
#     plt2 = plot(u.fd)
#     plot(plt1, plt2, layout = grid(2, 1))
# end

# GLMakie Method
function plot_span(s::SimpleSpan)
    # plot girders
    lines!.(
        s.girder_info.x_points, 
        s.girder_info.y_points; 
        color=:black, 
        )

    # plot slab
    x = [0.0ft, s.slab.width, s.slab.width, 0.0ft, 0.0ft]
    y = [0.0inch, 0.0inch, s.slab.thickness, s.slab.thickness, 0.0inch]
    lines!(
        x, 
        y; 
        color=:black
        )

    # plot dimensions of girders
    plot_h_dimensions_makie!(s.girder_info.x_points, s.girder_info.y_points;)
end

function plot_span(bk::SimpleSpan, fd::SimpleSpan)

    # make sure makie converts units properly
    uc = Makie.UnitfulConversion(ft; units_in_label=false)
    f = Figure()
    
    # plot backspan
    ax = Axis(f[1, 1], xlabel = "x label", ylabel = "y label",
    title = "Title", autolimitaspect = 1, dim1_conversion=uc, dim2_conversion=uc)
    plot_span(bk)

    # plot forward span
    ax = Axis(f[2, 1], xlabel = "x label", ylabel = "y label",
    title = "Title", autolimitaspect = 1, dim1_conversion=uc, dim2_conversion=uc)
    plot_span(fd)

    f
end