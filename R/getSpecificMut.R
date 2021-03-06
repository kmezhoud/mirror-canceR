getSpecificMut <- function(){
    
    
    tclRequire("BWidget")
    tclRequire("Tktable")
    
    
        testCheckedCaseGenProf()
    
    
        
        Lchecked_Studies <- myGlobalEnv$lchecked_Studies_forCases
        Lchecked_Cases <- length(myGlobalEnv$curselectCases)
        Lchecked_GenProf <- length(myGlobalEnv$curselectGenProfs)
        ###########################################################
        MutData=0
        MutData_All <-NULL
        MutDataSub<-0
        MutDataSub_All <- NULL
        
        for(c in 1:Lchecked_Cases){
            
            GenProf<-myGlobalEnv$GenProfsRefStudies[myGlobalEnv$curselectGenProfs[c]]
            Case<- myGlobalEnv$CasesRefStudies[myGlobalEnv$curselectCases[c]]
            MutData <- getMutationData(myGlobalEnv$cgds,Case, GenProf, myGlobalEnv$GeneList)
            
            if(length(MutData[,1])==0){
                msgNoMutData=paste("No Mutation Data are Available for\n", myGlobalEnv$CasesStudies[myGlobalEnv$curselectCases[c]+1])
                tkmessageBox(message=msgNoMutData, title= paste(myGlobalEnv$StudyRefCase[c],myGlobalEnv$CasesStudies[myGlobalEnv$curselectCases[c]+1], myGlobalEnv$GenProfsStudies[myGlobalEnv$curselectCases[c]+1], sep=": "))
                
                
            } else{
                
                dialogSpecificMut(MutData, c)
                
                
                
            }
            
        }
    
}