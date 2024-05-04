# EcoregionCoverage

### Ecoregion protected area coverage analysis

Adequate representation of biodiversity in protected area networks is a prerequisite for successful conservation. In a research paper (<a href="https://doi.org/10.1016/j.gecco.2024.e02972">Jantke & Mohr, 2024</a>), we assess progress in protecting terrestrial and marine ecoregions for the decade 2011-2020, when the Strategic Plan for Biodiversity 2011-2020 was in effect. 

Using spatial analyses and the <a href="https://doi.org/10.1111/ddi.12853">Mean Target Achievement metric</a>, which indicates the degree to which a given representation target has been achieved, we analyze protected area coverage in nine countries from all continents, with a total of 173 terrestrial and 64 marine ecoregions. 

The analyses show that little progress in ecoregion representation in the last decade of terrestrial and marine protected area expansion leaves substantial tasks ahead. The methodology presented allows for ongoing evaluation, identification of gaps, and monitoring of countries’ progress towards global and national targets for ecological representation and is applicable to any biodiversity surrogate beyond ecoregions and any country or region of interest.

The ecoregion coverage data for the period 2010 to 2020 for each assessed country as well as the R scripts for calculating total PA coverage, PA coverage of terrestrial and marine ecoregions, the MTA metrics for the terrestrial and marine PA estates, and for creating ecoregion coverage graphs are made available here for further use.

More information about the data and analyses is provided in the associated research article by <a href="https://doi.org/10.1016/j.gecco.2024.e02972" > Jantke & Mohr (2024)</a>. 

### Data

We included these countries in our analysis: Brazil (BRA), Chile (CHL), Gabon (GAB), Germany (DEU), Indonesia (IDN), South Korea (KOR), Mexico (MEX), Namibia (NAM), and Nepal (NPL). The ecoregion coverage data for 2010 to 2020 for each assessed country are made available in the folders ISO3-Code_Stats separately for terrestrial and marine ecoregions. The data provide the ecoregions names, the total area (ai) and the protected area (pi) of each ecoregion present in a country in km².  

Protected area data originate from the <a href="https://www.protectedplanet.net/en/thematic-areas/wdpa?tab=WDPA">World Database on Protected Areas (WDPA)</a>. We obtained spatial data on terrestrial ecoregions from the <a href="https://ecoregions.appspot.com/">Ecoregions 2017 Resolve map</a> and on marine ecoregions from the <a href="https://data.unep-wcmc.org/datasets/38">Marine Ecoregions and Pelagic Provinces of the World datasets</a>.  

### Code

The R script <a href="https://github.com/KerstinJantke/EcoregionCoverage/blob/main/Ecoregion_analyses.R">Ecoregion_analyses.R</a> calculates total protected area coverage, coverage of terrestrial and marine ecoregions, and the Mean Target Achievement metric for the terrestrial and marine protected area estates of each country. The R script <a href="https://github.com/KerstinJantke/EcoregionCoverage/blob/main/Ecoregion_analyses_plots.R">Ecoregion_analyses_plots.R</a> creates ecoregion coverage graphs depicting the increase in protection between 2010 and 2020. We calculated the Mean Target Achievement metric for the terrestrial and marine realm in each country for 2010 to 2020 based on the <a href="https://github.com/KerstinJantke/ConsTarget/tree/master">ConsTarget R package</a>. 

## Citation

Jantke K. & Mohr B. (2024). Little progress in ecoregion representation in the last decade of terrestrial and marine protected area expansion leaves substantial tasks ahead. <i>Global Ecology and Conservation</i>, https://doi.org/10.1016/j.gecco.2024.e02972
