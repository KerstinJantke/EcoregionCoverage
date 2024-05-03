######################################
##  Ecoregion PA coverage analyses  ##
##        -  Country plots -        ##
##             July 2023            ## 
##   written by Kerstin Jantke      ##
##  kerstin.jantke@uni-hamburg.de   ##
######################################

library(ggplot2)
library(egg)

#########
# Korea #
#########

# terrestrial

data_2010 <- read.csv(file = 'data/KOR_Stats/Eco_KOR_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/KOR_Stats/Eco_KOR_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]

# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Central Korean deciduous forests', 'Southern Korea evergreen forests', 'Manchurian mixed forests')  # ggplot will otherwise plot ecoregions in alphabetical order

ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Korea_terr.jpg", width = 7, height = 6, dpi = 300)


# marine

data_2010 <- read.csv(file = 'data/KOR_Stats/EcoM_KOR_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/KOR_Stats/EcoM_KOR_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]

# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Sea of Japan/East Sea','Sea of Japan','Yellow Sea','East China Sea')  # ggplot will otherwise plot ecoregions in alphabetical order

ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#  annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
#  annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

mar_plot

#ggsave("plots/Korea_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Korea_panel1.jpg", panel1, width = 12, height = 6, dpi = 300)
#ggsave("plots/Korea_panel2.jpg", panel2, width = 6, height = 12, dpi = 300)

###########
# Namibia #
###########

# terrestrial

data_2010 <- read.csv(file = 'data/NAM_Stats/Eco_NAM_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/NAM_Stats/Eco_NAM_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]

# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Kalahari xeric savanna','Gariep Karoo','Zambezian Baikiaea woodlands','Angolan mopane woodlands','Zambezian flooded grasslands',
                 'Zambezian mopane woodlands', 'Namibian savanna woodlands', 'Kalahari Acacia woodlands','Kaokoveld desert', 'Namaqualand-Richtersveld steppe',
                 'Namib Desert','Etosha Pan halophytics')   # ggplot will otherwise plot ecoregions in alphabetical order

ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#1e7718', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Namibia_terr.jpg", width = 7, height = 6, dpi = 300)


# marine

data_2010 <- read.csv(file = 'data/NAM_Stats/EcoM_NAM_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/NAM_Stats/EcoM_NAM_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]

# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Benguela Current','Namib','Namaqua')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
#annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

mar_plot

#ggsave("plots/Namibia_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Namibia_panel1.jpg", panel1, width = 12, height = 6, dpi = 300)
#ggsave("plots/Namibia_panel2.jpg", panel2, width = 6, height = 12,dpi = 300)


##########
# Brazil #
##########

# terrestrial

data_2010 <- read.csv(file = 'data/BRA_Stats/Eco_BRA_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/BRA_Stats/Eco_BRA_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Bahia interior forests','Uruguayan savanna', 'Pernambuco interior forests',
                 'Araucaria moist forests', 'Alto Paraná Atlantic forests','Caatinga', 'Pantanal', 'Brazilian Atlantic dry forests', 'Bahia coastal forests',                           
                 'Pernambuco coastal forests','Cerrado', 'Chiquitano dry forests','Iquitos várzea','Tocantins/Pindare moist forests','Maranhão Babaçu forests',                         
                 'Atlantic Coast restingas','Monte Alegre várzea','Mato Grosso tropical dry forests','Campos Rupestres montane savanna','Caatinga Enclaves moist forests',
                 'Xingu-Tocantins-Araguaia moist forests','Southern Atlantic Brazilian mangroves','Serra do Mar coastal forests','Juruá-Purus moist forests',
                 'Solimões-Japurá moist forests','Madeira-Tapajós moist forests','Gurupa várzea','Purus várzea','Guianan savanna','Southwest Amazon moist forests',
                 'Purus-Madeira moist forests','Negro-Branco moist forests','Japurá-Solimões-Negro moist forests','Marajó várzea','Uatumã-Trombetas moist forests',
                 'Rio Negro campinarana','Northeast Brazil restingas','Tapajós-Xingu moist forests','Amazon-Orinoco-Southern Caribbean mangroves',
                 'Guianan piedmont moist forests','Guianan Highlands moist forests','Caqueta moist forests','Guianan lowland moist forests','Pantepui forests & shrublands',
                 'Fernando de Noronha-Atol das Rocas moist forests')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Brazil_terr.jpg", width = 7, height = 6, dpi = 300)

# marine

data_2010 <- read.csv(file = 'data/BRA_Stats/EcoM_BRA_2010.csv', header = T, sep = ",", encoding = 'Windows-1252')
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/BRA_Stats/EcoM_BRA_2020.csv', header = T, sep = ",", encoding = 'Windows-1252')
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Trindade and Martin Vaz Islands','South Central Atlantic Gyre',            
                 'Equatorial Atlantic','Rio Grande','Amazonia','Eastern Brazil','Southeastern Brazil','Northeastern Brazil',
                 'Sao Pedro and Sao Paulo Islands','Fernando de Naronha and Atoll das Rocas')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#  annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill=NA)+
#  annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill=NA)

mar_plot

#ggsave("plots/Brazil_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Brazil_panel1.jpg", panel1, width = 12, height = 6, dpi = 300)
#ggsave("plots/Brazil_panel2.jpg", panel2, width = 6, height = 12, dpi = 300)

#########
# Nepal #
#########

# terrestrial

data_2010 <- read.csv(file = 'data/NPL_Stats/Eco_NPL_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/NPL_Stats/Eco_NPL_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]

# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Himalayan subtropical pine forests',           
                 'Himalayan subtropical broadleaf forests','Eastern Himalayan broadleaf forests','Western Himalayan subalpine conifer forests',  
                 'Terai-Duar savanna and grasslands','Western Himalayan broadleaf forests','Western Himalayan alpine shrub and meadows',   
                 'Eastern Himalayan subalpine conifer forests','Rock and Ice','Eastern Himalayan alpine shrub and meadows')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=75,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Nepal_terr.jpg", width = 7, height = 6, dpi = 300)



###########
# Germany #
###########

# terrestrial

data_2010 <- read.csv(file = 'data/DEU_Stats/Eco_DEU_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/DEU_Stats/Eco_DEU_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('European Atlantic mixed forests','Western European broadleaf forests','Central European mixed forests',
                 'Baltic mixed forests','Alps conifer and mixed forests')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill="NA")+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill="NA")

terr_plot

#ggsave("plots/Germany_terr.jpg", width = 7, height = 6, dpi = 300)

# marine

data_2010 <- read.csv(file = 'data/DEU_Stats/EcoM_DEU_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/DEU_Stats/EcoM_DEU_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('North Sea','Baltic Sea')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#  annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill="NA")+
#  annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill="NA")

mar_plot

#ggsave("plots/Germany_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Germany_panel1.jpg", panel1, width = 12, height = 6, dpi = 300)
#ggsave("plots/Germany_panel2.jpg", panel2, width = 6, height = 12, dpi = 300)


##########
# Mexico #
##########

# terrestrial

data_2010 <- read.csv(file = 'data/MEX_Stats/Eco_MEX_2010.csv', header = T, sep = ",", encoding = 'Windows-1252')
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/MEX_Stats/Eco_MEX_2020.csv', header = T, sep = ",", encoding = 'Windows-1252')
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('California coastal sage and chaparral','Oaxacan montane forests',                     
                 'Sierra Madre del Sur pine-oak forests','Yucatán dry forests','Chiapas Depression dry forests',              
                 'Southern Pacific dry forests','Chiapas montane forests','Veracruz dry forests',                        
                 'Meseta Central matorral','Sonoran-Sinaloan subtropical dry forest','Veracruz moist forests',                      
                 'Central Mexican matorral','Sierra Madre de Oaxaca pine-oak forests','Bajío dry forests',                           
                 'Veracruz montane forests','Tamaulipan matorral','Chihuahuan desert','Jalisco dry forests',
                 'Tamaulipan mezquital','Balsas dry forests','Sinaloan dry forests','Petén-Veracruz moist forests',
                 'Sierra Madre Occidental pine-oak forests','Sonoran desert','Chimalapas montane forests','Central American dry forests',                
                 'Trans-Mexican Volcanic Belt pine-oak forests','Central American pine-oak forests','Tehuacán Valley matorral',                    
                 'California montane chaparral and woodlands','San Lucan xeric scrub','Western Gulf coastal grasslands',             
                 'Yucatán moist forests','Sierra de la Laguna dry forests','Pantanos de Centla','Sierra Madre Oriental pine-oak forests',
                 'Sierra Madre de Chiapas moist forests','Sierra de los Tuxtlas','Gulf of California xeric scrub','Northern Mesoamerican Pacific mangroves',
                 'Baja California desert','Mesoamerican Gulf-Caribbean mangroves','Southern Mesoamerican Pacific mangroves',            
                 'Sierra de la Laguna pine-oak forests','Islas Revillagigedo dry forests')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=73,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Mexico_terr.jpg", width = 7, height = 6, dpi = 300)

# marine

data_2010 <- read.csv(file = 'data/MEX_Stats/EcoM_MEX_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/MEX_Stats/EcoM_MEX_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Inter American Seas','North Central Pacific Gyre','Mexican Tropical Pacific','Eastern Tropical Pacific','California Current',
                 'Chiapas-Nicaragua','Magdalena Transition','Southern Gulf of Mexico','Northern Gulf of Mexico','Southern California Bight','Cortezian',
                 'Western Caribbean','Revillagigedos')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#  annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill=NA)+
#  annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill=NA)

mar_plot

#ggsave("plots/Mexico_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Mexico_panel1.jpg", panel1, width = 12, height = 6,dpi = 300)
#ggsave("plots/Mexico_panel2.jpg", panel2, width = 6, height = 12,dpi = 300)


#############
# Indonesia #
#############

# terrestrial

data_2010 <- read.csv(file = 'data/IDN_Stats/Eco_IDN_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/IDN_Stats/Eco_IDN_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Buru rain forests','Western Java rain forests','Peninsular Malaysian rain forests', 'Eastern Java-Bali rain forests',                               
                 'Borneo lowland rain forests','Sumatran freshwater swamp forests','Timor and Wetar deciduous forests','Sulawesi lowland rain forests',                                
                 'Southern New Guinea lowland rain forests','Sumatran lowland rain forests','Sumatran peat swamp forests','Eastern Java-Bali montane rain forests',                       
                 'Lesser Sundas deciduous forests','Western Java montane rain forests','Halmahera rain forests','Vogelkop-Aru lowland rain forests',                            
                 'Sumba deciduous forests','Sundaland heath forests','Borneo peat swamp forests','Seram rain forests','Sunda Shelf mangroves', 
                 'Banda Sea Islands moist deciduous forests',                    
                 'Southwest Borneo freshwater swamp forests','Sulawesi montane rain forests','Southern New Guinea freshwater swamp forests',
                 'Biak-Numfoor rain forests','Northern New Guinea montane rain forests','Northern New Guinea lowland rain and freshwater swamp forests',
                 'Borneo montane rain forests','Central Range Papuan montane rain forests','New Guinea mangroves','Mentawai Islands rain forests',                                
                 'Sumatran montane rain forests','Sumatran tropical pine forests','Yapen rain forests','Trans Fly savanna and grasslands',                             
                 'Vogelkop montane rain forests','Papuan Central Range sub-alpine grasslands')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Indonesia_terr.jpg", width = 7, height = 6, dpi = 300)

# marine

data_2010 <- read.csv(file = 'data/IDN_Stats/EcoM_IDN_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/IDN_Stats/EcoM_IDN_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Bonaparte Coast','Exmouth to Broome','Halmahera','Indian Ocean Monsoon Gyre','Palawan/North Borneo',
                 'Arafura Sea','Equatorial Pacific','Indonesian Through-Flow','Sunda Shelf/Java Sea','Sulawesi Sea/Makassar Strait',
                 'Malacca Strait','Southern Java','Western Sumatra','Banda Sea','Northeast Sulawesi','Lesser Sunda','Papua')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#  annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
#  annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

mar_plot

#ggsave("plots/Indonesia_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Indonesia_panel1.jpg", panel1, width = 12, height = 6,dpi = 300)
#ggsave("plots/Indonesia_panel2.jpg", panel2, width = 6, height = 12,dpi = 300)


#########
# Chile #
#########

# terrestrial

data_2010 <- read.csv(file = 'data/CHL_Stats/Eco_CHL_2010.csv', header = T, sep = ",", encoding = 'Windows-1252')
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/CHL_Stats/Eco_CHL_2020.csv', header = T, sep = ",", encoding = 'Windows-1252')
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('San Félix-San Ambrosio Islands temperate forests','Chilean Matorral',                                
                 'Atacama desert','Southern Andean steppe','Patagonian steppe','Central Andean dry puna',
                 'Valdivian temperate forests','Rapa Nui and Sala y Gómez subtropical forests','Magellanic subpolar forests',
                 'Juan Fernández Islands temperate forests','Rock and Ice')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=73.5,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Chile_terr.jpg", width = 7, height = 6, dpi = 300)


# marine

data_2010 <- read.csv(file = 'data/CHL_Stats/EcoM_CHL_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/CHL_Stats/EcoM_CHL_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Antarctic Polar Front','Humboldt Current','Subantarctic','Subtropical Convergence',
                 'Humboldtian','Araucanian','Juan Fernandez and Desventuradas','Central Chile','Chiloense',
                 'Channels and Fjords of Southern Chile','South Central Pacific Gyre','Easter Island')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#  annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill=NA)+
#  annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill=NA)

mar_plot

#ggsave("plots/Chile_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Chile_panel1.jpg", panel1, width = 12, height = 6, dpi = 300)
#ggsave("plots/Chile_panel2.jpg", panel2, width = 6, height = 12, dpi = 300)


#########
# Gabon #
#########

# terrestrial

data_2010 <- read.csv(file = 'data/GAB_Stats/Eco_GAB_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/GAB_Stats/Eco_GAB_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Western Congolian forest-savanna','Northwest Congolian lowland forests','Central African mangroves','Congolian coastal forests')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

terr_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#1e7718', color='#1e7718', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#82cc2c', color='#82cc2c', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 17, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="terrestrial",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=17,label="target by 2020: 17%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))+
  annotate("label",x=-Inf, y=30,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

terr_plot

#ggsave("plots/Gabon_terr.jpg", width = 7, height = 6, dpi = 300)


# marine

data_2010 <- read.csv(file = 'data/GAB_Stats/EcoM_GAB_2010.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2010$pi[is.na(data_2010$pi)] <- 0
data_2010 <- data_2010[order(data_2010$Ecoregion),]

data_2020 <- read.csv(file = 'data/GAB_Stats/EcoM_GAB_2020.csv', header = T, sep = ",", fileEncoding = "Windows-1252")
data_2020$pi[is.na(data_2020$pi)] <- 0
data_2020 <- data_2020[order(data_2020$Ecoregion),]


# Prepare display order of ecoregions (sorted from low to high protected area coverage based on 2010 data)

pi <- data_2010$pi
ai <- data_2010$ai
pi_ai <- pi/ai
prepdf <- cbind.data.frame(data_2010, pi_ai)
sorteddf <- prepdf[order(prepdf$pi_ai), ]
ecoregion_sorted <- sorteddf$Ecoregion 
ecoregion_sorted  # copy ecoregion names to level order

level_order <- c('Equatorial Atlantic','Gulf of Guinea South','Gulf of Guinea Central')   # ggplot will otherwise plot ecoregions in alphabetical order


ecoregion <- data_2010$Ecoregion
eco_coverage_2010 <- data_2010$pi/data_2010$ai *100   # calculates protection level in percent
eco_coverage_2020 <- data_2020$pi/data_2020$ai *100   # calculates protection level in percent

eco_coverage <- cbind.data.frame(ecoregion, eco_coverage_2010, eco_coverage_2020)
eco_coverage

mar_plot <-
  ggplot(data=eco_coverage, aes(x=ecoregion)) +
  geom_bar(aes(y=eco_coverage_2020), stat="identity", position="identity", fill='#3329e0', color='#3329e0', width = 1)+    
  geom_bar(aes(y=eco_coverage_2010), stat="identity", position ="identity", fill='#14b8ff', color='#14b8ff', width = 1)+
  scale_x_discrete(limits = level_order, expand = c(0,0))+
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,10), expand = c(0,0))+
  geom_hline(yintercept = 10, linetype = "longdash") +   # line displaying Aichi target
  geom_hline(yintercept = 30, linetype = "dotted") +    # line displaying 30by30 target   
  ylab("ecoregion protection level (%)") + xlab(NULL)+
  theme_linedraw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.x=element_text(angle=70,hjust=1, vjust = 1))+
  annotate("label",x=-Inf, y=Inf,label="marine",vjust="inward",hjust="inward", size=5, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))
#  annotate("label",x=-Inf, y=10.5,label="target by 2020: 10%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"), fill=NA)+
#  annotate("label",x=-Inf, y=30.5,label="target by 2030: 30%",vjust="inward",hjust="inward", size=3, fontface="bold", label.size=0, label.padding=unit(0.5,"lines"))

mar_plot

#ggsave("plots/Gabon_marine.jpg", width = 7, height = 6, dpi = 300)


# Plot panels

panel1 <- ggarrange(terr_plot,mar_plot, ncol = 2)
panel1

panel2 <- ggarrange(terr_plot,mar_plot, ncol = 1)
panel2

#ggsave("plots/Gabon_panel1.jpg", panel1, width = 12, height = 6, dpi = 300)
#ggsave("plots/Gabon_panel2.jpg", panel2, width = 6, height = 12, dpi = 300)