"""
    struct RectangularColumn <: Column

A rectangualr column for a bent.

# Fields
- `width::float_inch` - width of column (perpendicular to roadway)
- `length::float_inch` - length of column (parallel to roadway)
- `height::float_ft` - height of column

# Constructors
```
RectangularColumn(width, length, height) -> RectangularColumn
RectangularColumn(; width, length, height) -> RectangularColumn
```

# Examples
```julia-repl
julia> RectangularColumn(72, 96, 21)
RectangularColumn
    width: 72.0 inch
    length: 96.0 inch
    height: 21.0 ft

```
"""
@with_kw_noshow struct RectangularColumn <: Column
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

Base.show(io::IO, ::MIME"text/plain", x::RectangularColumn) = custom_show(io, x)

function points(col::RectangularColumn)
    x = [0.0ft, col.width, col.width, 0.0ft, 0.0ft]
    y = [0.0ft, 0.0ft, -5.0ft, -5.0ft, 0.0inch]

    # center x values on zero
    x_offset = col.width/2
    x = x .- x_offset
    return x, y
end