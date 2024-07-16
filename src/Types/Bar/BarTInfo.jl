# @with_kw_noshow struct BarTInfo
#     bar::Bar
#     n_bars_face::Int8
# end

"""
    struct BarTInfo

Bar T information for a BentCap.

# Fields
- `bar::Bar` - ASTM standard reinforcing bar.
- `n_bars_face::Int8` - number of bars per face of bent cap
"""
Base.@kwdef struct BarTInfo
    bar::Bar
    n_bars_face::Int8

    @doc """
        BarTInfo(bar, n_bars_face) -> BarTInfo
        BarTInfo(; bar, n_bars_face) -> BarTInfo

    Constructs a `BarTInfo` struct.

    # Arguments or Keywords
    - `bar::Bar` - ASTM standard reinforcing bar.
    - `n_bars_face::Int8` - number of bars per face of bent cap

    # Examples
    ```julia-repl
    julia> BarTInfo(Bar("#5"), 13);

    julia> BarTInfo(bar=Bar("#5"), n_bars_face = 6);
    ```
    """
    function BarTInfo(bar, n_bars_face=1)
        new(
            bar, 
            n_bars_face |> to_int
            )
    end
end

Base.show(io::IO, x::BarTInfo) = custom_show(x)