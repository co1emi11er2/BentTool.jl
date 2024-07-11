@with_kw struct CircularColumn <: Column
    diameter::float_inch
    height::float_ft

    function CircularColumn(diameter, height)
        new(
            diameter    |> to_inch,
            height      |> to_ft
        )
    end
end