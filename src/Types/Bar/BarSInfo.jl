@with_kw_noshow struct BarSInfo
    bar::Bar
    n_bundle::Int8
end

Base.show(io::IO, x::BarSInfo) = custom_show(x)