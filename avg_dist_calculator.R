library(geosphere)

capitals <- read.csv("./capitals_latlon.csv", header = TRUE)

avg_distance = function(lat, lon){
  all_averages = rep(0,50)
  
  for(i in 1:50){
    p1 = c(lon[i], lat[i])
    distances = rep(0, 50)
    
    for(j in 1:50){
      p2 = c(lon[j], lat[j])
      distances[j] = distVincentyEllipsoid(p1, p2)
    }
    distances = distances[distances != 0]
    all_averages[i] = mean(distances)/1000
  }
  all_averages
}

avg_dist = avg_distance(capitals$latitude, capitals$longitude)
avg_dist

capitals$avg_distance = avg_dist

write.csv(capitals, "capitals.csv")



for(i in 1:50){
  capitals[1,]$avg_dist = avg_distance(capitals$latitude, capitals$longitude)
}