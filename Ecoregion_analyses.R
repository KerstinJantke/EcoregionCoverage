######################################
##  Ecoregion PA coverage analyses  ##
##             July 2023            ##
##    written by Kerstin Jantke     ##
##  kerstin.jantke@uni-hamburg.de   ##
######################################

options(encoding = "Windows-1252")

library(ggplot2)

# Set protected area coverage targets 
marine_target <- 0.1         # set to 0.1 to display Aichi target 11 and to 0.3 to display Kunming-Montreal target 3 
terrestrial_target <- 0.17    # set to 0.17  to display Aichi target 11 and to 0.3 to display Kunming-Montreal target 3

# Set country (ISO3-code) 
# set country to Brazil ("BRA"), Chile ("CHL"), Gabon ("GAB"), Germany ("DEU"), Indonesia ("IDN"), Korea ("KOR"), Mexico ("MEX"), Namibia ("NAM"), or Nepal ("NPL") 
country <- "BRA" 


################
## Check data ##
################

# load function to check data for MTA analyses

test_mta <- function(data = list(), target, plot = TRUE) {
  if (target < 0 | target > 1) {
    stop("Target is not between 0 and 1 - cannot compute metric")
  }
  
  pi_delete<- which(is.na(data$pi))
  if (length(pi_delete) > 0) {
    data <- data[-pi_delete, ]
    warning("NAs in pi column. Number of rows deleted:", length(pi_delete))
  }
  
  ai_delete<- which(is.na(data$ai))
  if (length(ai_delete) > 0) {
    data <- data[-ai_delete, ]
    warning("NAs in ai column. Number of rows deleted:", length(ai_delete))
  }
  
  N <- length(data$pi)
  pi <- data$pi
  ai <- data$ai
  
  if (sum(data$ai) == 0) {
    stop("All ai equal 0 - cannot compute metric")
  }
  if (sum(data$ai) < sum(data$pi)) {
    stop("ai smaller than pi - cannot compute metric")
  }
  
  MTA <- sum((pmin(((pi / ai) / (target) ), 1)) / N)
  
  pi_ai <- pi/ai
  prepdf <- cbind.data.frame(data, pi_ai)
  sorteddf <- prepdf[order(prepdf$pi_ai), ]
  feature <- sorteddf$feature
  
  proportion_protected <- cbind.data.frame(sorteddf$feature,sorteddf$pi_ai)
  names(proportion_protected) <- c("conservation_feature","proportion_protected")
  
  if (plot == TRUE) {
    p <- ggplot(sorteddf, aes(reorder(feature,pi_ai),pi_ai*100)) + geom_bar(stat = 'identity', col = "black", fill = "lightgrey", width = 1) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            axis.title = element_text(size = 15),
            axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 12),
            axis.text.y = element_text(hjust = 1, size = 12)) +
      scale_y_continuous(breaks = seq(0,100,10), limits = c(0,100), expand = c(0,0))+
      scale_x_discrete(expand = c(0,0))+
      geom_hline(yintercept = target*100, linetype = "longdash") +   #target-dependent line
#      geom_hline(yintercept = 30, linetype = "dotdash") +           #30by30 target   
#      ylab("protected amount (%)") + xlab("conservation feature")
      ylab("protected amount (%)") + xlab("   ")
    
    print(p)
  }
  
  list(MTA = MTA, target = target, N = N, proportion_protected = proportion_protected)
}

####################
# Terrestrial data #
####################

# Read and test all files; generate PA coverage figure for each year
# colnames need to be corrected only if they do not read "feature","ai","pi"
# if a warning message appears, check data
# if no warning message appears, a correct figure is generated for each year
# adapt file path if needed

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2010.csv"), header = T, sep = ",")  
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2011.csv"), header = T, sep = ",") 
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2012.csv"), header = T, sep = ",")  
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2013.csv"), header = T, sep = ",")  
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2014.csv"), header = T, sep = ",")  
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2015.csv"), header = T, sep = ",")  
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2016.csv"), header = T, sep = ",")  
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2017.csv"), header = T, sep = ",")  
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2018.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2019.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)

data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_2020.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,terrestrial_target)


############################################################
# Compute annual protection level, MTA value, and added PA #
############################################################

year <- 2010:2020
total_area_km2 <- vector(,length(year))
protected_area_km2  <- vector(,length(year))
protection_level <- vector(,length(year))
added_area_annual_km2 <- vector(,length(year))
added_area_total_km2 <- vector(,length(year))
mta  <- vector(,length(year))


for (i in year)
{
  data <- read.csv(paste0("data/",country,"_Stats/Eco_",country,"_",i,".csv", sep = ""))

  colnames(data)<- c("nr","feature","ai","pi")
  data$pi[is.na(data$pi)] <- 0
  
  # Total protection 
  total_area_km2[i-2009] <- sum(data$ai)
  protected_area_km2[i-2009] <- sum(data$pi)
  protection_level[i-2009] <- (protected_area_km2[i-2009]/total_area_km2[i-2009])*100
  added_area_total_km2[i-2009] <- protected_area_km2[i-2009]-protected_area_km2[1]
  
  # MTA
  N <- length(data$pi)
  pi <- data$pi
  ai <- data$ai
  
  mta[i-2009] <- sum((pmin(((pi / ai) / (terrestrial_target) ), 1)) / N)
  
}

ecoregion_protection_terrestrial <- cbind.data.frame(year,protection_level,mta,total_area_km2,protected_area_km2,added_area_total_km2)
ecoregion_protection_terrestrial


###############
# Marine data #
###############

# Read and test all files; generate PA coverage figure for each year
# colnames need to be corrected only if they do not read "feature","ai","pi"
# if a warning message appears, check data
# if no warning message appears, a correct figure is generated for each year

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2010.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2011.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2012.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2013.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2014.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2015.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2016.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2017.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2018.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2019.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)

data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_2020.csv"), header = T, sep = ",")
colnames(data)<- c("nr","feature","ai","pi")
data$pi[is.na(data$pi)] <- 0
test_mta(data,marine_target)


############################################################
# Compute annual protection level, MTA value, and added PA #
############################################################

year <- 2010:2020
total_area_km2 <- vector(,length(year))
protected_area_km2  <- vector(,length(year))
protection_level <- vector(,length(year))
added_area_annual_km2 <- vector(,length(year))
added_area_total_km2 <- vector(,length(year))
mta  <- vector(,length(year))


for (i in year)
{
  data <- read.csv(paste0("data/",country,"_Stats/EcoM_",country,"_",i,".csv", sep = ""))

  colnames(data)<- c("nr","feature","ai","pi")
  data$pi[is.na(data$pi)] <- 0
  
  # Total protection 
  total_area_km2[i-2009] <- sum(data$ai)
  protected_area_km2[i-2009] <- sum(data$pi)
  protection_level[i-2009] <- (protected_area_km2[i-2009]/total_area_km2[i-2009])*100
  added_area_total_km2[i-2009] <- protected_area_km2[i-2009]-protected_area_km2[1]
  
  # MTA
  N <- length(data$pi)
  pi <- data$pi
  ai <- data$ai
  
  mta[i-2009] <- sum((pmin(((pi / ai) / (marine_target) ), 1)) / N)
  
}

ecoregion_protection_marine <- cbind.data.frame(year,protection_level,mta,total_area_km2,protected_area_km2,added_area_total_km2)
ecoregion_protection_marine