"""
    struct CircularColumn <: Column

A circular column for a bent.

# Fields
- `diameter::float_inch`
- `height::float_ft`

# Constructors
```
CircularColumn(diameter, height) -> CircularColumn
CircularColumn(; diameter, height) -> CircularColumn
```

# Examples
```julia-repl
julia> CircularColumn(96, 21)
CircularColumn
    diameter: 96.0 inch
    height: 21.0 ft
```
"""
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

Base.show(io::IO, x::CircularColumn) = custom_show(io, x)

function points(col::CircularColumn)
    x = [0.0ft, col.diameter, col.diameter, 0.0ft, 0.0ft]
    y = [0.0ft, 0.0ft, -5.0ft, -5.0ft, 0.0inch]

    # center x values on zero
    x_offset = col.diameter/2
    x = x .- x_offset
    return x, y
end