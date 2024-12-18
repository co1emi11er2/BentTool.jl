# using BentTool, StructuralUnits
# using Test
using TestItems, TestItemRunner

if isdefined(@__MODULE__,:LanguageServer)
    include("../src/BentTool.jl")
end

# # Test Utilities
@testitem "Utils:        " begin include("Utilities/Utils.jl") end
@testitem "Dimensions:   " begin include("Utilities/Dimensions.jl") end
@testitem "Conversions:  " begin include("Utilities/Conversions.jl") end


# # Include Slab Structs
@testitem "Slab:     " begin include("Types/Slab/Slab.jl") end
@testitem "Rail:     " begin include("Types/Slab/Rail.jl") end
@testitem "RailInfo: " begin include("Types/Slab/RailInfo.jl") end
@testitem "PGL:      " begin include("Types/Slab/PGL.jl") end
@testitem "Sidewalk: " begin include("Types/Slab/Sidewalk.jl") end

# # Include Girder Structs
# println("")
# println("Test Girder Structs")
@testitem "Girder:       " begin include("Types/Girder/Girder.jl") end
@testitem "BearingPad:   " begin include("Types/Girder/BearingPad.jl") end
@testitem "Pedestal:     " begin include("Types/Girder/Pedestal.jl") end
@testitem "GirderInfo:   " begin include("Types/Girder/GirderInfo.jl") end

# # Include Bar Structs
# println("")
# println("Test Bar Structs")
@testitem "Bar:          " begin include("Types/Bar/Bar.jl") end
@testitem "BarAInfo:     " begin include("Types/Bar/BarAInfo.jl") end
@testitem "BarBInfo:     " begin include("Types/Bar/BarBInfo.jl") end
@testitem "BarSInfo:     " begin include("Types/Bar/BarSInfo.jl") end
@testitem "BarTInfo:     " begin include("Types/Bar/BarTInfo.jl") end

# # Include Column Structs
# println("")
# println("Test Column Structs")
@testitem "Column:               " begin include("Types/Column/Column.jl") end
@testitem "RectangularColumn:    " begin include("Types/Column/RectangularColumn.jl") end
@testitem "CircularColumn:       " begin include("Types/Column/CircularColumn.jl") end
@testitem "ColumnInfo:           " begin include("Types/Column/ColumnInfo.jl") end

# # Include BentCap Structs
# println("")
# println("Test BentCap Structs")
@testitem "BentCap:              " begin include("Types/Bent Cap/BentCap.jl") end
@testitem "RectangularBentCap:   " begin include("Types/Bent Cap/RectangularBentCap.jl") end
@testitem "InvTBentCap:          " begin include("Types/Bent Cap/InvTBentCap.jl") end

# # Include Span Structs
# println("")
# println("Test Span Structs")
@testitem "Span:         " begin include("Types/Span/Span.jl") end
@testitem "SimpleSpan:   " begin include("Types/Span/SimpleSpan.jl") end

# # Include BridgeUnit Structs
# println("")
# println("Test BridgeUnit Structs")
@testitem "BridgeUnit:   " begin include("Types/Bridge Unit/BridgeUnit.jl") end
@testitem "SimpleUnit:   " begin include("Types/Bridge Unit/SimpleUnit.jl") end

@run_package_tests verbose=true