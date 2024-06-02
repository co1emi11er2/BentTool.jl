
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

@with_kw struct BearingPad
    width::float_ft
    height::float_inch
    distance::float_inch
end

@with_kw struct Pedestal
    width::float_inch
    height::float_inch
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