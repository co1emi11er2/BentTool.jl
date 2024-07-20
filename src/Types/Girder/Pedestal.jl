# ----------------
# PEDESTAL
# ----------------
"""
    struct Pedestal

A pedestal for a girder.

# Fields
- `width::float_ft` - width of pedestal
- `height::float_inch = 1.5inch` - height of pedestal

# Constructors
```
Pedestal(width, height) -> Pedestal
Pedestal(; width, height) -> Pedestal
```
# Examples
```julia-repl
julia> Pedestal(3)
Pedestal
  width: 3.0 ft
  height: 1.5 inch

julia> Pedestal(3, 2)
Pedestal
  width: 3.0 ft
  height: 2.0 inch
```
"""
@with_kw_noshow struct Pedestal
    width::float_ft
    height::float_inch = 1.5inch

    function Pedestal(width, height = 1.5inch)
        new(
            width   |> to_ft,
            height  |> to_inch,
        )
    end
end

Base.show(io::IO, x::Pedestal) = custom_show(io, x)