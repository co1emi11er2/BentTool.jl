import BentTool: Rail

rail_expected = Rail(
    type="SSTR",
    width=1ft,
    height=36inch,
    weight=376plf
)

rail = Rail("SSTR")

@test rail_expected === rail
