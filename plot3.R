
source(file = "utilities.R");

plot3 <- function() {

  energy.df <- loadData();
  png.open("plot3");
  plot3.plot(energy.df);
  png.close();
}

plot3.plot <- function(energy.df) {
    
   
    par(cex = .25);
    plot.default(
        x = energy.df$DateTime, 
        y = energy.df$SubMetering1, 
        type ="l", 
        col = "black",
        main = "",
        ylab = "Energy sub metering", 
        xlab = "", 
        yaxt='n');
    
    axis(side=2, at=seq(0,30, 10), labels = TRUE, );
    
    lines(energy.df$DateTime, energy.df$SubMetering2 ,col="red");
    lines(energy.df$DateTime, energy.df$SubMetering3 ,col="blue");
    legend(x = "topright",inset = 0,
           legend = c("SubMetering1" , "SubMetering2" , "SubMetering3" ), 
           col = c("black", "red", "blue"), 
           lwd = 1, 
           pt.cex = 2, cex = 3,
           horiz = FALSE)
}
