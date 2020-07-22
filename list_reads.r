# copyright (c) 2019 Mitsuhiko Sato. All Rights Reserved.
# Mitsuhiko Sato ( E-mail: mitsuhikoevolution@gmail.com )

if(!"ggplot2" %in% rownames(installed.packages())){
             install.packages("ggplot2",repos="https://cran.ism.ac.jp/")
}
if(!"tidyr" %in% rownames(installed.packages())){
             install.packages("tidyr",repos="https://cran.ism.ac.jp/")
}

library(ggplot2)
library(tidyr)


arg1 = commandArgs(trailingOnly=TRUE)[1]
arg2 = commandArgs(trailingOnly=TRUE)[2]

d=read.table(paste(arg1,".txt",sep=""),header=T)
dt = tidyr::gather(d,dir, reads,-sample)


g=ggplot2::ggplot(dt, aes(x=reorder(sample,reads), y=reads, color=dir) )
g=g+theme_bw()+theme(panel.background = element_rect(fill = "transparent",color = NA),plot.background = element_rect(fill = "transparent",color = NA),axis.text.x = element_text(angle=90,hjust=0, vjust=0.5))
#if you want to aligne x axis aline by right, hjust=1

g=g+ggplot2::geom_point()
g=g+ggplot2::geom_hline(yintercept=10000, color="red")
g=g+ggplot2::xlab("Sample")+ggplot2::ylab("The number of reads")


ggsave(file=paste(arg1,".pdf",sep=""), plot=g, height=as.numeric(arg2),width=as.numeric(arg2))
