############################
# On-board BTNR Push-button#
############################
set_property PACKAGE_PIN R18 [get_ports BTNR_tri_io]
set_property IOSTANDARD LVCMOS25 [get_ports BTNR_tri_io]

########################################################
# On-board LED LD9 constraint not required as it is    #
# connected to the dedicated pin on PS                 #
########################################################
