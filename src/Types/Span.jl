


abstract type Span end

@with_kw struct SimpleSpan <: Span
    slab::Slab
    girder_info::GirderInfo
    osho_left::float_ft
    osho_right::float_ft
    length::float_ft
end

# SimpleSpan(;slab, osho_left, osho_right, length, girder)

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




