# Cos.Name 定期统计
--------------------------------

* 最近30天（2013-06-11至2013-05-12）论坛上共有340人参与讨论，共发表了1479篇文字（其中大概包括345篇主题和1134篇回复）。


* 其中发帖最多的20人及发帖数是：



```
## 
## superdesolator         lyxmoo           肖楠    ywh19860616    zggjtsgzczh 
##             92             70             43             38             33 
##         ypchen         谢益辉     PuddingNnn         helend     danbaidong 
##             31             30             25             22             17 
## shenzhiyoushou         刘思喆    warrenzhang      cloud wei      sonicworm 
##             17             17             16             15             15 
##      suckbunny        zjgslxh    bpdszxpddks        lyyl213        oicuicu 
##             15             15             14             14             14
```


* 他们所发表的帖子数目是553篇，占了总数的37%的比重。

* 文件 [cosdata.txt] (https://github.com/JiangXD/cos_stat/blob/master/cosdata.txt) 含所有自论坛创建以来的数据，并保持随时更新。大家可以进一步统计。

* 文件 cosdata-mysql.csv 是直接从论坛数据库导出的文件，格式与 cosdata.txt 相同，为保护隐私第一列换成了论坛UID。但是，你懂的。

* 数据第一列为用户ID，第二列表示是否是楼主（即是新帖或是回复），第三列是发表时间。

* 统计采用knitr包驱动更新，感谢益辉。

