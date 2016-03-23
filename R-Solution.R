# This is a solution to the fourth week course project

library(ggplot2)

# Help functions
check_case <- function(){
    if (!dir.exists('./data')){
        print("\t Creating the data directory")
        dir.create('./data')
    }
    if (!dir.exists('./img')){
        print("\t Creating a img directory")
        dir.create('./img')
    }

    # :TODO: check for data files
}

read_scc <- function() {
    scc <- readRDS('./data/Source_Classification_Code.rds')
}

read_data <- function(){
    data <- readRDS('./data/summarySCC_PM25.rds')
}

# Task 1
# ------
#
# Have the total emissions of pm2.5 decreased in the years 1999 to 2008
# Create plots of all emissions sources for the years 1999,2002,2005 and 2008

task1 <- function(data){
    years <- c(1999,2002,2005,2008)
    total_em <- tapply(data$Emissions, data$year, sum)
    png('./img/total_emissions.png')
    plot(years, total_em, pch=19, col=rgb(0,0,0,0.8), ylab = "Total emissons",
        xlab="Year", main="Total dust emissions in the US over time")
    segments(1999,total_em[[1]],2008,total_em[[4]])
    dev.off()
}

# Tast 2
# ------
#
# Have total emissions decreased in Baltimore City in the year 1999 to 2008?
task2 <- function(data){
    years <- c(1999,2002,2005,2008)
    baltData <- subset(data, fips=="24510")
    baltEm <- tapply(baltData$Emissions, baltData$year, sum)
    png('./img/baltimore_emissions.png')
    plot(years, baltEm, pch=19, col=rgb(0,0,0,0.8),
        xlab = "Year", ylab="Total Emissions", main="Total Emissions in Baltimore City")
    segments(1999,baltEm[[1]], 2008,baltEm[[4]])
    dev.off()
}

# Tast 3
# ------
#
# Which type source of emissions has seen a decrease in Baltimore City in the years 1999 to 2008?
task3 <- function(data){
    years <- c(1999,2002,2005,2008)
    baltData <- subset(data, fips=="24510")
    baltPoints <- subset(baltData, type=="POINT")
    baltNonPoint <- subset(baltData, type=="NONPOINT")
    baltOnRoad <- subset(baltData, type=="ONROAD")
    baltNonRoad <- subset(baltData, type=="NONROAD")
}

# Tast 4
# ------
#

# Tast 5
# ------
#

# Tast 6
# ------
#

# MAIN
check_case()
scc <- read_scc()
data <- read_data()

task1(data)
task2(data)
