# ----------------
# BEARING PAD
# ----------------
"""
    struct BearingPad

A bearing pad for a girder.

# Fields
- `width::float_ft` - width of bearing pad
- `height::float_inch = 2.75inch` - height of bearing pad
- `distance::float_inch = 12inch` - offset from CL Bent or face of stem

# Constructors
```
BearingPad(width, height, distance) -> BearingPad
BearingPad(; width, height, distance) -> BearingPad
```
# Examples
```julia-repl
julia> BearingPad(3)
BearingPad
  width: 3.0 ft
  height: 2.75 inch
  distance: 12.0 inch

julia> BearingPad(3, 5.5, 10)
BearingPad
  width: 3.0 ft
  height: 5.5 inch
  distance: 10.0 inch
```
"""
@with_kw_noshow struct BearingPad
    width::float_ft
    height::float_inch = 2.75inch
    distance::float_inch = 12inch

    function BearingPad(width, height = 2.75inch, distance = 12inch)
        new(
            width       |> to_ft,
            height      |> to_inch,
            distance    |> to_inch
        )
    end
end

Base.show(io::IO, x::BearingPad) = custom_show(io, x)