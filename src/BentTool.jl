module BentTool

# Write your package code here.

using EnumX
using Parameters
using StructuralUnits

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

# Import Types
include("Types/Slab.jl")
include("Types/BentCap.jl")
include("Types/Girder.jl")
include("Types/Span.jl")


include("test_impl.jl")

end
