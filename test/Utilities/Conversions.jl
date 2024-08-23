using StructuralUnits
import BentTool: to_float, to_int, to_ft, to_inch, to_inch2, to_pcf,
to_kcf, to_plf, to_klf, to_ksi, to_mph, to_deg

# float conversion
let 
    @test 5.0 == to_float(5)
    @test 5.0 == to_float("5")
end

# int conversion
let 
    @test 5 == to_int(5.0)
    @test 5 == to_int("5.0")
end

# ft conversion
let 
    @test 5.0ft == to_ft(5)
    @test 5.0ft == to_ft("5")
    @test 1.0ft == to_ft(12inch)
end

# inch conversion
let 
    @test 5.0inch == to_inch(5)
    @test 5.0inch == to_inch("5")
    @test 12.0inch == to_inch(1ft)
end

# inch^2 conversion
let 
    @test 5.0inch^2 == to_inch2(5)
    @test 5.0inch^2 == to_inch2("5")
    @test 144.0inch^2 == to_inch2(1ft^2)
end

# pcf conversion
let 
    @test 5.0pcf == to_pcf(5)
    @test 5.0pcf == to_pcf("5")
    @test 1000.0pcf == to_pcf(1kcf)
end

# kcf conversion
let 
    @test 5.0kcf == to_kcf(5)
    @test 5.0kcf == to_kcf("5")
    @test 1.0kcf == to_kcf(1000pcf)
end

# plf conversion
let 
    @test 5.0plf == to_plf(5)
    @test 5.0plf == to_plf("5")
    @test 1000.0plf == to_plf(1klf)
end

# plf conversion
let 
    @test 5.0klf == to_klf(5)
    @test 5.0klf == to_klf("5")
    @test 1.0klf == to_klf(1000plf)
end

# ksi conversion
let 
    @test 5.0ksi == to_ksi(5)
    @test 5.0ksi == to_ksi("5")
    @test 1.0ksi == to_ksi(1ksi)
end

# mph conversion
let 
    @test 5.0mph == to_mph(5)
    @test 5.0mph == to_mph("5")
    @test 1.0mph == to_mph(1mph)
end

# mph conversion
let 
    @test 5.0° == to_deg(5)
    @test 5.0° == to_deg("5")
    @test 1.0° == to_deg(1°)
end