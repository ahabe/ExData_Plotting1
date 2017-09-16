source("download_data.R")

d <- download_data()

par(mfcol=c(1,1))
plot(d$Date, d$Global_active_power, type="n", ylab = "Global Active Power (kilowatt)", xlab = "")
lines(d$Global_active_power)
lines(d$Date, d$Global_active_power)
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

