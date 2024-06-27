abstract type Column end

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

@with_kw struct ColumnInfo{T<:Column}
    column::T
    n_columns::Int8
    spacing::Vector{float_ft}
end

