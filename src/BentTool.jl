module BentTool

# Package Imports
using CSV
using DataFrames, DataFramesMeta
using Match
using EnumX
using Parameters
import Statistics: middle
using StructuralUnits
using Plots

# Package Exports
export GirderType, Girder, BearingPad, Pedestal, GirderInfo, init_girder_info
export Slab, PGL, RailType, Rail, RailInfo, Sidewalk
export SimpleSpan, init_simple_span, SimpleUnit, plot

# Directories
projectdir(parts...) = normpath(joinpath(@__DIR__, "..", parts...))
datadir(parts...) = normpath(joinpath(@__DIR__, "..", "data", parts...))


# Constant Units
const float_ft = typeof(1.0ft)
const float_inch = typeof(1.0inch)
const float_klf = typeof(1.0klf)
const float_plf = typeof(1.0plf)
const float_mph = typeof(1.0mph)
const float_kcf = typeof(1.0kcf)
const float_pcf = typeof(1.0pcf)
const float_ksi = typeof(1.0ksi)
const float_deg = typeof(1.0°)
const float_inch2 = typeof(1.0inch^2)

# Include Utility Files
include("Utils.jl")
include("Dimensions.jl")
include("Conversions.jl")

# Include Slab Structs
include("Types/Slab/Slab.jl")
include("Types/Slab/Rail.jl")
include("Types/Slab/RailInfo.jl")
include("Types/Slab/PGL.jl")
include("Types/Slab/Sidewalk.jl")


# Include Girder Structs
include("Types/Girder/Girder.jl")
include("Types/Girder/BearingPad.jl")
include("Types/Girder/Pedestal.jl")
include("Types/Girder/GirderInfo.jl")

# Include Bar Structs
include("Types/Bar/Bar.jl")
include("Types/Bar/BarAInfo.jl")
include("Types/Bar/BarBInfo.jl")
include("Types/Bar/BarSInfo.jl")
include("Types/Bar/BarTInfo.jl")

# Include Column Structs
include("Types/Column/Column.jl")
include("Types/Column/RectangularColumn.jl")
include("Types/Column/CircularColumn.jl")
include("Types/Column/ColumnInfo.jl")

# Include BentCap Structs
include("Types/Bent Cap/BentCap.jl")
include("Types/Bent Cap/RectangularBentCap.jl")
include("Types/Bent Cap/InvTBentCap.jl")

# Include Span Structs
include("Types/Span/Span.jl")
include("Types/Span/SimpleSpan.jl")

# Include BridgeUnit Structs
include("Types/Bridge Unit/BridgeUnit.jl")
include("Types/Bridge Unit/SimpleUnit.jl")

end
