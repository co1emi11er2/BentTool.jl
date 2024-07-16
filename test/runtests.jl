using BentTool, StructuralUnits
using Test

if isdefined(@__MODULE__,:LanguageServer)
    include("../src/BentTool.jl")
end

# Test Utilities
println("Test Utilities")
@testset "Utils:        " begin include("Utils.jl") end
@testset "Dimensions:   " begin include("Dimensions.jl") end
@testset "Conversions:  " begin include("Conversions.jl") end


# Include Slab Structs
println("")
println("Test Slab Structs")
@testset "Slab:     " begin include("Types/Slab/Slab.jl") end
@testset "Rail:     " begin include("Types/Slab/Rail.jl") end
@testset "RailInfo: " begin include("Types/Slab/RailInfo.jl") end
@testset "PGL:      " begin include("Types/Slab/PGL.jl") end
@testset "Sidewalk: " begin include("Types/Slab/Sidewalk.jl") end

# Include Girder Structs
println("")
println("Test Girder Structs")
@testset "Girder:       " begin include("Types/Girder/Girder.jl") end
@testset "BearingPad:   " begin include("Types/Girder/BearingPad.jl") end
@testset "Pedestal:     " begin include("Types/Girder/Pedestal.jl") end
@testset "GirderInfo:   " begin include("Types/Girder/GirderInfo.jl") end

# Include Bar Structs
println("")
println("Test Bar Structs")
@testset "Bar:          " begin include("Types/Bar/Bar.jl") end
@testset "BarAInfo:     " begin include("Types/Bar/BarAInfo.jl") end
@testset "BarBInfo:     " begin include("Types/Bar/BarBInfo.jl") end
@testset "BarSInfo:     " begin include("Types/Bar/BarSInfo.jl") end
@testset "BarTInfo:     " begin include("Types/Bar/BarTInfo.jl") end

# Include Column Structs
println("")
println("Test Column Structs")
@testset "Column:               " begin include("Types/Column/Column.jl") end
@testset "RectangularColumn:    " begin include("Types/Column/RectangularColumn.jl") end
@testset "CircularColumn:       " begin include("Types/Column/CircularColumn.jl") end
@testset "ColumnInfo:           " begin include("Types/Column/ColumnInfo.jl") end

# Include BentCap Structs
println("")
println("Test BentCap Structs")
@testset "BentCap:              " begin include("Types/Bent Cap/BentCap.jl") end
@testset "RectangularBentCap:   " begin include("Types/Bent Cap/RectangularBentCap.jl") end
@testset "InvTBentCap:          " begin include("Types/Bent Cap/InvTBentCap.jl") end

# Include Span Structs
println("")
println("Test Span Structs")
@testset "Span:         " begin include("Types/Span/Span.jl") end
@testset "SimpleSpan:   " begin include("Types/Span/SimpleSpan.jl") end

# Include BridgeUnit Structs
println("")
println("Test BridgeUnit Structs")
@testset "BridgeUnit:   " begin include("Types/Bridge Unit/BridgeUnit.jl") end
@testset "SimpleUnit:   " begin include("Types/Bridge Unit/SimpleUnit.jl") end