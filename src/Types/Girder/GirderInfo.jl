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

# Constructors
```
GirderInfo(girder, n_girders, spacing, brg, pdstl) -> GirderInfo
GirderInfo(; girder, n_girders, spacing, brg, pdstl) -> GirderInfo
GirderInfo(girder::Girder, n_girders, spacing) -> GirderInfo
```

# Examples
```julia-repl
julia> GirderInfo(
	Girder("Tx54"),
	5,
	[3, 8, 8, 8, 8],
	BearingPad(3),
	Pedestal(3)
    )
GirderInfo
  girder: Tx54
  n_columns: 5
  spacing: [3.0 ft,8.0 ft,8.0 ft,8.0 ft,8.0 ft]
  brg: 3.0 ft wide x 2.75 inch tall
  pdstl: 3.0 ft wide x 1.5 inch tall

julia> GirderInfo(
    Girder("Tx54"),
	5,
	[3, 8, 8, 8, 8],
    )
GirderInfo
  girder: Tx54
  n_columns: 5
  spacing: [3.0 ft,8.0 ft,8.0 ft,8.0 ft,8.0 ft]
  brg: 3.0 ft wide x 2.75 inch tall
  pdstl: 3.333 ft wide x 1.5 inch tall
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

function GirderInfo(girder::Girder, n_girders, spacing)
     # find girder info for specified type
     g = import_data(string(girder.type), :type, "GirderInfo.csv")

     # construct bearing
    brg = BearingPad(
        width = g.brg_width*ft
    )

    # construct pedestal
    pdstl = Pedestal(
        width = g.brg_width*ft + 4inch
    )

    # return GirderInfo
    return GirderInfo(
        girder = girder,
        n_girders = n_girders,
        spacing = spacing,
        brg = brg,
        pdstl = pdstl,
    )

end

function Base.show(io::IO, x::GirderInfo) 
    type_info = typeof(x)
    girder_type = x.girder.type
    n_girders = x.n_girders
    brg_width = round(ft, x.brg.width; digits=3)
    brg_height = round(inch, x.brg.height; digits=3)
    pdstl_width = round(ft, x.pdstl.width; digits=3)
    pdstl_height = round(inch, x.pdstl.height; digits=3)
    spacing = "["*join(x.spacing,",")*"]"
    s = """
    $(type_info)
      girder: $(girder_type)
      n_columns: $(n_girders)
      spacing: $(spacing)
      brg: $(brg_width) wide x $(brg_height) tall
      pdstl: $(pdstl_width) wide x $(pdstl_height) tall
    """
    print(io, s)
end

"""
    points(g::GirderInfo)

Determines the points of the girders to be plotted.
"""
function points(g::GirderInfo)

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

    # convert points to vector of vectors
    x_points = Vector{eltype(x_points)}[eachcol(x_points)...]
    y_points = Vector{eltype(y_points)}[eachcol(y_points)...]

    return x_points, y_points
end

@recipe function f(girder_info::GirderInfo;dims=true, dim_color=:black)
    
    legend := false
    aspect_ratio := :equal

    # points for girder
    girder_xs, girder_ys = points(girder_info)

    # points for dimensions
    dim_xs, dim_ys = h_dimensions(girder_xs, girder_ys)
    x_lbls, y_lbls, annos = h_dimensions_labels(dim_xs, dim_ys, font_color=dim_color)

    # plot girders
    @series begin
        linecolor --> :black
        fillcolor := :lightgrey
        seriestype  :=  :shape

        girder_xs, girder_ys
    end

    # plot dimensions
    if dims == true

        # plot dimensions
        @series begin
            seriestype  :=  :path
            linecolor := dim_color
            markercolor := dim_color
            yerror --> 0.25
            markersize := 0
            
            dim_xs, dim_ys
        end

        # plot annotations
        @series begin
            seriestype:= :scatter
            markersize := 0
            annotations --> annos
            x_lbls, y_lbls
        end
        # @series begin
        #     
        # end
    end
end