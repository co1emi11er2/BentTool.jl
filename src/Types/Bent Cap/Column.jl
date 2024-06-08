abstract type Column end

@with_kw struct RectangularColumn <: Column
    width::float_inch
    length::float_inch
    height::float_ft
end

@with_kw struct CircularColumn <: Column
    diameter::float_inch
    height::float_ft
end

@with_kw struct ColumnInfo{T<:Column}
    column::T
    n_columns::Int8
    spacing::Vector{float_ft}
end

