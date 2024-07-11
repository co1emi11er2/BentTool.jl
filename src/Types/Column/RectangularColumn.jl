@with_kw struct RectangularColumn <: Column
    width::float_inch
    length::float_inch
    height::float_ft

    function RectangularColumn(width, length, height)
        new(
            width   |> to_inch,
            length  |> to_inch,
            height  |> to_ft
        )
    end
end