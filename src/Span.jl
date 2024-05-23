


abstract type Span end

struct SimpleSpan <: Span
    slab::Slab
    girders::Girder
    brg::BearingPad
    pdstl::Pedestal
    osho_left::float_ft
    osho_right::float_ft
    length::float_ft
end

abstract type BridgeUnit end

struct SimpleUnit{T<:BentCap}
    bk::SimpleSpan
    fd::SimpleSpan
    bent::T
    pgl::PGL
    rail::RailInfo
    sw::Sidewalk
    has_super::Bool
    dsgn_speed::float_mph
end #TODO: This is where I left off. How will I distinguish single column vs multicolumn




