"""
    struct CircularColumn <: Column

A circular column for a bent.

# Fields
- `diameter::float_inch`
- `height::float_ft`
"""
Base.@kwdef struct CircularColumn <: Column
    diameter::float_inch
    height::float_ft

    @doc """
        CircularColumn(diameter, height) -> CircularColumn
        CircularColumn(;diameter, height) -> CircularColumn

    Constructs a `CircularColumn` struct.

    # Arguments or Keywords
    - `diameter::float_inch`
    - `height::float_ft`

    # Examples
    ```julia-repl
    julia> CircularColumn(96, 21)
    CircularColumn
      diameter: 96.0 inch
      height: 21.0 ft
    ```
    """
    function CircularColumn(diameter, height)
        new(
            diameter    |> to_inch,
            height      |> to_ft
        )
    end
end

Base.show(io::IO, x::CircularColumn) = custom_show(io, x)