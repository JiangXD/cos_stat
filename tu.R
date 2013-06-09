library(scales)
library(grid)
library(ggplot2)
library(XML)

me=read.table("cosdata.txt")
png("tmp.png", height=800, width=800)

ggplot(me)+geom_point(aes(x=as.Date(V4), y=as.POSIXlt(V5, format="%H:%M:%S")+3600*8, color=as.factor((ifelse(V1=="谢益辉",1,(ifelse(V1=="lucky",2,(ifelse(V1=="colinisstudent",3,ifelse(V1=="liutyy",4,5))))))))), alpha=0.3, size=1)+scale_colour_manual(name=" ",labels=c("谢益辉","lucky","colinisstudent","liutyy","其他人"), values=c("red","blue","darkgreen","orange","grey"))+theme_minimal()+scale_y_datetime(labels=date_format("%H:00"), breaks=date_breaks("1 hours"))+labs(x=" ",y=" ")+theme(legend.text=element_text(size=rel(1.4)), legend.key.size=unit(1.5, "cm"), legend.position=c(0.9,0.8))

dev.off()
system("feh tmp.png");
warnings()
