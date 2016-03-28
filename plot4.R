
source(file = "utilities.R");
source(file = "plot1.R");
source(file = "plot2.R");
source(file = "plot3.R");

plot4 <- function() {

  energy.df <- loadData();
  png.open("plot4");
  par(mfrow=c(2,2))
  
  plot1.plot(energy.df);
  plot2.plot(energy.df);
  plot3.plot(energy.df);
  plot4.plot(energy.df);
  
  png.close();
  
}

plot4.plot <- function(energy.df) {
    
    par(cex = .25);

    plot.default(
        x = energy.df$DateTime, 
        y = energy.df$ReactivePower, 
        type ="l", 
        col = "black",
        main = "",
        ylab = "Global ReActive Power", 
        xlab = "datetime");

}



