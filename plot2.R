
source(file = "utilities.R");

plot2 <- function() {
  energy.df <- loadData();
  png.open("plot2");
  plot2.plot(energy.df);
  png.close();
}

plot2.plot <- function(energy.df) {
    par(cex = .25);
    plot.default(
        x = energy.df$DateTime, 
        y = energy.df$ActivePower, 
        type ="l", 
        col = "black",
        main = "",
        ylab = "Global Active Power (kilowatts)", 
        xlab = "datetime");
}