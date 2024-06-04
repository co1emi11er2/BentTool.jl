


abstract type Span end

@with_kw struct SimpleSpan <: Span
    slab::Slab
    girder_info::GirderInfo
    osho_left::float_ft
    osho_right::float_ft
    length::float_ft
end

"""
    SimpleSpan(;width, length, girder_type, n_girders, spacing)

Given the girder type, number of girders, width of slab, spacing of girders, and the length of span, a SimpleSpan object is constructed.

"""
function init_simple_span(;width, length, girder_type::String, n_girders::Int, spacing, haunch_height=3inch)

    # set spacing to proper size
    if size(spacing) == ()
        spacing = sequence(n_girders-1, 1, spacing, 0.0ft)
    elseif size(spacing) != (n_girders-1,)
        error("Incorrect size of `spacing`. Got $(size(spacing)), expected $((n_girders-1,))")
    end
    total_spacing = spacing*(n_girders-1)
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

