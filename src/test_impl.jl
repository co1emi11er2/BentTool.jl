slab = Slab(
    40ft,
    8.5inch,
    0inch,
    0.15kcf,
    0.02,
)

girder = Girder(
    "Tx54",
    2inch,
    54inch,
    32inch,
)

brg = BearingPad(
    3ft,
    2.75inch,
    12inch,
)

pdst = Pedestal(
    3ft,
    1.5inch,
)

pgl = PGL(
    0ft,
    -23ft,
)

rail = Rail(
    "SSTR",
    36inch,
    1ft,
    376plf,
)

rail_info = RailInfo(
    true,
    rail,
    rail,
    rail,
    2,
    4,
    2,
    5,
)

sw = Sidewalk(
    0ft,
    0.5ft,
    0.15kcf,
    1,
    4,
    1,
    4,
)

bent = RectangularBentCap(
    0.15kcf,
    3.6ksi,
    60ksi,
    "Class 2",
    0°,
    48ft,
    2ft,
    2ft,
    60inch,
    54inch,
    0inch,
)

fd_span = SimpleSpan(
    slab,
    girder,
    brg,
    pdst,
    3ft,
    3ft,
    100ft
)

bk_span = SimpleSpan(
    slab,
    girder,
    brg,
    pdst,
    3ft,
    3ft,
    120ft
)

unit = SimpleUnit(
    bk_span,
    fd_span,
    bent,
    pgl,
    rail_info,
    sw,
    true,
    40mph
)