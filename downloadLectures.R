#
# download lectures, requires curl package
#

downloadLectures<- function(fileList,courseName="rProgramming_wk4") {
        # configure set download method for windows vs. Mac / Linux
        dlMethod <- "curl"
        if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
        for (i in 1:length(fileList)) {
                outFile <- paste(courseName,"_lecture_",sprintf("%03d.mp4",i),sep="")
                if(!file.exists(outFile)){
                        download.file(fileList[i],destfile=outFile,method=dlMethod,mode="wb")
                }
                
        }
}

#
# run downloadLectures() for video to install R on a Mac
#
theFiles <- c(
        "https://d18ky98rnyall9.cloudfront.net/Simulation%20%28part%201%29%20%5B7%3A47%5D.861cbb507baf11e381dcd7c382aa3b03/full/540p/index.mp4?Expires=1505606400&Signature=C7Z9m7JCpM14tyiraZnOLd2ETcDMPCvQWYkav4goY-Je3IwmjoX0O8XY~tNexqfGYVmlPe9Gx51ELANZPNthBfmxldOHJdDO0PkN8aTr~FQXyV0fGaI9kn-zm2BiiRHVlC9FlwnxVr5ThXi1JlFfeFQgRRAw40vCiU8xsD-evYg_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A",
        "https://d18ky98rnyall9.cloudfront.net/n4SeMrMdEeWzcxKZFP5xpQ.processed/full/540p/index.mp4?Expires=1505606400&Signature=H8SwZmtJ~ZjmZ49Jg6~KMt3EIBDHeFXmz2joYm3PffX6V6UtmKmV3UjOYIBRfUBpmsC3GLhqUm~FmplnInjplltWSqyonbl-3vhCBtNJw-K-RHvouoKln38Lm54D1J14vIXqIPJDhmLq6bP-OhBuM88r5g8KFBsEhij8mVe8kgU_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A",
        "https://d18ky98rnyall9.cloudfront.net/n4xmBLMdEeWhDQqBYtXuiQ.processed/full/540p/index.mp4?Expires=1505606400&Signature=USqk1i7M~RQdlbXM~hgAGEFxM2sao8XgzWgc0BBbGkWbGV9~ZT5XZnA6WjAI6KFOdFTmEI2dNYkuJNP0mh96uo7v9vH3MGz6PZmk1pDbEsNyVWkCmAuPVZ7VFphVJ8VYjK3aa2~Y-mgfhs6xIqamFXQi7c9JB171Xe8y2WWyClI_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A",
        "https://d18ky98rnyall9.cloudfront.net/R%20Profiler%20%28part%201%29%20%5B10%3A39%5D.37b3f2807baf11e381dcd7c382aa3b03/full/540p/index.mp4?Expires=1505606400&Signature=hUdxO3QeW3ghzsATkEBbmIu8K61K3y7Rn~GF-y7JMAOy4QYMokRE~CrvFyIzjrqsbOXNVtv4sWASX0QZtw2D3NIyn4F0iGiCFsnT5D~8-BXKQrG9sPWxL07gBt3fDMgt1DllNZ0XojOBgT~UjjP2EQBpDats58jIyr~RauU91iI_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A",
        "https://d18ky98rnyall9.cloudfront.net/R%20Profiler%20%28part%202%29%20%5B10%3A26%5D.8099e7707baf11e381dcd7c382aa3b03/full/540p/index.mp4?Expires=1505606400&Signature=cfBW3-B1r3RyUvFmNU5l-Tma5OtSNTxeEZ2-hYTa7PwdywjvcLuzgZujJ4BXmiASccsoSz7Lf6MwbMmOyr1zWp5isi0nKt4j-K8Zp0IwTXH71i9WzlULX34xo3VTvh~wf6~yqfpV4QQu4BUVLjoRWqmqZNShPRwVZYpOn7-qGAM_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A"
)
downloadLectures(theFiles,courseName="rProgramming_wk4_")