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
    bar_type(bar::String)

If bar is of type *String*, the function will output the corresponding bar designation in enum format.
"""
function bar_type(bar::String)
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
        _ => error("Bar type: $bar not found")
    end
end

"""
```
struct Bar
```

# Fields
- `size`::BarSize.T
- `area`::float_inch2
- `weight`::float_plf
- `diameter`::float_inch
- `ld`::float_inch - development length of the rebar
"""
@with_kw struct Bar
    size::BarSize.T
    area::float_inch2
    weight::float_plf
    diameter::float_inch
    ld::float_inch

    function Bar(size, area, weight, diameter, ld)
        new(
            size,
            area        |> to_inch2,
            weight      |> to_plf,
            diameter    |> to_inch,
            ld          |> to_inch
        )
    end
end


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

"""


"""
@with_kw struct BarsAInfo
    bar::Bar
    dist_btwn_rows::float_inch
    n_row1::Int8
    n_row2::Int8
    n_row3::Int8

    function BarsAInfo(bar, dist_btwn_rows, n_row1, n_row2, n_row3)
        new(
            bar,
            dist_btwn_rows |> to_inch,
            n_row1,
            n_row2,
            n_row3,
        )
    end
end

@with_kw struct BarsBInfo
    bar::Bar
    dist_btwn_rows::float_inch
    n_row1::Int8
    n_row2::Int8
    n_row3::Int8

    function BarsBInfo(bar, dist_btwn_rows, n_row1, n_row2, n_row3)
        new(
            bar,
            dist_btwn_rows |> to_inch,
            n_row1,
            n_row2,
            n_row3,
        )
    end
end

@with_kw struct BarsSInfo
    bar::Bar
    n_bundle::Int8
end

@with_kw struct BarsTInfo
    bar::Bar
    n_bars_face::Int8
end