@with_kw_noshow struct CircularColumn <: Column
    diameter::float_inch
    height::float_ft

    function CircularColumn(diameter, height)
        new(
            diameter    |> to_inch,
            height      |> to_ft
        )
    end
end

Base.show(io::IO, ::MIME"text/plain", x::CircularColumn) = custom_show(x)