"""
    struct BarSInfo

Bar S information for a BentCap.

# Fields
- `bar::Bar` - ASTM standard reinforcing bar.
- `n_bundle::Int8` - number in bundle (1, 2, or 3)
"""
Base.@kwdef struct BarSInfo
    bar::Bar
    n_bundle::Int8=1

    @doc """
        BarSInfo(bar, n_bundle=1) -> BarSInfo
        BarSInfo(; bar, n_bundle=1) -> BarSInfo

    Constructs a `BarSInfo` struct.

    # Arguments or Keywords
    - `bar::Bar` - ASTM standard reinforcing bar.
    - `n_bundle::Int8` - number in bundle (1, 2, or 3)

    # Examples
    ```julia-repl
    julia> BarSInfo(Bar("#5"));

    julia> BarSInfo(bar=Bar("#5"), n_bundle = 2);
    ```
    """
    function BarSInfo(bar, n_bundle=1)
        n_bundle = to_int(n_bundle)
        if n_bundle in (1, 2, 3)
            new(bar, n_bundle)
        else
            error("n_bundle must be 1, 2, or 3, got $n_bundle")
        end
    end
end

Base.show(io::IO, x::BarSInfo) = custom_show(x)