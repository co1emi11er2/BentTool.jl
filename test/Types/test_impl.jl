# slab = Slab(
#     width=40ft,
#     thickness=8.5inch,
#     fws_thickness=0inch,
#     fws_density=0.15kcf,
#     cross_slope=0.02,
# )

# girder = Girder(
#     type="Tx54",
#     haunch_height=2inch,
#     depth=54inch,
#     bott_flange_width=32inch,
# )

# brg = BearingPad(
#     width=3ft,
#     height=2.75inch,
#     distance=12inch,
# )

# pdst = Pedestal(
#     width=3ft,
#     height=1.5inch,
# )

# pgl = PGL(
#     radius=0ft,
#     offset=-23ft,
# )

# rail = Rail("SSTR")

# rail_info = RailInfo(
#     dist_outside_to_all=true,
#     rail_left=rail,
#     rail_right=rail,
#     rail_third=rail,
#     dist_bk_start=2,
#     dist_bk_end=4,
#     dist_fd_start=2,
#     dist_fd_end=5,
# )

# sw = Sidewalk(
#     width=0ft,
#     thickness=0.5ft,
#     density=0.15kcf,
#     dist_bk_start=1,
#     dist_bk_end=4,
#     dist_fd_start=1,
#     dist_fd_end=4,
# )

# bent = RectangularBentCap(
#     density=0.15kcf,
#     fc=3.6ksi,
#     fy=60ksi,
#     exposure="Class 2",
#     skew=0°,
#     length=48ft,
#     bk_bm1_to_cap_end=2ft,
#     fd_bm1_to_cap_end=2ft,
#     depth=60inch,
#     width=54inch,
#     offset_to_leveling_pad=0inch,
# )

# fd_span = SimpleSpan(
#     slab=slab,
#     girders=girder,
#     brg=brg,
#     pdstl=pdst,
#     osho_left=3ft,
#     osho_right=3ft,
#     length=100ft
# )

# bk_span = SimpleSpan(
#     slab=slab,
#     girders=girder,
#     brg=brg,
#     pdstl=pdst,
#     osho_left=3ft,
#     osho_right=3ft,
#     length=120ft
# )

# unit = SimpleUnit{RectangularBentCap}(
#     bk=bk_span,
#     fd=fd_span,
#     bent=bent,
#     pgl=pgl,
#     rail=rail_info,
#     sw=sw,
#     has_super=true,
#     dsgn_speed=40mph
# )

