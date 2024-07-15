# ----------------
# BEARING PAD
# ----------------

@with_kw_noshow struct BearingPad
    width::float_ft
    height::float_inch = 2.75inch
    distance::float_inch = 12inch

    function BearingPad(width, height, distance)
        new(
            width       |> to_ft,
            height      |> to_inch,
            distance    |> to_inch
        )
    end
end

Base.show(io::IO, x::BearingPad) = custom_show(x)