"""
    struct BarBInfo

Bar B information for a BentCap.

# Fields
- `bar::Bar` - ASTM standard reinforcing bar.
- `dist_btwn_rows::float_inch`
- `n_row1::Int8` - number of bars in top row
- `n_row2::Int8 = 0` - number of bars in 2nd row (if any)
- `n_row3::Int8 = 0` - number of bars in 3rd row (if any)

# Constructors
```
BarBInfo(bar, dist_btwn_rows, n_row1, n_row2=0, n_row3=0) -> BarBInfo
BarBInfo(; bar, dist_btwn_rows, n_row1, n_row2=0, n_row3=0) -> BarBInfo
```

# Examples
```julia-repl
julia> BarBInfo(Bar("#11"), 4, 11);

julia> BarBInfo(bar = Bar(BarSize.n11), dist_btwn_rows = 4, n_row1 = 11, n_row2 = 11);
```
"""
@with_kw_noshow struct BarBInfo
    bar::Bar
    dist_btwn_rows::float_inch
    n_row1::Int8
    n_row2::Int8 = 0
    n_row3::Int8 = 0

    function BarBInfo(bar, dist_btwn_rows, n_row1, n_row2=0, n_row3=0)
        new(
            bar,
            dist_btwn_rows  |> to_inch,
            n_row1          |> to_int,
            n_row2          |> to_int,
            n_row3          |> to_int,
        )
    end
end

Base.show(io::IO, x::BarBInfo) = custom_show(io, x)