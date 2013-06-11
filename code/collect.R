library("XML")
library("RCurl")

getPostInfo=function(theid)
{
   myfile=getURL(paste0("http://cos.name/cn/rss/topic/",theid))
   if(myfile=="")
   {
      return(0)
   }
   myfile=gsub("\\x00|\\x01|\\x02|\\x03|\\x04|\\x05|\\x06|\\x07|\\x08|\\x09|\\x0b|\\x0c|\\x0e|\\x0f|\\x10|\\x11|\\x12|\\x13|\\x14|\\x15|\\x16|\\x17|\\x18|\\x19|\\x1a|\\x1b|\\x1c|\\x1d|\\x1e|\\x1f|\\x7f","",myfile);
   
   doc=xmlParse(file=myfile)
   len=length(getNodeSet(doc, "//item/dc:creator"))
   for(i in ( 1:len ) )
   {
       Author=xmlValue(getNodeSet(doc, "//item/dc:creator")[[i]])
       pubDate=as.POSIXct(xmlValue(getNodeSet(doc, "//item/pubDate")[[i]]), format="%a, %d %b %Y %H:%M:%S ")
       write.table(data.frame(Author, ItemID=theid, IfPost=(i==len), pubDate), file="../cosdata.txt", row.names=FALSE, col.names=FALSE, append=TRUE)
   }
  rm(myfile)
  rm(doc)
  rm(len)
  gc(verbose=FALSE)
}

myindex = read.table("ids.txt")
mylen = length(myindex$V1)

for(j in 1:mylen )
{
   print(j)
   getPostInfo(myindex$V1[j])
}


