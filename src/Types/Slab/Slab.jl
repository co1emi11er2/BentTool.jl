
# ----------------
# SLAB
# ----------------

@with_kw_noshow struct Slab
    width::float_ft
    thickness::float_inch = 8.5inch
    fws_thickness::float_inch = 0.0inch
    fws_density::float_kcf = 0.15kcf
    cross_slope::Float64 = 0.0

    function Slab(width, thickness, fws_thickness, fws_density, cross_slope)
        new(
            width           |> to_ft,
            thickness       |> to_inch,
            fws_thickness   |> to_inch,
            fws_density     |> to_kcf,
            cross_slope     |> to_float
        )
    end
end

Base.show(io::IO, x::Slab) = custom_show(x)
