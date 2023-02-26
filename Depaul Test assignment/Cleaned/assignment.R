## Call libraries
library(tidyverse)
library(readxl)
library(readr)


## Read excel sheets into separate data frames
Patients_by_Zip_Code <- read_excel("~/Documents/R Studio Files/Depaul Test assignment/Cleaned/Patients_by_Zip_Code_2-22-2023_8_18_03_PM.xlsm", 
                                    range = "A3:G82", col_types = c("text", 
                                                                    "numeric", "numeric", "numeric", 
                                                                     "numeric", "numeric", "numeric"))
View(Patients_by_Zip_Code)


DCHC_Locations <- read_excel("~/Documents/R Studio Files/Depaul Test assignment/Cleaned/DCHC - Locations.xlsx", 
                              sheet = "Combined", range = "A1:M36", 
                              col_types = c("text", "text", "text", 
                                            "text", "numeric", "text", "text", 
                                            "text", "numeric", "text", "text", 
                                             "numeric", "numeric"))
View(DCHC_Locations)   



Provider_by_Site <- read_excel("~/Documents/R Studio Files/Depaul Test assignment/Cleaned/2023 0112 Service Delivery Grid.xlsx", 
                                sheet = "Provider by Site", range = "A2:AJ104")
View(Provider_by_Site)


Medicare_Monthly_Enrollment_October_2022 <- read_csv("~/Documents/R Studio Files/Depaul Test assignment/Cleaned/Medicare_Monthly_Enrollment_October_2022.csv")
View(Medicare_Monthly_Enrollment_October_2022)


## Start separating providers
floater_providers <- Provider_by_Site %>% filter(Site == "0.0")
View(floater_providers)

assigned_providers <- Provider_by_Site %>% filter(Site != "0.0")
View(assigned_providers)


## reset column name

colnames(assigned_providers)[1] <- "Provider_Names"
View(assigned_providers)

colnames(Patients_by_Zip_Code) <- c("ZIP_CODE_A", "NONE_UNINSURED_B", "MEDICAID_CHIP_OTHER_PUBLIC_C","MEDICARE_D", "PRIVATE_E", "UNKNOWN", "TOTAL_PATIENTS_F")
View(Patients_by_Zip_Code)

## Export to csv to embedded folder 'dataset csv files'

write.csv(assigned_providers, "Assigned_Providers.csv", row.names = FALSE)
write.csv(DCHC_Locations, "DCHC_Locations.csv", row.names = FALSE)
write.csv(Patients_by_Zip_Code, "Patients_by_Zip_Code.csv", row.names = FALSE)

## Harvey Medicare Patients

Harvey_Monthly_enrollment <- Medicare_Monthly_Enrollment_October_2022 %>%
  filter(BENE_COUNTY_DESC == "Harvey")


## Second Round of excel sheets
Location_Details <- read_excel("Location_Details.xlsx", 
                               sheet = "Location_Details", range = "A2:F12", 
                               col_types = c("text", "numeric", "text", 
                                             "text", "text", "numeric"))
View(Location_Details)  



Medicare_in_Range <- read_excel("Medicare_in_Range.xlsx", 
                                sheet = "Medicare_in_Range", range = "A2:F37", 
                                col_types = c("text", "text", "text", 
                                              "numeric", "numeric", "numeric"))
View(Medicare_in_Range) 



Original_provider_per_site_count <- read_excel("Original_provider_per_site_count.xlsx", 
                                               sheet = "Original_provider_per_site_coun", 
                                               range = "A2:C42", col_types = c("text", 
                                                                               "text", "numeric"))
View(Original_provider_per_site_count)   



Provider_Demand <- read_excel("Provider_Demand.xlsx", 
                              sheet = "Provider_Demand", range = "A2:F54", 
                              col_types = c("text", "text", "text", 
                                            "text", "numeric", "numeric"))
View(Provider_Demand)                                                                                                    


