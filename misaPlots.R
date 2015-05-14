library(dplyr)

cheese <- data_frame(cheese = rep(c("blue","cheddar","brie"),times=c(3,3,2)),
                     turned_right = c(.04,.4,.3,.2,.4,.4,.55,.6))


misa <-  data_frame(gender = rep(c("Female", "Male"), times = c(5945, 1474)),
                    age = rep(c(90, 72, 70, 58, 54, 48, 31, 28, 24, 22, 79, 72, 62, 31, 28, 26),
                              times = c(562, 586, 600, 595, 591, 604, 583,
                                        607, 605, 612, 248, 246, 240,
                                        245, 247, 248)),
                    speaker = rep(c("ABE14","ABE31","ABE18","ABE46","ABE12","ABE24","ABE33",
                                    "ABE37","ABE45","ABE52","ABE11","ABE15","ABE29","ABE25",
                                    "ABE41","ABE28"), times = c(562, 586, 600, 595, 591, 604, 583,
                                                                607, 605, 612, 248, 246, 240,
                                                                245, 247, 248)),
                    preasp = rep(c("y","n","y","n","y","n","y","n","y","n",
                                   "y","n","y","n","y","n","y","n","y","n",
                                   "y","n","y","n","y","n","y","n","y","n","y","n"),
                                 times = c(343, 219, 490, 96, 518, 82, 523, 72, 521, 70,
                                           550, 54, 505, 78, 184, 423, 584, 21, 591, 21,
                                           78, 170, 117,129, 145, 95, 177, 68, 225, 22, 
                                           202, 46)))

library(memisc)
misa$proppreasp <- memisc::recode(misa$preasp, "y" -> "100", "n" ->"0")

misaplot <- ggplot(misa, aes(age, preasp, color=gender,group=gender)) +
  geom_point(position=position_jitter(width=0.01,height=.02), alpha=.05) +
  stat_smooth(method="loess", span=.8) +
  theme_bw() +
  scale_x_reverse() + 
  scale_y_discrete(breaks=c("n","y"),
                   labels=c("0","1")) +
  labs(title = "Pre-aspiration in Aberystwyth English", y = "Proportion pre-aspirated", 
       x = "Age", color = "Gender")

pdf("/Users/betsysneller/Box Sync/Abstracts/2015/FWAV/misaplot.pdf", width=8, height=6)
print(misaplot)
dev.off()
