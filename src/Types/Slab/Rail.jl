# ----------------
# RAIL
# ----------------

@enumx RailType begin
    None
    SSCB
    T1F
    T1W
    T1P
    T2P
    T221
    T222
    T223
    T224
    T401
    T402
    T411
    T551
    T552
    T631
    T631LS
    T66
    T77
    SSTR
    T80HT
    T80SS
    C1W
    C2P
    C221
    C223
    C402
    C411
    C412
    C66
    PR1orPR11
    PR2
    PR22
    PR3
    T10
    T203
    T501
    T502
    T503
    T504
    T6
    HT
    C203
    C501
    C502
    B3
    SSR
end

"""
    rail_type(rail::String)

Given the name of the rail, will return RailType enum.
"""
function rail_type(rail::String)
    getproperty(RailType, Symbol(rail))
end
rail_type(rail::RailType.T) = rail

"""
    struct Rail
    
The Rail of a bridge.

# Fields
- `type::RailType.T` - type of the rail
- `height::float_inch` - height of the rail
- `width::float_ft` - width of the rail
- `weight::float_plf` - weight of the rail

# Constructors
```
Rail(type::RailType.T) -> Rail
Rail(type::String) -> Rail
```

# Examples
```julia-repl
julia> Rail("SSTR)
Rail
  type: SSTR
  height: 36.0 inch
  width: 1.0 ft
  weight: 376.0 plf

julia> Rail(RailType.SSTR)
Rail
  type: SSTR
  height: 36.0 inch
  width: 1.0 ft
  weight: 376.0 plf
```
"""
@with_kw_noshow struct Rail
    type::RailType.T
    height::float_inch
    width::float_ft
    weight::float_plf

    function Rail(type, height, width, weight)
        new(
            type |> rail_type,
            height |> to_inch,
            width |> to_ft,
            weight |> to_plf
        )
    end
end

function Rail(type)
    # initialize dataframe
    csv_file_name = "Rails.csv"
    lookup_col_name = :type
    lookup_value = string(type)
    rail = import_data(lookup_value, lookup_col_name, csv_file_name)

    # return a rail object
    Rail(
        type, 
        rail.height_in*inch, 
        rail.width_ft*ft, 
        rail.weight_plf*plf
        )
end

Base.show(io::IO, x::Rail) = custom_show(io, x)