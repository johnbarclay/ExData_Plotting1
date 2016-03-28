
png.open <- function(excercise) {
    png(paste0(excercise,".png"), width = 480, height = 480, units = "px", pointsize = 20,
        bg = "white", res = NA);
}

png.close <- function() {
    dev.off();
}

#' loadData
#'
#' @df with data in it
#'
loadData <- function() {
  require("dplyr");
  library(dplyr);
  cacheFileName <- "household_power_consumption.2-1-2007-2-2-2007.txt"
  filename <- "household_power_consumption.txt";
  cached <- file.exists(cacheFileName);
  if (cached) {filename <- cacheFileName}
  
  df <- read.table(filename, 
       header = TRUE, 
       sep = ";", 
       dec = ".", 
       na.strings = "?",
       col.names = c("Date","Time", "ActivePower", "ReactivePower", "Voltage", "Intensity", "SubMetering1", "SubMetering2","SubMetering3"),
       colClasses = c(Date = "character", Time = "character", ActivePower = "numeric", ReactivePower = "numeric", Voltage = "numeric", Intensity = "numeric", SubMetering1 = "numeric", SubMetering2 = "numeric", SubMetering3 = "numeric"));
  
  if (!cached) {
      df <- df[df$Date == "2/2/2007" | df$Date == "1/2/2007",];
      write.table(df, append = FALSE,
          file = cacheFileName, 
          sep = ";", 
          dec = ".", 
          na = "?",
          col.names = TRUE, 
          row.names = FALSE);
      
  }

  # create new column "DateTime"
  df$DateTime <- with(df, as.POSIXct(paste(Date, Time), format="%e/%m/%Y %H:%M:%S"))
    
  return(df);
}

