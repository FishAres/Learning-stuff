using MAT

data_handle = matread("C:\\Users\\ares\\Desktop\\HTM_3_4_meta.mat")

proj_meta = data_handle["proj_meta"]
# This returns the 1x9 rd Array containing all the yuminess. Each one is split into 4xtp
rd = proj_meta["rd"]
