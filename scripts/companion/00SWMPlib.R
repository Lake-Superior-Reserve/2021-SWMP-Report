install.packages("pacman")
library("pacman")

# packages commonly needed for SWMP data
# checks to see if a package is installed, if not it attempts to install the package and then loads it
pacman::p_load(SWMPr, SWMPrExtension, lubridate, tidyverse, scales, extrafont, cowplot)
