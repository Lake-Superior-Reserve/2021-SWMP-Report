#script starts from the development of the bawq_qaqc dataset from "01 Command Data Prep.R"
#script further manipulates the data and creates a figure using modified code from SWMPrExtension package
## we are recreating a better verison of the historical daily range swmpr plot
## This code comes from SWMPrExtension code for historical_daily_range with modifications along the way

#removes months of data that do not have enough data points to be used in monthly aggregation analyses later. 
#A month must have 3 weeks worth of data
source("scripts/companion/03SWMPremoval.R")

#H.R. notes from 011323 Fix fonts # may need to download font to repository and add could using extrafonts.

## First, separate the datetimestamp and add a month and year column in the dataset using dplyr pipes
dat<-bawq_allparam %>% 
  separate(datetimestamp, sep = " ", into = c("date", "time")) %>%
  mutate(bawq_allparam, year=lubridate::year(datetimestamp)) %>%
  mutate(bawq_allparam, month=lubridate::month(datetimestamp))
  
## Cut out 2012 data because it is incomplete and cut out paramaeters we don't need
dat<-dat %>% filter(.data$year >=2013) %>%
  select(c("datetimestamp","year", "month", "temp", "spcond", "do_mgl", "ph", "turb"))

##create parameter with Temp in degree F
dat <- dat %>%
  mutate(temp_F=temp*(9/5)+32)

# Assign date for determining daily stat value
dat$date <- lubridate::floor_date(dat$datetimestamp, unit = 'days')

# Filter for just temp and remove NA values
dat <- dat %>% select(.data$datetimestamp, date, temp_F) %>% 
  filter(!is.na(temp_F))

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

#skipped make some labels because those will be made outside of R plot development

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