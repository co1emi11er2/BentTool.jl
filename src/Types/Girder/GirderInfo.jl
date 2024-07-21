# ----------------
# GIRDER INFO
# ----------------
"""
    struct GirderInfo

# Fields
- `girder::Girder` - `Girder` struct
- `n_girders::Int8` - max haunch of girder
- `spacing::Vector{float_ft}` - spacing of girders (first entry is spacing from left slab edge)
- `brg::BearingPad` - `BearingPad` struct
- `pdstl::Pedestal` - Pedestal` struct
  
```
"""
@with_kw_noshow struct GirderInfo
    girder::Girder
    n_girders::Int8
    spacing::Vector{float_ft}
    brg::BearingPad
    pdstl::Pedestal

    function GirderInfo(girder, n_girders, spacing, brg, pdstl)
        n_girders = n_girders |> to_int

        check_spa(n_girders, spacing)

        spacing = spacing .|> to_ft
        new(
            girder,
            n_girders,
            spacing,
            brg,
            pdstl
        )
    
    end
end

Base.show(io::IO, x::GirderInfo) = custom_show(io, x)


"""
    init_girder_info(;type, n_girders, osoh_left, spacing, haunch_height)

Given the girder type, number of girders, osoh_left, spacing of girders, and haunch height, a GirderInfo object is constructed.

"""
function init_girder_info(;type::GirderType.T, n_girders, osoh_left, spacing, haunch_height)
    
    girder = Girder(type; haunch_height = haunch_height)

    # pull girder points from csv based on type
    df = CSV.read(datadir("GirderGeometries.csv"), DataFrame)
    df_xs = df[!, "$(type)_x"]
    df_ys = df[!, "$(type)_y"]

    # calculate girder points of each girder
    x_offset = middle(df_xs)*ft # girder x points start at 0, must be centered
    cuml_spacing = cumsum([osoh_left - x_offset, spacing...])
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

function girder_points(g::GirderInfo)

    # girder info
    type = g.girder.type
    spacing = g.spacing
    n_girders = g.n_girders

    # pull girder points from csv based on type
    df = CSV.read(datadir("GirderGeometries.csv"), DataFrame)
    df_xs = df[!, "$(type)_x"]
    df_ys = df[!, "$(type)_y"]

    # calculate girder points of each girder
    x_offset = middle(df_xs)*ft # girder x points start at 0, must be centered
    y_offset = g.girder.haunch_height

    cuml_spacing = cumsum([spacing[1] - x_offset, spacing[2:end]...])
    x_points = (df_xs*ft) .+ cuml_spacing'
    y_points = (df_ys*ft) .+ sequence(1, n_girders, 0ft, 0ft) .- y_offset
    return x_points, y_points
end