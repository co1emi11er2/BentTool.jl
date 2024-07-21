# ----------------
# PGL
# ----------------

# Enum for PGL curve direction
"Curve type of PGL. Set to `left` if no curve"
@enumx CurveType begin
    left
    right
    straight
end

"""
    curve_type(curve::String)

If curve is of type *Sting*, the function 
will output the corresponding curve direction in enum format.
"""
function curve_type(curve::String)
    getproperty(CurveType, Symbol(curve))
end
curve_type(curve::CurveType.T) = curve

"""
    struct PGL
    
The Profile Grade Line of a bridge.

# Fields
- `curve_direction::CurveType.T = CurveType.left` - curve direction of PGL
- `offset::float_ft = 0.0ft` - offset from left edge of slab
- `radius::float_ft = 0.0ft` - radius of PGL

# Constructors
```
PGL(curve_direction, offset, radius) -> PGL
```

# Examples
```julia-repl
julia> PGL()
PGL
  curve_direction: straight
  offset: 0.0 ft
  radius: 0.0 ft

julia> PGL("left", 5.5, 1000)
PGL
  curve_direction: left
  offset: 5.5 ft
  radius: 1000.0 ft

julia> PGL(CurveType.left, 5.5, 1000)
PGL
  curve_direction: left
  offset: 5.5 ft
  radius: 1000.0 ft
```
"""
@with_kw_noshow struct PGL
    curve_direction::CurveType.T = CurveType.straight
    offset::float_ft = 0.0ft
    radius::float_ft = 0.0ft

    function PGL(curve_direction, offset, radius)
        new(
            curve_direction |> curve_type,
            offset |> to_ft,
            radius |> to_ft,
        )
    end
end

Base.show(io::IO, x::PGL) = custom_show(io, x)