
library(jsonlite)
api_sites_url      <- 'http://api.erg.kcl.ac.uk/AirQuality/Information/MonitoringSites/GroupName=London/Json'

## Import and re-format
api_sites          <- fromJSON(api_sites_url, flatten = FALSE)
api_sites_df       <- data.frame(api_sites)

## Create export table
sites              <- data.frame(sitecode = api_sites_df$Sites.Site..SiteCode,
                                sitename = api_sites_df$Sites.Site..SiteName,
                                latitude = api_sites_df$Sites.Site..Latitude,
                                longitude = api_sites_df$Sites.Site..Longitude)
row.names(sites)    <- NULL

rm(api_sites_url, api_sites_df, api_sites)
