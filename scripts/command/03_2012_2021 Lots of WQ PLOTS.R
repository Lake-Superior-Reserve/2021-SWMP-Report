#2013-2021 WQ data for Lake Superior NERR

### Intro to SWMPr  

# SWMPr is an R package developed by Marcus Beck
# specifically to make certain tasks involving SWMP data easier
# this is where you can find lots of info:
# https://github.com/fawda123/SWMPr#overview

# Additionally, links to past workshops are on swmprats.net
# Materials for the 2015 workshop are here: 
# http://swmprats.net/workshop-2015

# Materials for the 2016 workshop are here, 
# as are recordings of the training sessions:
# http://swmprats.net/2016-workshop


#Update R as needed


source("scripts/01_LOAD_packages.R")

font_import(paths = "C:/Windows/Fonts")

## read in data ----
# Script 02_LKS_WQ_2021 Data Prep should be run FIRST. 
#That script creates 4 dataframes, one for each site, that will be that starting point here

#take a look at the Barker's Island One to make sure you have it saved. 
summary(bawq_allparam)


## SWMPr has some additional non-plotting functions that you should check out:

#   na.approx()   to linearly interpolate missing values (NAs)
#   comb()        for combining different types of data (wq + met + nut)
#   ecometab()    given WQ and MET data, calculates ecosystem metabolism
#                 based on the open-water method
#   decomp() and decompcj()    decompose a time series into trend, seasonal,
#                 and residual components
#   cens_id()     for nutrients - create a column to identify readings that
#                 are below detection or at the detection limit
#   overplot()    a way to plot with multiple axes (use with caution)



## We'll focus on some plotting functions to explore the data
## they're really quite easy; just pick a parameter to look at

###########################################

# SWMPr plots

###########################################

# summary plots ----
# like the SWMPrats widget!
#Temp for all sites
plot_summary(bawq_allparam, param = "temp", years = c(2013, 2021))
plot_summary(blwq_allparam, param = "temp", years = c(2013, 2021))
plot_summary(olwq_allparam, param = "temp", years = c(2013, 2021))
plot_summary(powq_allparam, param = "temp", years = c(2014, 2021))

#conductivity for all sites
plot_summary(bawq_allparam, param = "spcond", years = c(2013, 2021))
plot_summary(blwq_allparam, param = "spcond", years = c(2013, 2021))
plot_summary(olwq_allparam, param = "spcond", years = c(2013, 2021))
plot_summary(powq_allparam, param = "spcond", years = c(2014, 2021))

#Do for all sites

plot_summary(bawq_allparam, param = "do_pct", years = c(2013, 2021))
plot_summary(blwq_allparam, param = "do_pct", years = c(2013, 2021))
plot_summary(olwq_allparam, param = "do_pct", years = c(2013, 2021))
plot_summary(powq_allparam, param = "do_pct", years = c(2014, 2021))

#ph for all sites

plot_summary(bawq_allparam, param = "ph", years = c(2013, 2021))
plot_summary(blwq_allparam, param = "ph", years = c(2013, 2021))
plot_summary(olwq_allparam, param = "ph", years = c(2013, 2021))
plot_summary(powq_allparam, param = "ph", years = c(2014, 2021))

#turbidity for all sites

plot_summary(bawq_allparam, param = "turb", years = c(2013, 2021))
plot_summary(blwq_allparam, param = "turb", years = c(2013, 2021))
plot_summary(olwq_allparam, param = "turb", years = c(2013, 2021))
plot_summary(powq_allparam, param = "turb", years = c(2014, 2021))


###########################################

# SWMPrExtension plots

# just going to set up a couple fixes to the ggplot code that makes them wonky
legend_fixed <- theme(legend.spacing.x = unit(6, 'pt'))
legend_hist_fixed <- theme(legend.spacing.x = unit(2, 'pt'))

###########################################

## historical range plots ----

# using defaults:
historical_range(bawq_allparam, param = "temp", free_y = TRUE)

# another option is to include a horizontal line for some threshold:
historical_range(bawq_allparam, param = "do_mgl",
                 target_yr = 2021,
                 criteria = 3) + 
      legend_fixed

# daily range averaged with target year.
#BA
historical_daily_range(bawq_allparam, param = "temp",
                       target_yr = 2021, plot_title = TRUE)
historical_daily_range(bawq_allparam, param = "spcond",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(bawq_allparam, param = "ph",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(bawq_allparam, param = "do_pct",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(bawq_allparam, param = "turb",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
#BL
historical_daily_range(blwq_allparam, param = "temp",
                       target_yr = 2021, plot_title = TRUE)
historical_daily_range(blwq_allparam, param = "spcond",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(blwq_allparam, param = "ph",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(blwq_allparam, param = "do_pct",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(blwq_allparam, param = "turb",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
#OL

historical_daily_range(olwq_allparam, param = "temp",
                       target_yr = 2021, plot_title = TRUE)
historical_daily_range(olwq_allparam, param = "spcond",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(olwq_allparam, param = "ph",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(olwq_allparam, param = "do_pct",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(olwq_allparam, param = "turb",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)

#PO

historical_daily_range(powq_allparam, param = "temp",
                       target_yr = 2021, plot_title = TRUE)
historical_daily_range(powq_allparam, param = "spcond",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(powq_allparam, param = "ph",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(powq_allparam, param = "do_pct",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)
historical_daily_range(powq_allparam, param = "turb",
                       target_yr = 2021, plot_title = TRUE, free_y = TRUE)

## boxplots ----

raw_boxplot(bawq_allparam, "temp", target_yr = 2021) 

# seasonal boxplot is a little different

seasonal_boxplot(bawq_allparam, "temp",
                 target_yr = 2021)

##### Some things to notice about the SWMPrExtension plots

## if you like something from the status report output,
## you can make it using a function with the same name as the folder
## that the plot was in

## they are based on ggplot2, so
## to fiddle with formatting, we can use ggplot2 commands

### ggplot2 and SWMPr/SWMPrExtension ----

# Recall that ggplot2 builds graphs using layers
# and we can add to already-made SWMPrExtension plots

# let's give the seasonal boxplot a different title, and an x-axis label

poTemp<-seasonal_boxplot(powq_allparam, "temp", 
                 hist_rng = c(2014, 2021),
                 target_yr = 2021,
                 plot_title = TRUE)  + labs(title = "Dissolved Oxygen at Pokegama Bay")


# highlight the seasonal_boxplot call,
# then go up to the add-ins menu and select ggThemeAssist
# we can fix some of these irritating formatting issues
# we can click around to choose and change things,
# and when we select "done", code is added below: here is an example of changing grid lines

poTemp + theme(panel.grid.major = element_line(linetype = "blank"), 
               panel.grid.minor = element_line(linetype = "blank"))

# Remember we can save with ggsave()
ggsave(filename = "poTemp.png", plot = poTemp)


# we may want that to go into our output folder, and we can specify that in 
# the filename. let's also change the size and resolution.
#ggsave(filename = "output/atemp_plot2.png", plot = atemp_plot,
       #width = 5, height = 4, units = "in", dpi = 400)


# now make one of water temp, either from our bayou heron data frame
# or with your own water quality data
baTemp_plot<- seasonal_boxplot(bawq_allparam, "temp", 
                               hist_rng = c(2013,2021),
                               target_yr = 2021,
                               plot_title = TRUE)  + 
  legend_fixed +
  theme(plot.subtitle = element_text(hjust = 0.5), 
        legend.position = "bottom") +
  labs(title = "Barker's Island Water Temperature", 
       x = "Month", subtitle = "2021, compared to 2013 through 2021") 


# look at it
baTemp_plot

## Let's work on better graphs
## Barkers Island 2021 Temperature

## remember our working dataset is bawq_allparam. we are recreating a better verison of the historical daily range swmpr plot
## This code comes from SWMPrExtension code for historical_daily_range with modifications along the way
## First Let's cut off any 2012 data because it is incomplete for the year
## First add a Year column in the dataset


dat<-bawq_allparam %>% separate(datetimestamp, sep = " ", into = c("date", "time"))
datetimestamp<-bawq_allparam$datetimestamp
dat<- cbind(dat, datetimestamp)
## Cut out 2012 data because it is incomplete
dat<-dat %>% dplyr::filter(.data$year >=2013)
dat<-dplyr::select(dat, c("datetimestamp","year", "month", "temp", "spcond", "do_mgl", "ph", "turb"))

##create temp in F instead of C
temp_F<-(dat$temp*(9/5))+32
dat<-cbind(dat, temp_F)
head(dat)

# Assign date for determining daily stat value
dat$date <- lubridate::floor_date(dat$datetimestamp, unit = 'days')

# Filter for temp and remove NA values
dat <- dat %>% dplyr::select(.data$datetimestamp, date, temp_F)
dat <- dat %>% dplyr::filter(!is.na(temp_F))

# Determine min/max/mean for each day so averages or finds min and max over the day for each year seperately. 

dat_all<- dat %>%
  dplyr::group_by(date) %>%
  dplyr::summarise(mean = mean(temp_F, na.rm = TRUE)
                   , min = min(temp_F, na.rm = TRUE)
                   , max = max(temp_F, na.rm = TRUE)
                   , .groups = "drop_last")

# add julian day onto the dataset
dat_all$julian_day <- lubridate::yday(dat_all$date)

# create a seperate data frame for just the target year (2021)
# this is daily mean, min max for 2021 "Daily Average"
dat_yr<- dat_all %>% dplyr::filter(lubridate::year(date) == 2021)

# Determine average min/max/mean for each julian day (for all years together includes 2021) "Average Daily Range"
dat_hist_avg<- dat_all %>%
  dplyr::group_by(julian_day) %>%
  dplyr::summarise(mean = mean(mean, na.rm = TRUE)
                   , min = mean(min, na.rm = TRUE)
                   , max = mean(max, na.rm = TRUE)
                   , .groups = "drop_last")

# Determine average min/max/mean for each julian day (for all years together includes 2021) "Daily Range"

dat_hist_obs<- dat_all %>%
  dplyr::group_by(julian_day) %>%
  dplyr::summarise(mean = mean(mean, na.rm = TRUE)
                   , min = min(min, na.rm = TRUE)
                   , max = max(max, na.rm = TRUE)
                   , .groups = "drop_last")


# set up some plotting stuff
# LKS does not have any data outside of April - Dec so we need to assign months to the julian days. 
# This is a modification from original Historical_daily_range function where we skip the julian day fill in. 


brks <- c(91, 121, 152, 182, 213, 244, 274, 305, 335) #jdays associated with the first of every month excluding Jan-March
brk_labs <- c("Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
lab_hist_obs_rng<- "2013 - 2021 Daily Range"
lab_yr_ln<- "2021 Daily Range"

#skipped make some labels because those will be made outside fo R plot development

plt<-ggplot() +
  theme_bw() +
  geom_ribbon(data = dat_hist_obs, aes(x = julian_day, ymin = min, ymax = max, fill = lab_hist_obs_rng), show.legend = FALSE) +
  geom_ribbon(data = dat_yr, aes(x = julian_day, ymin = min, ymax = max, fill = lab_yr_ln), show.legend = FALSE) +
  scale_fill_manual('', values = c('grey65', '#424765')) +
  scale_x_continuous(breaks = brks, labels = brk_labs) +
  scale_y_continuous(limits = c(30,90), breaks = c(30,40,50,60,70,80,90))
plt
plt <-
  plt +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.background = element_blank(),
        axis.title = element_blank(),
        panel.border = element_rect(color = 'grey50')) +
  theme(axis.text.x  = element_text(family = "Lucida Sans", margin = unit(c(0, 0, 5, 0), 'pt'), color = 'grey40')) +
  theme(axis.text.y  = element_text(family = "Lucida Sans", margin = unit(c(0, 0, 0, 40), 'pt'), color = 'grey40')) +
  theme(text = element_text(family = "Lucida Sans", size = 4)) +
  theme(axis.ticks = element_line(color = "grey50", size = 0.2))
plt

ggsave("BarkersIslandTemp.TIFF", units = "px", width=1500, height=900 ,dpi = 600, path = "outputs")
plot(plt)

##Now do the same plot but for Pokegama Conductivity.

dat<-powq_allparam %>% separate(datetimestamp, sep = " ", into = c("date", "time"))
datetimestamp<-powq_allparam$datetimestamp
dat<- cbind(dat, datetimestamp)
## Cut out 2012 and 2013 data because it is incomplete
dat<-dat %>% dplyr::filter(.data$year >=2014 & .data$month <=10)
dat<-dplyr::select(dat, c("datetimestamp","year", "month", "temp", "spcond", "do_mgl", "ph", "turb"))


# Assign date for determining daily stat value
dat$date <- lubridate::floor_date(dat$datetimestamp, unit = 'days')

# Filter for temp and remove NA values
dat <- dat %>% dplyr::select(.data$datetimestamp, date, spcond)
dat <- dat %>% dplyr::filter(!is.na(spcond))

# Determine min/max/mean for each day so averages or finds min and max over the day for each year seperately. 

dat_all<- dat %>%
  dplyr::group_by(date) %>%
  dplyr::summarise(mean = mean(spcond, na.rm = TRUE)
                   , min = min(spcond, na.rm = TRUE)
                   , max = max(spcond, na.rm = TRUE)
                   , .groups = "drop_last")

# add julian day onto the dataset
dat_all$julian_day <- lubridate::yday(dat_all$date)

# create a seperate data frame for just the target year (2021)
# this is daily mean, min max for 2021 "Daily Average"
dat_yr<- dat_all %>% dplyr::filter(lubridate::year(date) == 2021)

# Determine average min/max/mean for each julian day (for all years together includes 2021) "Average Daily Range"
dat_hist_avg<- dat_all %>%
  dplyr::group_by(julian_day) %>%
  dplyr::summarise(mean = mean(mean, na.rm = TRUE)
                   , min = mean(min, na.rm = TRUE)
                   , max = mean(max, na.rm = TRUE)
                   , .groups = "drop_last")

# Determine average min/max/mean for each julian day (for all years together includes 2021) "Daily Range"

dat_hist_obs<- dat_all %>%
  dplyr::group_by(julian_day) %>%
  dplyr::summarise(mean = mean(mean, na.rm = TRUE)
                   , min = min(min, na.rm = TRUE)
                   , max = max(max, na.rm = TRUE)
                   , .groups = "drop_last")


# set up some plotting stuff
# LKS does not have any data outside of April - Dec so we need to assign months to the julian days. 
# This is a modification from original Historical_daily_range function where we skip the julian day fill in. 


brks <- c(121, 152, 182, 213, 244, 274, 305) #jdays associated with the first of every month excluding Jan-April and Dec
brk_labs <- c("May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov")
lab_hist_obs_rng<- "2014 - 2021 Daily Range"
lab_yr_ln<- "2021 Daily Range"

#skipped make some labels because those will be made outside fo R plot development

pltCond<-ggplot() +
  theme_bw() +
  geom_ribbon(data = dat_hist_obs, aes(x = julian_day, ymin = min, ymax = max, fill = lab_hist_obs_rng), show.legend = FALSE) +
  geom_ribbon(data = dat_yr, aes(x = julian_day, ymin = min, ymax = max, fill = lab_yr_ln), show.legend = FALSE) +
  scale_fill_manual('', values = c('grey65', '#424765')) +
  scale_x_continuous(breaks = brks, labels = brk_labs) +
  scale_y_continuous(limits = c(0,0.5))
pltCond
pltCond <-
  pltCond +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.background = element_blank(),
        axis.title = element_blank(),
        panel.border = element_rect(color = 'grey50')) +
  theme(axis.text.x  = element_text(family = "Lucida Sans", margin = unit(c(0, 0, 5, 0), 'pt'), color = 'grey40')) +
  theme(axis.text.y  = element_text(family = "Lucida Sans", margin = unit(c(0, 0, 0, 40), 'pt'), color = 'grey40')) +
  theme(text = element_text(family = "Lucida Sans", size = 8)) +
  theme(axis.ticks = element_line(color = "grey50"))
pltCond


ggsave("PokegamaCond.tiff.TIFF", units = "px", width=1500, height=900 ,dpi = 300, path = "outputs")



#want to use the Anaomlies chart generated from plot summary
#need to understand how it is calculated anomolies and tweak some things on the chart 
#took code for plot_summary on github, modified slightly for color and labels to make plot_summary2

#convert Temp to F before making new Temp figure
bawq_allparam<- bawq_allparam %>%
  mutate(temp=(temp*(9/5)+32))

plot_summary2 <- function(swmpr_in, param, colsleft = c('lightblue', 'lightgreen'), colsmid = 'lightblue', 
                               colsright = c('#47aec9', '#dcad5f', '#8b5516'), base_size = 10,
                               years = NULL, plt_sep = FALSE, sum_out = FALSE, fill = c('none', 'monoclim', 'interp'), ...){
  
  fill <- match.arg(fill)
  
  stat <- attr(swmpr_in, 'station')
  parameters <- attr(swmpr_in, 'parameters')
  date_rng <- attr(swmpr_in, 'date_rng')
  
  mo_labs <- c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
  mo_levs <- c('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12')
  
  # sanity checks
  if(is.null(years)){
    years <- as.numeric(as.character(strftime(date_rng, '%Y')))
  } else {
    if(length(years) > 2) stop('One or two element year vector is required.')
    if(length(years) == 1) years <- c(years, years)
  }
  if(!param %in% parameters) stop('param must be included in the data')
  
  ##
  # preprocessing
  
  # fill na
  if(fill == 'monoclim'){
    
    names(swmpr_in)[names(swmpr_in) %in% param] <- 'toest'
    
    swmpr_in$year <- strftime(swmpr_in$datetimestamp, '%Y')
    swmpr_in$month <- strftime(swmpr_in$datetimestamp, '%m')
    swmpr_in$month <- factor(swmpr_in$month, labels = mo_levs, levels = mo_levs)
    
    swmpr_in <- tidyr::complete(swmpr_in, year, month, fill = list(toest = NA))
    swmpr_in <- dplyr::group_by(swmpr_in, month)
    swmpr_in <- dplyr::mutate(swmpr_in, 
                              toest = dplyr::case_when(
                                is.na(toest) ~ mean(toest, na.rm = T), 
                                T ~ toest
                              ))
    swmpr_in <- dplyr::ungroup(swmpr_in)
    
    swmpr_in$datetimestamp <- as.Date(ifelse(is.na(swmpr_in$datetimestamp), 
                                             paste(swmpr_in$year, swmpr_in$month, '01', sep = '-'), 
                                             as.character(as.Date(swmpr_in$datetimestamp))))
    swmpr_in <- as.data.frame(swmpr_in, stringsAsFactors = F)
    
    
    names(swmpr_in)[names(swmpr_in) %in% 'toest'] <- param
    
    swmpr_in <- swmpr(swmpr_in, stat)
    
  }
  
  if(fill == 'interp'){
    
    names(swmpr_in)[names(swmpr_in) %in% param] <- 'toest'
    
    swmpr_in$year <- strftime(swmpr_in$datetimestamp, '%Y')
    swmpr_in$month <- strftime(swmpr_in$datetimestamp, '%m')
    swmpr_in$month <- factor(swmpr_in$month, labels = mo_levs, levels = mo_levs)
    
    swmpr_in <- tidyr::complete(swmpr_in, year, month, fill = list(toest = NA))
    swmpr_in$datetimestamp <- as.Date(ifelse(is.na(swmpr_in$datetimestamp), 
                                             paste(swmpr_in$year, swmpr_in$month, '01', sep = '-'), 
                                             as.character(as.Date(swmpr_in$datetimestamp))))
    swmpr_in <- as.data.frame(swmpr_in, stringsAsFactors = F)
    
    names(swmpr_in)[names(swmpr_in) %in% 'toest'] <- param
    
    swmpr_in <- swmpr(swmpr_in, stat)
    
    swmpr_in <- na.approx.swmpr(swmpr_in, maxgap = 1e10)
    
  }
  
  ## aggregate by averages for quicker plots
  # nuts are monthly
  if(grepl('nut$', stat)){
    dat <- aggreswmp(swmpr_in, by = 'months', params = param)
  }
  
  # wq is monthly
  if(grepl('wq$', stat)){
    dat <- aggreswmp(swmpr_in, by = 'days', params = param)
  }
  
  # met is monthly, except cumprcp which is daily max
  if(grepl('met$', stat)){
    dat <- aggreswmp(swmpr_in, by = 'days', params = param)
    
    # summarize cumprcp as max if present
    if('cumprcp' %in% attr(swmpr_in, 'parameters')){
      cumprcp <- aggreswmp(swmpr_in, by = 'days', FUN = function(x) max(x, na.rm = TRUE), 
                           params = 'cumprcp')
      dat$cumprcp <- cumprcp$cumprcp
    }
    
  }
  
  dat$year <- strftime(dat$datetimestamp, '%Y')
  dat$month <- strftime(dat$datetimestamp, '%m')
  dat$month <- factor(dat$month, labels = mo_levs, levels = mo_levs)
  
  # select years to plot
  dat_plo <- data.frame(dat[dat$year %in% seq(years[1], years[2]), ])
  
  # remove datetimestamp
  dat_plo <- dat_plo[, !names(dat_plo) %in% 'datetimestamp']
  
  # label lookups
  lab_look <- list(
    temp = 'Temperature (C)', 
    spcond = 'Specific conductivity (mS/cm)',
    sal = 'Salinity (psu)',
    do_pct = 'Dissolved oxyxgen (%)',
    do_mgl = 'Dissolved oxygen (mg/L)',
    depth = 'Depth (m)',
    cdepth = 'Depth (nonvented, m)',
    level = 'Referenced depth (m)',
    clevel = 'Referenced depth (nonvented, m)',
    ph = 'pH',
    turb = 'Turbidity (NTU)',
    chlfluor = 'Chl fluorescence (ug/L)',
    atemp = 'Air temperature (C)',
    rh = 'Relative humidity (%)',
    bp = 'Barometric pressure (mb)',
    wspd = 'Wind speed (m/s)',
    maxwspd = 'Max wind speed (m/s)',
    wdir = 'Wind direction (degrees)',
    sdwdir = 'Wind direction (sd, degrees)',
    totpar = 'Total PAR (mmol/m2)',
    totprcp = 'Total precipitation (mm)',
    cumprcp = 'Cumulative precipitation (mm)',
    totsorad = 'Total solar radiation (watts/m2)',
    po4f = 'Orthophosphate (mg/L)', 
    nh4f = 'Ammonium (mg/L)',
    no2f = 'Nitrite (mg/L)',
    no3f = 'Nitrate (mg/L)',
    no23f = 'Nitrite + Nitrate (mg/L)',
    chla_n = 'Chlorophyll (ug/L)'
  )
  ylab <- lab_look[[param]]
  
  # monthly, annual aggs
  agg_fun <- function(x) mean(x, na.rm = T)
  form_in <- formula(paste0(param, ' ~ month'))
  mo_agg <- aggregate(form_in, data = dat_plo[, !names(dat_plo) %in% c('year')], FUN = agg_fun)
  mo_agg_med <- aggregate(form_in, data = dat_plo[, !names(dat_plo) %in% c('year')], FUN = function(x) median(x, na.rm = T))
  
  ##
  # plots
  
  # universal plot setting
  my_theme <- theme()#axis.text = element_text(size = 8))
  
  # plot 1 - means and obs
  cols <- colorRampPalette(colsleft)(nrow(mo_agg))
  cols <- cols[rank(mo_agg[, param])]
  p1 <- suppressWarnings({ggplot(dat_plo, aes_string(x = 'month', y = param)) +
      geom_point(size = 2, alpha = 0.5, 
                 position=position_jitter(width=0.1)
      ) +
      theme_classic(base_size = base_size) +
      ylab(ylab) + 
      xlab('Monthly distributions and means') +
      geom_point(data = mo_agg, aes_string(x = 'month', y = param), 
                 colour = 'darkgreen', fill = cols, size = 7, pch = 21) + 
      my_theme
  })
  
  # box aggs, colored by median
  cols <- colorRampPalette(colsleft)(nrow(mo_agg_med))
  cols <- cols[rank(mo_agg_med[, param])]
  p2 <- suppressWarnings({ggplot(dat_plo, aes_string(x = 'month', y = param)) + 
      geom_boxplot(fill = cols) +
      theme_classic(base_size = base_size) +
      ylab(ylab) + 
      xlab('Monthly distributions and medians') +
      my_theme
  })
  
  # month histograms
  to_plo <- dat_plo
  to_plo$month <- factor(to_plo$month, levels = rev(mo_levs), labels = rev(mo_labs))
  p3 <- suppressWarnings({ggplot(to_plo, aes_string(x = param)) + 
      geom_histogram(aes_string(y = '..density..'), colour = colsmid, binwidth = diff(range(to_plo[, param], na.rm = T))/30) + 
      facet_grid(month ~ .) + 
      xlab(ylab) +
      theme_bw(base_family = 'Times', base_size = base_size) + 
      theme(axis.title.y = element_blank(), axis.text.y = element_blank(), 
            axis.ticks.y = element_blank(), 
            strip.text.y = element_text(size = 8, angle = 90),
            strip.background = element_rect(size = 0, fill = colsmid)) +
      my_theme
  })
  
  # monthly means by year
  to_plo <- dat_plo[, names(dat_plo) %in% c('month', 'year', param)]
  form_in <- as.formula(paste(param, '~ .'))
  to_plo <- aggregate(form_in, to_plo, function(x) mean(x, na.rm = T),
                      na.action = na.pass)
  
  to_plo$month <- factor(to_plo$month, labels = mo_labs, levels = mo_levs)
  names(to_plo)[names(to_plo) %in% param] <- 'V1'
  midpt <- mean(to_plo$V1, na.rm = T)
  p4 <- suppressWarnings({ggplot(subset(to_plo, !is.na(to_plo$V1)), 
                                 aes_string(x = 'year', y = 'month', fill = 'V1')) +
      geom_tile() +
      geom_tile(data = subset(to_plo, is.na(to_plo$V1)), 
                aes(x = year, y = month), fill = NA
      )  +
      scale_fill_gradient2(name = ylab,
                           low = colsright[1], mid = colsright[2], high = colsright[3], midpoint = midpt) +
      theme_classic(base_size = base_size) +
      ylab('Monthly means') +
      xlab('') +
      theme(legend.position = 'top', legend.title = element_blank()) +
      guides(fill = guide_colorbar(barheight = 0.5)) +
      my_theme
  })
  
  # monthly anomalies
  mo_agg$month <- factor(mo_agg$month, labels = mo_labs, levels = mo_levs)
  to_plo <- merge(to_plo, mo_agg, by = 'month', all.x = T)
  names(to_plo)[names(to_plo) %in% param] <- 'trend'
  to_plo$anom <- with(to_plo, V1 - trend)
  rngs <- max(abs(range(to_plo$anom, na.rm = T)))
  p5 <- suppressWarnings({ggplot(subset(to_plo, !is.na(to_plo$anom)), 
                                 aes_string(x = 'year', y = 'month', fill = 'anom')) +
      geom_tile() +
      geom_tile(data = subset(to_plo, is.na(to_plo$anom)), 
                aes(x = year, y = month), fill = NA
      ) +
      scale_fill_gradient2(name = ylab,
                           low = colsright[1], mid = colsright[2], high = colsright[3], midpoint = 0,
                           limits = c(-1 * rngs, rngs)) +
      theme_classic(base_size = base_size) +
      xlab('') +
      ylab('') +
      theme(legend.position = 'top', legend.title = element_blank(), legend.key.height = unit(1, 'cm'), legend.key.width = unit(1, 'cm'),
            legend.text = element_text(size = 6)) +
      guides(fill = guide_colorbar(barheight= 1)) +
      my_theme
  })
  
  # annual anomalies
  yr_agg <- aggregate(V1 ~ year, to_plo, function(x) mean(x, na.rm = T),
                      na.action = na.pass)
  yr_avg <- mean(yr_agg[, 'V1'], na.rm = T)
  yr_agg$anom <- yr_agg[, 'V1'] - yr_avg
  p6 <- suppressWarnings({ggplot(yr_agg, 
                                 aes_string(x = 'year', y = 'anom', group = '1', fill = 'anom')) +
      geom_bar(stat = 'identity') +
      scale_fill_gradient2(name = ylab,
                           low = colsright[1], mid = colsright[2], high = colsright[3], midpoint = 0
      ) +
      stat_smooth(method = 'lm', se = F, linetype = 'dashed', size = 1) +
      theme_classic(base_size = base_size) +
      ylab('') +
      xlab('') +
      theme(legend.position = 'none') +
      my_theme
  })
  
  # return plot list if TRUE
  if(plt_sep) return(list(p1, p2, p3, p4, p5, p6))
  
  # return summary list if TRUE
  if(sum_out){
    
    # month summaries
    sum_mo <- split(dat_plo, dat_plo$month)
    sum_mo <- lapply(sum_mo, function(x){
      
      vr <- var(x[, param], na.rm = TRUE)
      summ <- summary(x[, param])
      names(summ)[1:6] <- c('min', 'firstq', 'med', 'mean', 'thirdq', 'max')
      
      # manually add NA if not present
      if(length(summ) == 6)
        c(summ, `NA.s` = 0, var = vr)
      else 
        c(summ, var = vr)
      
    })
    sum_mo <- do.call('rbind', sum_mo)
    sum_mo <- data.frame(month = rownames(sum_mo), sum_mo)
    sum_mo$month <- factor(sum_mo$month, levels = mo_levs, labels = mo_labs)
    row.names(sum_mo) <- 1:nrow(sum_mo)
    
    # month, yr summaries
    sum_moyr <- to_plo
    names(sum_moyr)[names(sum_moyr) %in% 'V1'] <- 'mean'
    sum_moyr <- sum_moyr[with(sum_moyr, order(year, month)), ]
    row.names(sum_moyr) <- 1:nrow(sum_moyr)
    
    # annual summaries
    sum_yr <- yr_agg
    names(sum_yr)[names(sum_yr) %in% 'V1'] <- 'mean'
    
    return(list(sum_mo = sum_mo, sum_moyr = sum_moyr, sum_yr = sum_yr))
    
  }
  
  ##
  # combine plots
  suppressWarnings(gridExtra::grid.arrange(
    arrangeGrob(p1, p2, ncol = 1), 
    p3, 
    arrangeGrob(p4, p5, p6, ncol = 1, heights = c(1, 1, 0.8)), 
    ncol = 3, widths = c(1, 0.5, 1)
  ))
  
}


##parcing out temp plots
baTempplots<-plot_summary2(bawq_allparam, param  = "temp", years = c(2013, 2021), plt_sep = TRUE)
baTempAnom<-baTempplots[[5]]
baTempAnom

baTempAnomYEAR<-baTempplots[[6]]

ggsave("BarkersIslandTempAnom2021.TIFF", units = "px", width=1500, height=1000 ,dpi = 300, path = "outputs")
#make some turbidity plots

olTurbplots<-plot_summary2(olwq_allparam, param  = "turb", years = c(2013, 2021), plt_sep = TRUE)
olTurbAnomYEAR<-olTurbplots[[6]]


ggsave("OliverAnnualTurbidityAnom2021.TIFF", units = "px", width=1500, height=1000 ,dpi = 300, path = "outputs")


poCondplots<-plot_summary2(powq_allparam, param  = "spcond", years = c(2014, 2021), plt_sep = TRUE)



