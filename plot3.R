source("download_data.R")

d <- download_data()

par(mfcol=c(1,1))
plot(d$Date, d$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(d$Date, d$Sub_metering_1, col="black")
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
