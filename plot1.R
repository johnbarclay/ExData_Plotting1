
source(file = "utilities.R");

plot1 <- function() {

  energy.df <- loadData();
  png.open("plot1");
  plot1.plot(energy.df);
  png.close();
}

plot1.plot <- function(energy.df) {
    
    par(cex = .5);
    hist(energy.df$ActivePower, 
         freq = TRUE,
         col = "red", 
         border = "black",
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)",
         ylab = "Frequency",
         plot = TRUE, 
         yaxt='n');
    axis(side=2, at=seq(0,1200, 200), labels = TRUE);
}
