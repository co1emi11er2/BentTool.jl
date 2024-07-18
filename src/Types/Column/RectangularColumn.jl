"""
    struct RectangularColumn <: Column

A rectangualr column for a bent.

# Fields
- `width::float_inch` - width of column (perpendicular to roadway)
- `length::float_inch` - length of column (parallel to roadway)
- `height::float_ft` - height of column
"""
Base.@kwdef struct RectangularColumn <: Column
    width::float_inch
    length::float_inch
    height::float_ft

    @doc """
        RectangularColumn(width, length, height) -> RectangularColumn
        RectangularColumn(;width, length, height) -> RectangularColumn

    Constructs a `RectangularColumn` struct.

    # Arguments or Keywords
    - `width::float_inch` - width of column (perpendicular to roadway)
    - `length::float_inch` - length of column (parallel to roadway)
    - `height::float_ft` - height of column

    # Examples
    ```julia-repl
    julia> RectangularColumn(72, 96, 21)
    RectangularColumn
      width: 72.0 inch
      length: 96.0 inch
      height: 21.0 ft
    ```
    """
    function RectangularColumn(width, length, height)
        new(
            width   |> to_inch,
            length  |> to_inch,
            height  |> to_ft
        )
    end
end

Base.show(io::IO, ::MIME"text/plain", x::RectangularColumn) = custom_show(io, x)