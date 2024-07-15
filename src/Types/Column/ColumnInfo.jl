Base.@kwdef struct ColumnInfo{T<:Column}
    column::T
    n_columns::Int8
    spacing::Vector{float_ft}

    function ColumnInfo(column::T, n_columns, spacing) where T
        spacing = spacing .|> to_ft
        new{T}(
            column,
            n_columns |> to_int,
            spacing
        )
    end
end

Base.show(io::IO, x::ColumnInfo) = custom_show(x)