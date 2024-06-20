
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
    Type54
end


"""
    string(girder::GirderType.T)

If girder is of type *GirderType.T*, the function will output the corresponding girder designation in string format.
"""
function Base.string(girder::GirderType.T)
    @match girder begin
        $(GirderType.Tx28) => "Tx28"
        $(GirderType.Tx34) => "Tx34"
        $(GirderType.Tx40) => "Tx40"
        $(GirderType.Tx46) => "Tx46"
        $(GirderType.Tx54) => "Tx54"
        $(GirderType.Tx62) => "Tx62"
        $(GirderType.Tx70) => "Tx70"
        $(GirderType.U40) => "U40"
        $(GirderType.U54) => "U54"
        $(GirderType.IV) => "IV"
        $(GirderType.A) => "A"
        $(GirderType.B) => "B"
        $(GirderType.C) => "C"
        $(GirderType.Type54) => "Type54"
        _ => error("Girder type: $girder not found")
    end
end


"""
    girder_type(girder::String)

If girder is of type *Sting*, the function will output the corresponding girder designation in enum format.
"""
function girder_type(girder::String)
    @match girder begin
        "Tx28" => GirderType.Tx28
        "Tx34" => GirderType.Tx34
        "Tx40" => GirderType.Tx40
        "Tx46" => GirderType.Tx46
        "Tx54" => GirderType.Tx54
        "Tx62" => GirderType.Tx62
        "Tx70" => GirderType.Tx70
        "U40" => GirderType.U40
        "U54" => GirderType.U54
        "IV" => GirderType.IV
        "A" => GirderType.A
        "B" => GirderType.B
        "C" => GirderType.C
        "Type54" => GirderType.Type54
        _ => error("Girder type: $girder not found")
    end
end


@with_kw struct Girder
    type::GirderType.T
    haunch_height::float_inch
    depth::float_inch
    bott_flange_width::float_inch
    weight::float_plf
end

function Girder(type::GirderType.T; haunch_height = 3.0inch)
    csv_file_name = "GirderInfo.csv"
    lookup_col_name = :type
    lookup_value = string(type)
    girder = import_data(lookup_value, lookup_col_name, csv_file_name)

    return Girder(
        type = type,
        haunch_height = haunch_height,
        depth = girder.depth_in * inch,
        bott_flange_width = girder.bott_flange_width * inch,
        weight = girder.weight_plf * plf
    )
end

# ----------------
# BEARING PAD
# ----------------

@with_kw struct BearingPad
    width::float_ft
    height::float_inch = 2.75inch
    distance::float_inch = 12inch
end

# ----------------
# PEDESTAL
# ----------------

@with_kw struct Pedestal
    width::float_inch
    height::float_inch = 1.5inch
end

# ----------------
# GIRDER INFO
# ----------------

@with_kw struct GirderInfo
    girder::Girder
    n_girders::Int8
    spacing::Vector{float_ft}
    x_points::Matrix{float_ft}
    y_points::Matrix{float_ft}
    brg::BearingPad
    pdstl::Pedestal
end


"""
    init_girder_info(;type, n_girders, osho_left, spacing, haunch_height)

Given the girder type, number of girders, osho_left, spacing of girders, and haunch height, a GirderInfo object is constructed.

"""
function init_girder_info(;type::GirderType.T, n_girders, osho_left, spacing, haunch_height)
    
    girder = Girder(type; haunch_height = haunch_height)

    # pull girder points from csv based on type
    df = CSV.read(datadir("GirderGeometries.csv"), DataFrame)
    df_xs = df[!, "$(type)_x"]
    df_ys = df[!, "$(type)_y"]

    # calculate girder points of each girder
    x_offset = middle(df_xs)*ft # girder x points start at 0, must be centered
    cuml_spacing = cumsum([osho_left - x_offset, spacing...])
    x_points = (df_xs*ft) .+ cuml_spacing'
    y_points = (df_ys*ft) .+ sequence(1, n_girders, 0ft, 0ft)

    # initialize other girder info
    df = CSV.read(datadir("GirderInfo.csv"), DataFrame)

    # find girder info for specified type
    g = import_data(string(type), :type, "GirderInfo.csv")

    # construct bearing
    brg = BearingPad(
        width = g.brg_width*inch
    )

    # construct pedestal
    pdstl = Pedestal(
        width = g.bott_flange_width*inch + 4inch
    )

    # return GirderInfo
    return GirderInfo(
        girder = girder,
        n_girders = n_girders,
        spacing = spacing,
        x_points = x_points,
        y_points = y_points,
        brg = brg,
        pdstl = pdstl
    )
end