
"List of different types of girders that can be used in the BentTool package"
@enumx GirderTypes begin
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




@with_kw struct Girder
    type::String
    haunch_height::float_inch
    depth::float_inch
    bott_flange_width::float_inch
end

function Girder(type; haunch_height = 3inch)
    df = CSV.read(datadir("GirderInfo.csv", DataFrame))

    girder = @chain df begin
        @filter(type==!!type)
        first
    end

    return Girder(
        type = girder.type,
        haunch_height = haunch_height,
        depth = girder.depth_in,
        bott_flange_width = girder.bott_flange_width
    )
end

@with_kw struct BearingPad
    width::float_ft
    height::float_inch = 2.75inch
    distance::float_inch = 12inch
end

@with_kw struct Pedestal
    width::float_inch
    height::float_inch = 1.5inch
end

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
    GirderInfo(;type, n_girders, width, spacing)

Given the girder type, number of girders, width of slab, and spacing of girders, a GirderInfo object is constructed.

"""
function init_girder_info(;type::String, n_girders, osho_left, spacing, haunch_height)
    

    # calculate girder points
    df = CSV.read(datadir("GirderGeometries.csv"), DataFrame)

    x_points = (df[!, "$(type)_x"]*ft) .+ sequence(1, n_girders, osho_left, spacing)
    y_points = (df[!, "$(type)_y"]*ft) .+ sequence(1, n_girders, 0ft, 0ft)

    # initialize other girder info
    df = CSV.read(datadir("GirderInfo.csv"), DataFrame)

    # find girder info for specified type
    g = @chain df begin
        @filter(type==!!type)
        first
    end

    # construct girder
    @show girder = Girder(
        type = g.type,
        haunch_height = haunch_height,
        depth = g.depth_in*inch,
        bott_flange_width = g.bott_flange_width*inch
    )

    # construct bearing
    @show brg = BearingPad(
        width = g.brg_width*inch
    )

    # construct pedestal
    @show pdstl = Pedestal(
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