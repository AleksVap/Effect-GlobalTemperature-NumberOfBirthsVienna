# Please set your working directory to the directory that contains this project.
# e.g. setwd(projectDirectoryPath)


# Load birth data from Vienna
# Skip first row since it is the title
# Seperator is ";" not comma!
# second line (first not skipped line) is header:
birthData <- read.csv2("./src/data/raw/vie_201.csv", header = TRUE, sep=";", skip = 1)

# Data Preperation -> aggregate by reference year -> sum number of living births:
totalBirthData <- aggregate(LIVEBIRTH ~ REF_YEAR, FUN=sum, data=birthData)


# Load mean near surface temperature deviation
meanTempDeviation <- read.csv2("./src/data/raw/cli_iad_td.tsv", header = TRUE, sep="\t")

# Extracting the global temperature deviation
meanTempDeviation <- meanTempDeviation[meanTempDeviation$indic_env.source.unit.time == "TD_GLB,NOAAGLOBALTEMP,DEGC", ]

# Extracting global temp dev from 2002-2017
meanTempDeviation <- meanTempDeviation[,2:(2017-2002 + 2)]

# Renaming years such that they match with years from birthdate
# Transpose globalmeantemp and convert to number
globalTempDev <- data.frame(GlobalTempDev = as.numeric(t(meanTempDeviation)), year = c(2017:2002))


# Merge data
data <- merge(globalTempDev, totalBirthData, by.x = "year", by.y = "REF_YEAR")

# Save preprocessed data
write.csv2(data, "./src/data/processed/mergedData.csv")
