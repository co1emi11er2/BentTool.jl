using PyCall

xw = pyimport("xlwings")

wb = xw.Book("I_LRFD_Cap_Dsnr_V8.0.xlsm")

# General Bridge Geometry and Superstructure
complex_geom = wb.sheets("Complex Geometry").range("ComplexGeom").value
project_subject = wb.sheets("Geometry").range("ProjectSubject").value
deck_width = wb.sheets("Geometry").range("DeckWidth").value
cross_slope = wb.sheets("Geometry").range("crossslope").value
slab_thickness = wb.sheets("Geometry").range("slabthickness").value
fws_thickness = wb.sheets("Geometry").range("FWSthickness").value
fws_wt = wb.sheets("Geometry").range("FWSwt").value
utilities = wb.sheets("Geometry").range("utilities").value

# Back Span
bk_span_girder = wb.sheets("Geometry").range("bkspangirder").value
bk_span_haunch = wb.sheets("Geometry").range("bkspanhaunch").value
bk_brgpad = wb.sheets("Geometry").range("bkbrgpad").value
pedestal_ht = wb.sheets("Geometry").range("PedestalHt").value

# Forward Span
fd_span_girder = wb.sheets("Geometry").range("fdspangirder").value
fd_span_haunch = wb.sheets("Geometry").range("fdspanhaunch").value
fd_brg_pad = wb.sheets("Geometry").range("fdbrgpad").value

# Span Geometry
pgl_radius = wb.sheets("Geometry").range("PGLradius").value
pgl_dist = wb.sheets("Geometry").range("PGLdist").value
osho_bk_left = wb.sheets("Geometry").range("OSOHBack").value
osho_bk_right = wb.sheets("Geometry").range("OSOHBackRT").value
osho_left = wb.sheets("Geometry").range("OSOH").value
osho_right = wb.sheets("Geometry").range("OSOHRT").value
super  = wb.sheets("Geometry").range("super?").value
dsgn_speed = wb.sheets("Geometry").range("dsgnspeed").value
bk_span_pgl = wb.sheets("Geometry").range("bkspanpgl").value
fd_span_pgl = wb.sheets("Geometry").range("fdspanpgl").value

# Rails
rail_distribution = wb.sheets("Geometry").range("RailDistribution").value
rail_left = wb.sheets("Geometry").range("railLeft").value
rail_right = wb.sheets("Geometry").range("railRight").value
rail_3rd = wb.sheets("Geometry").range("rail3rd").value
rail_distribute_bk_start = wb.sheets("Geometry").range("RailDistributeBackStart").value
rail_distribute_bk_end = wb.sheets("Geometry").range("RailDistributeBackEnd").value
rail_distribute_fd_start = wb.sheets("Geometry").range("RailDistributeFwdStart").value
rail_distribute_fd_end = wb.sheets("Geometry").range("RailDistributeFwdEnd").value

# Sidewalks
swalk_width = wb.sheets("Geometry").range("sdwkwidth").value
swalk_thickness = wb.sheets("Geometry").range("sdwkthickness").value
swalk_density = wb.sheets("Geometry").range("sdwkdensity").value
swalk_distribute_bk_start = wb.sheets("Geometry").range("SWalkDistributeBackStart").value
swalk_distribute_bk_end = wb.sheets("Geometry").range("SWalkDistributeBackEnd").value
swalk_distribute_fd_start = wb.sheets("Geometry").range("SWalkDistributeFwdStart").value
swalk_distribute_fd_end = wb.sheets("Geometry").range("SWalkDistributeFwdEnd").value

# Bent Cap Section Properties
cap_type = wb.sheets("Geometry").range("CapType").value
swalk_distribute_fwd_end = wb.sheets("Geometry").range("SWalkDistributeFwdEnd").value
cap_density = wb.sheets("Geometry").range("capdensity").value
fc = wb.sheets("Geometry").range("fc").value
fy = wb.sheets("Geometry").range("fy").value
exposure = wb.sheets("Geometry").range("exposure").value
bent_skew = wb.sheets("Geometry").range("BentSkew").value
cap_length = wb.sheets("Geometry").range("caplength").value
bk_bm1_to_cap_end = wb.sheets("Geometry").range("BkBm1toCapEnd").value
bm1_to_cap_end  = wb.sheets("Geometry").range("Bm1toCapEnd").value
bk_bent_skew = wb.sheets("Geometry").range("BackBentSkew").value
fd_bent_skew = wb.sheets("Geometry").range("FwdBentSkew").value
offset_to_leveling_pad = wb.sheets("Geometry").range("offsettolevelingpad").value
cap_ledge_depth = wb.sheets("Geometry").range("CapLedgeDepth").value
inv_tee_bot_width = wb.sheets("Geometry").range("InvTeeBotWidth").value
bearing_dist = wb.sheets("Geometry").range("BearingDist").value
cap_height = wb.sheets("Geometry").range("capheight").value
cap_stem_width = wb.sheets("Geometry").range("capstemWidth").value
earwall_left = wb.sheets("Geometry").range("Earwall_Left").value
earwall_right = wb.sheets("Geometry").range("Earwall_Right").value
earwall_area = wb.sheets("Geometry").range("Earwall_Area").value

# Flexural Top Negative Reinforcement
bars_A = wb.sheets("Geometry").range("BarsA").value
bars_A_dist = wb.sheets("Geometry").range("BarsAdist").value
A_row1 = wb.sheets("Geometry").range("Arow1").value
A_row2 = wb.sheets("Geometry").range("Arow2").value
A_row3 = wb.sheets("Geometry").range("Arow3").value

# Flexural Bottom Positive Reinforcement
bars_B = wb.sheets("Geometry").range("BarsB").value
bars_B_dist = wb.sheets("Geometry").range("BarsBdist").value
B_row1 = wb.sheets("Geometry").range("Brow1").value
B_row2 = wb.sheets("Geometry").range("Brow2").value
B_row3 = wb.sheets("Geometry").range("Brow3").value

# Shear Reinforcement
increase_clear_cover = wb.sheets("Geometry").range("IncreaseClearCover").value
bar_S_arrange = wb.sheets("Geometry").range("BarSArrange").value
bar_S = wb.sheets("Geometry").range("BarS").value

# Skin and Temperature Reinforcement
bars_H = wb.sheets("Geometry").range("BarsH").value
n_H_bars = wb.sheets("Geometry").range("NoHbars").value

# Column Section Properties and Spacing
aesthetic_col = wb.sheets("Geometry").range("AestheticCol").value
col_type = wb.sheets("Geometry").range("ColType").value
n_supports = wb.sheets("Geometry").range("NoSupports").value
col_trans_width = wb.sheets("Geometry").range("coltranswidth").value
col_long_width = wb.sheets("Geometry").range("collongwidth").value
capital_width = wb.sheets("Geometry").range("CapitalWidth").value
capital_weight = wb.sheets("Geometry").range("CapitalWeight").value
function read_col_spa(wb)
    col_spa = [
        wb.sheets("Geometry").range("ColSpa1").value;
        wb.sheets("Geometry").range("ColSpa3").value;
        wb.sheets("Geometry").range("ColSpa4").value;
        wb.sheets("Geometry").range("ColSpa5").value;
        wb.sheets("Geometry").range("ColSpa6").value;
        wb.sheets("Geometry").range("ColSpa2").value;
        wb.sheets("Geometry").range("ColSpa7").value;
        wb.sheets("Geometry").range("ColSpa8").value;
        wb.sheets("Geometry").range("ColSpa9").value;
        wb.sheets("Geometry").range("ColSpa10").value;
    ]
end
col_spa = read_col_spa(wb)

col_heights = [
    wb.sheets("Geometry").range("ColHeightI").value;
    wb.sheets("Geometry").range("ColHeightII").value;
]

# Back Span - Girder Spacing
n_bk_bms = wb.sheets("Geometry").range("BkBms").value
bk_bm_spa = [
    wb.sheets("Geometry").range("BBSPA1").value;
    wb.sheets("Geometry").range("BBSPA2").value;
    wb.sheets("Geometry").range("BBSPA3").value;
    wb.sheets("Geometry").range("BBSPA4").value;
    wb.sheets("Geometry").range("BBSPA5").value;
    wb.sheets("Geometry").range("BBSPA6").value;
    wb.sheets("Geometry").range("BBSPA7").value;
    wb.sheets("Geometry").range("BBSPA8").value;
    wb.sheets("Geometry").range("BBSPA9").value;
    wb.sheets("Geometry").range("BBSPA10").value;
    wb.sheets("Geometry").range("BBSPA11").value;
    wb.sheets("Geometry").range("BBSPA12").value;
    wb.sheets("Geometry").range("BBSPA13").value;
    wb.sheets("Geometry").range("BBSPA14").value;
    wb.sheets("Geometry").range("BBSPA15").value;
    wb.sheets("Geometry").range("BBSPA16").value;
    wb.sheets("Geometry").range("BBSPA17").value;
    wb.sheets("Geometry").range("BBSPA18").value;
    wb.sheets("Geometry").range("BBSPA19").value;
    wb.sheets("Geometry").range("BBSPA20").value;
]
bk_bm_spa = bk_bm_spa[1:convert(Int, n_bk_bms)]

# Forward Span - Girder Spacing
n_fd_bms = wb.sheets("Geometry").range("FdBms").value
fd_bm_spa = [
    wb.sheets("Geometry").range("FBSPA1").value;
    wb.sheets("Geometry").range("FBSPA2").value;
    wb.sheets("Geometry").range("FBSPA3").value;
    wb.sheets("Geometry").range("FBSPA4").value;
    wb.sheets("Geometry").range("FBSPA5").value;
    wb.sheets("Geometry").range("FBSPA6").value;
    wb.sheets("Geometry").range("FBSPA7").value;
    wb.sheets("Geometry").range("FBSPA8").value;
    wb.sheets("Geometry").range("FBSPA9").value;
    wb.sheets("Geometry").range("FBSPA10").value;
    wb.sheets("Geometry").range("FBSPA11").value;
    wb.sheets("Geometry").range("FBSPA12").value;
    wb.sheets("Geometry").range("FBSPA13").value;
    wb.sheets("Geometry").range("FBSPA14").value;
    wb.sheets("Geometry").range("FBSPA15").value;
    wb.sheets("Geometry").range("FBSPA16").value;
    wb.sheets("Geometry").range("FBSPA17").value;
    wb.sheets("Geometry").range("FBSPA18").value;
    wb.sheets("Geometry").range("FBSPA19").value;
    wb.sheets("Geometry").range("FBSPA20").value;
]

# Complex Geometry
cmplx_bk_width = wb.sheets("Complex Geometry").range("Cmplx_Bk_Width").value
cmplx_fd_width = wb.sheets("Complex Geometry").range("Cmplx_Fd_Width").value
segment_length = wb.sheets("Complex Geometry").range("segmentlength").value
breakbacks = wb.sheets("Complex Geometry").range("Breakbacks").value
complex_skew = wb.sheets("Complex Geometry").range("ComplexSkew").value
complex_dist_to_sta = wb.sheets("Complex Geometry").range("ComplexDistToSta").value

# Complex Geometry Back Span - Beam Distance
cmplx_bk_pgl_bm_spa = [
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm1").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm2").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm3").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm4").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm5").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm6").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm7").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm8").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm9").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm10").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm11").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm12").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm13").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm14").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm15").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm16").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm17").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm18").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm19").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_PGLBm20").value;
]

# Complex Geometry Back Span - C-C Distance
cmplx_bk_cc_bm_spa = [
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm1").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm2").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm3").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm4").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm5").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm6").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm7").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm8").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm9").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm10").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm11").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm12").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm13").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm14").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm15").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm16").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm17").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm18").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm19").value;
    wb.sheets("Complex Geometry").range("Cmplx_Bk_CCBm20").value;
    
]

# Complex Geometry Forward Span - Beam Distance
cmplx_fd_pgl_bm_spa = [
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm1").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm2").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm3").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm4").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm5").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm6").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm7").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm8").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm9").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm10").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm11").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm12").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm13").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm14").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm15").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm16").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm17").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm18").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm19").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_PGLBm20").value;
]

# Complex Geometry Forward Span - C-C Distance
cmplx_fd_cc_bm_spa = [
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm1").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm2").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm3").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm4").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm5").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm6").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm7").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm8").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm9").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm10").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm11").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm12").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm13").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm14").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm15").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm16").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm17").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm18").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm19").value;
    wb.sheets("Complex Geometry").range("Cmplx_Fd_CCBm20").value;
]

# Additional Concrete DL
is_pedestal_continuous = wb.sheets("Conc DL").range("IsPedestalContinuous").value
misc_cap_wWt = wb.sheets("Conc DL").range("MiscCapWt").value
addl_DC_P = wb.sheets("Dead Load Moment").range("addl_DC_P").value
addl_DC_M = wb.sheets("Dead Load Moment").range("addl_DC_M").value
addl_DC_Mx = wb.sheets("Dead Load Moment").range("addl_DC_Mx").value

# Cap18 Inputs
input_increment = wb.sheets("CAP18 Input").range("InputIncrement").value
cap18_neg_mom_location = wb.sheets("CAP18 Out(1)").range("CAP18NegMomLocation").value

# Inverted Tee - Single Column
ex_gir_considered_sc = wb.sheets("Inv Tee-SC").range("ExGirConsideredSC").value
int_bm_LL_DF = wb.sheets("Inv Tee-SC").range("INTBMLLDF").value

# Inverted Tee
ex_gir_considered = wb.sheets("Inv Tee").range("ExGirConsidered").value
int_bm_LL_DF_MC = wb.sheets("Inv Tee").range("INTBMLLDFMC").value

# Additional Live Load on Column
addl_LL_P = wb.sheets("Live Load on Column").range("addl_LL_P").value
addl_LL_My = wb.sheets("Live Load on Column").range("addl_Ll_My").value
addl_LL_Mx = wb.sheets("Live Load on Column").range("addl_LL_Mx").value

# CE and BR - Loads to Consider
BR_neglect = wb.sheets("CE & BR").range("BR_Neglect").value

# Wind loads 
design_wind_speed = wb.sheets("Wind Loads").range("DesignWindSpeed").value
elevation_adjust = wb.sheets("Wind Loads").range("ElevationAdjust").value
roughness_category = wb.sheets("Wind Loads").range("RoughnessCategory").value

using CSV, DataFrames

path = pwd()
girder_data_path = path * "/data/GirderGeometries.csv"
df = CSV.read(girder_data_path, DataFrame)

df.Tx54_x .+ [10.0 20.0]

cum_bk_beams = cumsum(bk_bm_spa)
x = df.Tx54_x .+ cum_bk_beams'
y = df.Tx54_y .+ ones(convert(Int, n_bk_bms))'

using Plots

plot(x, y; aspectratio=:equal, lc=:gray, legend=:none)