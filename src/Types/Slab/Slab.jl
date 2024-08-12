
# ----------------
# SLAB
# ----------------

"""
    struct Slab

Contains information for the slab of a bridge.

# Fields
- `width::float_ft` - width of the slab
- `thickness::float_inch = 8.5inch` - thickness of the slab
- `density::float_kcf = 0.15kcf` -  density of the slab
- `fws_thickness::float_inch = 0.0inch` -  density of the sidewalk
- `fws_density::float_kcf = 0.15kcf` - back span start beam to distribute sidewalk
- `cross_slope::Float64 = 0.0` - back span end beam to distribute sidewalk

# Constuctors
```
Slab(width, thickness = 8.5inch, density = 0.15kcf, fws_thickness = 0.0inch, fws_density = 0.15kcf, cross_slope = 0.0)
Slab(; width, thickness = 8.5inch, density = 0.15kcf, fws_thickness = 0.0inch, fws_density = 0.15kcf, cross_slope = 0.0)
```

# Examples

```julia-repl
julia> Slab(40)
Slab
  width: 40.0 ft
  thickness: 8.5 inch
  density: 0.15 kcf
  fws_thickness: 0.0 inch
  fws_density: 0.15 kcf
  cross_slope: 0.0

julia> Slab(width=40, cross_slope=0.02)
Slab
  width: 40.0 ft
  thickness: 8.5 inch
  density: 0.15 kcf
  fws_thickness: 0.0 inch
  fws_density: 0.15 kcf
  cross_slope: 0.02
```
"""
@with_kw_noshow struct Slab
    width::float_ft
    thickness::float_inch = 8.5inch
    density::float_kcf = 0.15kcf
    fws_thickness::float_inch = 0.0inch
    fws_density::float_kcf = 0.15kcf
    cross_slope::Float64 = 0.0

    function Slab(width, thickness = 8.5inch, density = 0.15kcf, fws_thickness = 0.0inch, fws_density = 0.15kcf, cross_slope = 0.0)
        new(
            width           |> to_ft,
            thickness       |> to_inch,
            density         |> to_kcf,
            fws_thickness   |> to_inch,
            fws_density     |> to_kcf,
            cross_slope     |> to_float
        )
    end
end

Base.show(io::IO, x::Slab) = custom_show(io, x)


function points(slab::Slab)
    x = [0.0ft, slab.width, slab.width, 0.0ft, 0.0ft]
    y = [0.0inch, 0.0inch, slab.thickness, slab.thickness, 0.0inch]
    return x, y
end
