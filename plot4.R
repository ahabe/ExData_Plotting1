source("download_data.R")

d <- download_data()

par(mfcol=c(2,2))

plot(d$Date, d$Global_active_power, type="n", ylab = "Global Active Power (kilowatt)", xlab = "")
lines(d$Date, d$Global_active_power)


plot(d$Date, d$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(d$Date, d$Sub_metering_1, col="black")
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1, box.lwd = 0, bg = adjustcolor("white", alpha.f = 0), cex = 0.8)


plot(d$Date, d$Voltage, type="n", ylab = "Voltage", xlab = "datetime")
lines(d$Date, d$Voltage)

plot(d$Date, d$Global_reactive_power, type="n", ylab = "Voltage", xlab = "datetime")
lines(d$Date, d$Global_reactive_power)

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
