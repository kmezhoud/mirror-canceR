getGCTCLSExample <- function(){
    #require(tcltk)
    
    ifrm <- function(obj, env = myGlobalEnv()) {
        obj <- deparse(substitute(obj))
        if(exists(obj, envir = env)) {
            rm(list = obj, envir = env)
        }
    }
    ifrm(fname.GCT, myGlobalEnv)
    ifrm(fname.CLS,myGlobalEnv)
    
    myGlobalEnv$fname.GCT <- paste(path.package("canceR"),"/extdata/gct_cls/", "Lung_Bost_collapsed_symbols_common_Mich_Bost.gct",sep="")
    myGlobalEnv$fname.CLS <- paste(path.package("canceR"),"/extdata/gct_cls/", "Lung_Boston.cls",sep="")
    
    
    
    tkinsert(myGlobalEnv$tlGCT,"end",myGlobalEnv$fname.GCT)
    tkinsert(myGlobalEnv$tlCLS,"end",myGlobalEnv$fname.CLS)
    tkfocus(myGlobalEnv$ttDialogGSEA)
    
}