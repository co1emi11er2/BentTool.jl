# ----------------
# float
# ----------------
"""
    to_float(x)

Converts x to `Float64``.
"""
to_float(x::Real) = convert(Float64, x)
to_float(x::String) = parse(Float64, x)

# ----------------
# int
# ----------------
"""
    to_int(x)

Converts x to `Int``.
"""
to_int(x::Real) = convert(Int, x)
to_int(x::String) = parse(Int, x)


# ----------------
# ft
# ----------------
"""
    to_ft(x)

Converts x to a Unitful quantity with unit `ft`. 
"""
to_ft(x::Real) = x * ft
to_ft(x::String) = parse(Float64, x) * ft
to_ft(x::Quantity) = x
function to_ft(x) 
    ErrorException("Incorrect Type. Expected float, int, or string, got $(typeof(x))")
end

# ----------------
# inch
# ----------------
"""
    to_inch(x)

Converts x to a Unitful quantity with unit `inch`. 
"""
to_inch(x::Real) = x * inch
to_inch(x::String) = parse(Float64, x) * inch
to_inch(x::Quantity) = x
function to_inch(x) 
    ErrorException("Incorrect Type. Expected float, int, or string, got $(typeof(x))")
end

# ----------------
# kcf
# ----------------
"""
    to_kcf(x)

Converts x to a Unitful quantity with unit `kcf`. 
"""
to_kcf(x::Real) = x * kcf
to_kcf(x::String) = parse(Float64, x) * kcf
to_kcf(x::Quantity) = x
function to_kcf(x) 
    ErrorException("Incorrect Type. Expected float, int, or string, got $(typeof(x))")
end

# ----------------
# plf
# ----------------
"""
    to_plf(x)

Converts x to a Unitful quantity with unit `plf`. 
"""
to_plf(x::Real) = x * plf
to_plf(x::String) = parse(Float64, x) * plf
to_plf(x::Quantity) = x
function to_plf(x) 
    ErrorException("Incorrect Type. Expected float, int, or string, got $(typeof(x))")
end