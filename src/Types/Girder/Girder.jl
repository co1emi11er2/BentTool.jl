
# ----------------
# GIRDER
# ----------------

"List of different types of girders that can be used in the BentTool package"
@enumx GirderType begin
    Tx28
    Tx34
    Tx40
    Tx46
    Tx54
    Tx62
    Tx70
    U40
    U54
    IV
    A
    B
    C
    # Type54
end


"""
    girder_type(girder::String)

If girder is of type *Sting*, the function will output the corresponding girder designation in enum format.
"""
function girder_type(girder::String)
    getproperty(GirderType, Symbol(girder))
end
girder_type(girder::GirderType.T) = girder

"""
    struct Girder

# Fields
`type::GirderType.T ` - specific girder type
`haunch_height::float_inch` - max haunch of girder
`depth::float_inch` - depth of girder
`bott_flange_width::float_inch` - bottom flange width of girder
`weight::float_plf` - whight of girder
"""
@with_kw_noshow struct Girder
    type::GirderType.T 
    haunch_height::float_inch
    depth::float_inch
    bott_flange_width::float_inch
    weight::float_plf

    function Girder(type, haunch_height, depth, bott_flange_width, weight)
        new(
            type,
            haunch_height       |> to_inch,
            depth               |> to_inch,
            bott_flange_width   |> to_inch,
            weight              |> to_plf
        )
    end
end

function Girder(type::GirderType.T; haunch_height = 3.0inch)
    csv_file_name = "GirderInfo.csv"
    lookup_col_name = :type
    lookup_value = string(type)
    girder = import_data(lookup_value, lookup_col_name, csv_file_name)

    return Girder(
        type = type,
        haunch_height = haunch_height,
        depth = girder.depth_in,
        bott_flange_width = girder.bott_flange_width,
        weight = girder.weight_plf
    )
end
function Girder(type::String; haunch_height = 3.0inch)
    Girder(girder_type(type); haunch_height = haunch_height)
end

Base.show(io::IO, x::Girder) = custom_show(io, x)