library("knitr")
library("ggplot2")

mydata = read.csv("../cosdata-mysql.csv")
#today = as.Date(format(Sys.time(),"%Y-%m-%d"))
today = max(as.Date(mydata$post_time))
mysub = subset(mydata, as.Date(post_time)>today-30)
rm(mydata)
myposts = length(mysub$poster_id)
mytable = table(as.character(mysub$poster_id))
mypersons = length(mytable)
mytop = head(sort(mytable, decreasing=TRUE), n=20L)
mytopposts = sum(mytop)
myratio = mytopposts*100/myposts
myreplies = table(mysub$is_topic_poster)

tmp=table(mysub$poster_id, mysub$is_topic_poster)
replies=tmp[,1]
topics=tmp[,2]
ids=names(tmp[,1])
mysummary=data.frame(replies, topics, ids)


knit("README.Rmd", output="../README.md")

warning()
