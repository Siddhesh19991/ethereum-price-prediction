Ethereum <- read.csv("~/Downloads/Ethereum.csv")


library(lubridate)
Ethereum$Date<-dmy(Ethereum$Date)
ds<-Ethereum$Date
y<-log(Ethereum$Close)
df<-data.frame(ds,y)
plot(df)

library(prophet)
p<-prophet(df)
future<-make_future_dataframe(p,periods = 365)
forecast<-predict(p,future)
plot(p,forecast)
prophet_plot_components(p,forecast)
pred<-forecast$yhat[1:1544]
actual<-p$history$y
plot(actual,pred)
abline(lm(pred~actual),col="red")




