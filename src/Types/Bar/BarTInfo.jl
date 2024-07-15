@with_kw_noshow struct BarTInfo
    bar::Bar
    n_bars_face::Int8
end

Base.show(io::IO, x::BarTInfo) = custom_show(x)