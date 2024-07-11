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

function Plots.plot(u::SimpleUnit)
    plt1 = plot(u.bk)
    plt2 = plot(u.fd)
    plot(plt1, plt2, layout = grid(2, 1))
end
