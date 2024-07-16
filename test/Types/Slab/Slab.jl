import BentTool: Rail

rail_expected = Rail(
    type=RailType.SSTR,
    width=1ft,
    height=36inch,
    weight=376plf
)

rail = Rail(RailType.SSTR)

@test rail_expected === rail
