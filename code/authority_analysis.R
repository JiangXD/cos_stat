library("knitr")

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

knit("README.Rmd", output="../README.md")
warnings()


