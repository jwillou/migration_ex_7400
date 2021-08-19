setwd("/Users/jannawilloughby/GDrive/ABMs/migration_ex_7400/")

#Simulate movement between two populations that have 100 individuals each. 
#Exactly one individual should move from 
#pop A to pop B and from pop B to pop A each generation for 50 generations. 

#set up pop A and B
popA=matrix(nrow=100, ncol=2) #born, now
popA[,1] = rep("A", 100)
popA[,2] = rep("A", 100)
colnames(popA) = c("born", "now")

popB=matrix(nrow=100, ncol=2) #born, now
popB[,1] = rep("B", 100)
popB[,2] = rep("B", 100)
colnames(popB) = c("born", "now")

migrate = 1
gens    = 50

for(g in 1:gens){
  toA = sample(1:nrow(popA), migrate, replace=F)
  migA = popA[toA, , drop=F]
  migA[1,2] = "B"
  popA = popA[-toA,]
  
  toB = sample(1:nrow(popB), migrate, replace=F)
  migB = popB[toB, , drop=F]
  migB[1,2] = "A"
  popB = popB[-toB,]
  
  popA = rbind(popA, migB)
  popB = rbind(popB, migA)
}



