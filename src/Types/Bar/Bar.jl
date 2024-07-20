"List of different types of bars that can be used in the BentTool package"
@enumx BarSize begin
    n3 = 3
    n4 = 4
    n5 = 5
    n6 = 6
    n7 = 7
    n8 = 8
    n9 = 9
    n10 = 10
    n11 = 11
    # n14 = 14 # not in csv
end

"""
    string(bar::BarSize.T)

If bar is of type *BarSize.T*, the function will output the corresponding bar designation in string format.
"""
function Base.string(bar::BarSize.T)
    @match bar begin
        $(BarSize.n3) => "#3"
        $(BarSize.n4) => "#4"
        $(BarSize.n5) => "#5"
        $(BarSize.n6) => "#6"
        $(BarSize.n7) => "#7"
        $(BarSize.n8) => "#8"
        $(BarSize.n9) => "#9"
        $(BarSize.n10) => "#10"
        $(BarSize.n11) => "#11"
        # $(BarSize.n14) => "#14"
        _ => error("Bar type: $bar not found")
    end
end

"""
    bar_type(bar::String) -> BarSize.T

If bar is of type *String*, the function will output the corresponding bar designation in enum format.
"""
function bar_size(bar::String)
    @match bar begin
        "#3" => BarSize.n3
        "#4" => BarSize.n4
        "#5" => BarSize.n5
        "#6" => BarSize.n6
        "#7" => BarSize.n7
        "#8" => BarSize.n8
        "#9" => BarSize.n9
        "#10" => BarSize.n10
        "#11" => BarSize.n11
        # "#14" => BarSize.n14
        _ => error("Bar size: $bar not found")
    end
end
bar_size(bar::BarSize.T) = bar

"""
    struct Bar

An ASTM standard reinforcing bar.

# Fields
- `size::BarSize.T`
- `area::float_inch2`
- `weight::float_plf`
- `diameter::float_inch`
- `ld::float_inch` - development length of the rebar
"""
@with_kw_noshow struct Bar
    size::BarSize.T
    area::float_inch2
    weight::float_plf
    diameter::float_inch
    ld::float_inch

    function Bar(size, area, weight, diameter, ld)
        new(
            size        |> bar_size,
            area        |> to_inch2,
            weight      |> to_plf,
            diameter    |> to_inch,
            ld          |> to_inch
        )
    end
end

"""
    Bar(size::BarSize.T) -> Bar
    Bar(size::String) -> Bar

Given bar size, a `Bar` struct is initialized.

# Arguments
- `size::BarSize.T` or `size::String` - size of rebar.

# Examples
```julia-repl
julia> Bar("#11")
Bar
  size: n11
  area: 1.563 inch^2
  weight: 5.313 plf
  diameter: 1.41 inch
  ld: 48.16 inch

julia> Bar(BarSize.n11)
Bar
  size: n11
  area: 1.563 inch^2
  weight: 5.313 plf
  diameter: 1.41 inch
  ld: 48.16 inch
```
"""
function Bar(size::BarSize.T)
    csv_file_name = "Bars.csv"
    lookup_col_name = :bar
    lookup_value = string(size)
    bar = import_data(lookup_value, lookup_col_name, csv_file_name)

    Bar(
        size = size,
        area = bar.area,
        weight = bar.weight,
        diameter = bar.diameter,
        ld = bar.ld
    )
end
Bar(size::String) = Bar(bar_size(size))

Base.show(io::IO, x::Bar) = custom_show(io, x)