"""
    struct ColumnInfo{T<:Column}

A struct that contains column information for a bent.

# Fields
- `column::T` - a type of `Column` struct
- `n_columns::Int8` - number of columns in the bent
- `spacing::Vector{float_ft}` - spacing of column/s (first entry is the offset from 
left end of cap)
"""
Base.@kwdef struct ColumnInfo{T<:Column}
    column::T
    n_columns::Int8
    spacing::Vector{float_ft}

    function ColumnInfo(column::T, n_columns, spacing) where T
        n_columns = n_columns |> to_int

        # check n_columns is a correct number
        if n_columns <=0
            error("number of columns must be greater than or equal to 1. Got $(n_columns)")
        # check if number of columns match spacing
        elseif length(spacing) != n_columns
            error(string("spacing entries must equal n_columns.",
                "Got length(spacing) = $(length(spacing)) ",
                "vs n_columns = $(n_columns)"))
        end
        spacing = typeof(spacing) <: AbstractArray ? spacing .|> to_ft : [spacing] .|> to_ft
        new{T}(
            column,
            n_columns,
            spacing
        )
    end
end

function Base.show(io::IO, x::ColumnInfo) 
    column_info = typeof(x)
    column = typeof(x.column)
    n_columns = x.n_columns
    spacing = "["*join(x.spacing,",")*"]"
    s = """
    $(column_info)
      column: $(column)
      n_columns: $(n_columns)
      spacing: $(spacing)
    """
    print(io, s)
end