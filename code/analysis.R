library("knitr")

mydata = read.table("../cosdata.txt")
today = as.Date(format(Sys.time(),"%Y-%m-%d"))
mysub = subset(mydata, as.Date(V4)>today-30)
rm(mydata)
myposts = length(mysub$V1)
mytable = table(as.character(mysub$V1))
mypersons = length(mytable)
mytop = head(sort(mytable, decreasing=TRUE), n=20L)
mytopposts = sum(mytop)
myratio = mytopposts*100/myposts
myreplies = table(mysub$V3)

knit("README.Rmd", output="../README.md")
warnings()


