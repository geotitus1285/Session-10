require(ggplot2)
require(moments)
aq <- data.frame(airquality)
colSums(is.na(aq))
# Only numerical variables can be used for correlation
columns <- c('Ozone.sqrt', 'Solar.R', 'Wind', 'Temp')
# We identify non-na rows as rows with na values cause problems 
rows <- rowSums(is.na(aq)) == 0
# Compute correlation of variables and round to 2 digits
round(cor(aq[rows, columns]), 2)
# Impute monthly mean in Ozone
for (i in 1:nrow(airquality)){
if(is.na(airquality[i,"Ozone"])){
airquality[i,"Ozone"]<- mean(airquality[which(airquality[,"Month"]==airquality[i,"Month"]),"Ozone"],na.rm = TRUE)
}
# Impute monthly mean in Solar.R
if(is.na(airquality[i,"Solar.R"])){
airquality[i,"Solar.R"]<- mean(airquality[which(airquality[,"Month"]==airquality[i,"Month"]),"Solar.R"],na.rm = TRUE)