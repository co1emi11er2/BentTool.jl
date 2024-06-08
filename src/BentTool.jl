module BentTool

# Package Imports
using CSV
using DataFrames, DataFramesMeta
using Match
using EnumX
using Parameters
using StructuralUnits

# Directories
# const rail_csv_dir = joinpath(@__DIR__, "..", "data")
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

# export @chain
# Import Types
include("Utils.jl")
include("Types/Slab.jl")
include("Types/Bent Cap/Bar.jl")
include("Types/Bent Cap/Column.jl")
include("Types/Bent Cap/BentCap.jl")
include("Types/Girder.jl")
include("Types/Span.jl")

end
