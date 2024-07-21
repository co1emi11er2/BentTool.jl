# ----------------
# PGL
# ----------------

# Enum for PGL curve direction
"Curve type of PGL. Set to `left` if no curve"
@enumx CurveType begin
    left
    right
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
- `radius::float_ft = 0.0ft` - radius of PGL
- `offset::float_ft = 0.0ft` - offset from left edge of slab
- `curve_direction::CurveType.T = CurveType.left` - curve direction of PGL
"""
@with_kw_noshow struct PGL
    radius::float_ft = 0.0ft
    offset::float_ft = 0.0ft
    curve_direction::CurveType.T = CurveType.left

    function PGL(radius, offset, curve_direction)
        new(
            radius |> to_ft,
            offset |> to_ft,
            curve_direction |> curve_type
        )
    end
end

Base.show(io::IO, x::PGL) = custom_show(io, x)