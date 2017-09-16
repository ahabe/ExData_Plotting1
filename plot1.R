source("download_data.R")

d <- download_data()

par(mfcol=c(1,1))
hist(d$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power" )
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()