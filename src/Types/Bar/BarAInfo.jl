"""


"""
@with_kw_noshow struct BarAInfo
    bar::Bar
    dist_btwn_rows::float_inch
    n_row1::Int8
    n_row2::Int8 = 0
    n_row3::Int8 = 0

    function BarAInfo(bar, dist_btwn_rows, n_row1, n_row2, n_row3)
        new(
            bar,
            dist_btwn_rows |> to_inch,
            n_row1,
            n_row2,
            n_row3,
        )
    end
end

Base.show(io::IO, ::MIME"text/plain", x::BarAInfo) = custom_show(x)