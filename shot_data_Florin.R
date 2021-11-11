#Owen Florin
#Data Science & Solutions Technical Assessment

#Loading packages
library(readr)

#Importing dataset
shot_data <- read_csv("shots_data.csv")

#Understanding dataset
str(shot_data)
View(shot_data)
summary(shot_data)

team_A <- shot_data[shot_data$team=="Team A",]
team_B <- shot_data[shot_data$team=="Team B",]

team_A_makes <- shot_data[shot_data$team=="Team A" & shot_data$fgmade==1,]
team_B_makes <- shot_data[shot_data$team=="Team B" & shot_data$fgmade==1,]

#shot distribution - count of shots in zone / total shots

corner_three <- (shot_data[shot_data$y <= 7.8 & 
                             (shot_data$x >= 22 | shot_data$x <= -22),])
corner_three

non_corner_three <- (shot_data[((shot_data$x^2 + shot_data$y^2) >= 23.75^2) & 
                 shot_data$y > 7.8,])
non_corner_three

inside_shots <- shot_data[((shot_data$x^2 + shot_data$y^2) <= 23.75^2),]
non_three <- (inside_shots[inside_shots$x <= 22 & inside_shots$x >= -22,])
View(non_three)

#shot distribution by team
#2PT
two_pt_distr_A <- nrow(non_three[non_three$team=="Team A",]) / nrow(shot_data[shot_data$team=="Team A",])
two_pt_distr_A

two_pt_distr_B <- nrow(non_three[non_three$team=="Team B",]) / nrow(shot_data[shot_data$team=="Team B",])
two_pt_distr_B

#non corner 3
non_corner_distr_A <- nrow(non_corner_three[non_corner_three$team=="Team A",]) / nrow(shot_data[shot_data$team=="Team A",])
non_corner_distr_A

non_corner_distr_B <- nrow(non_corner_three[non_corner_three$team=="Team B",]) / nrow(shot_data[shot_data$team=="Team B",])
non_corner_distr_B

#corner 3
corner_distr_A <- nrow(corner_three[corner_three$team=="Team A",]) / nrow(shot_data[shot_data$team=="Team A",])
corner_distr_A

corner_distr_B <- nrow(corner_three[corner_three$team=="Team B",]) / nrow(shot_data[shot_data$team=="Team B",])
corner_distr_B

#eFG% by team
#2 PT
non_three_efg_A <- nrow(non_three[non_three$fgmade==1 & non_three$team=="Team A",]) / 
  nrow(non_three[non_three$team == "Team A",])
non_three_efg_A

non_three_efg_B <- nrow(non_three[non_three$fgmade==1 & non_three$team=="Team B",]) / 
  nrow(non_three[non_three$team == "Team B",])
non_three_efg_B

#non corner three
non_corner_three_efg_A <- (nrow(non_corner_three[non_corner_three$fgmade==1 & non_corner_three$team=="Team A",]) + 
  (.5*(nrow(non_corner_three[non_corner_three$fgmade==1 & non_corner_three$team == "Team A",])))) / 
  nrow(non_corner_three[non_corner_three$team == "Team A",])
non_corner_three_efg_A

non_corner_three_efg_B <- (nrow(non_corner_three[non_corner_three$fgmade==1 & non_corner_three$team=="Team B",]) + 
                             (.5*(nrow(non_corner_three[non_corner_three$fgmade==1 & non_corner_three$team=="Team B",])))) / 
  nrow(non_corner_three[non_corner_three$team == "Team B",])
non_corner_three_efg_B

#corner three
corner_three_efg_A <- (nrow(corner_three[corner_three$fgmade==1 & corner_three$team=="Team A",]) + 
    (.5*(nrow(corner_three[corner_three$fgmade==1 & corner_three$team=="Team A",])))) / 
  nrow(corner_three[corner_three$team == "Team A",])
corner_three_efg_A

corner_three_efg_B <- (nrow(corner_three[corner_three$fgmade==1 & corner_three$team=="Team B",]) + 
                         (.5*(nrow(corner_three[corner_three$fgmade==1 & corner_three$team=="Team B",])))) / 
  nrow(corner_three[corner_three$team == "Team B",])
corner_three_efg_B











