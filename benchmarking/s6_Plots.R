PCR <- read.csv('metrics/PCR.csv')
SCC <- read.csv('metrics/SCC.csv')
MI <- read.csv('metrics/MI.csv')
GENIE3 <- read.csv('metrics/GENIE3.csv')
SC_PCR <- read.csv('metrics/SUPERCELL_PCR.csv')
SC_PC <- read.csv('metrics/SUPERCELL_PC.csv')


PCR <- PCR[PCR$q == 0,]
SCC <- SCC[SCC$q == 0,]
MI <- MI[MI$q == 0,]
GENIE3 <- GENIE3[GENIE3$q == 0,]
SC_PCR <- SC_PCR[SC_PCR$q == 0,]
SC_PC <- SC_PC[SC_PC$q == 0,]

library(RColorBrewer)
pColors <- RColorBrewer::brewer.pal(6,'Dark2')
#par(xpd = T, mar = par()$mar + c(0,0,0,1))

png('figures/ACC.png', width = 900, height = 900, res = 300, pointsize = 10)
#layout(matrix(c(1,1,1,1,2,2,2,2,2), 1, 9, byrow = TRUE))
par(mar=c(3.5,3.5,1,1), mgp=c(2.4,0.5,0), las = 1)
plot(PCR$nCells, PCR$acc, ylim=c(0.5,0.85), type='b', col = pColors[1],
     ylab = '', xlab = '', pch = 15,)
mtext('Number of Cells', side = 1, line = 1.6)
mtext('Accuracy', side = 2, line = 2.5, las = 3)
arrows(x0 = PCR$nCells, x1 = PCR$nCells, y0 = PCR$accLB, y1 = PCR$accUB,
       length = 0.03, code = 3, angle = 90, col = pColors[1])
points(SCC$nCells, SCC$acc, col = pColors[2], type='b', pch = 16)
arrows(x0 = SCC$nCells, x1 = SCC$nCells, y0 = SCC$accLB, y1 = SCC$accUB,
       length = 0.03, code = 3, angle = 90, col = pColors[2])
points(MI$nCells, MI$acc, col = pColors[3], type='b', pch = 17)
arrows(x0 = MI$nCells, x1 = MI$nCells, y0 = MI$accLB, y1 = MI$accUB,
       length = 0.03, code = 3, angle = 90, col = pColors[3])
points(GENIE3$nCells, GENIE3$acc, col = pColors[4], type='b', pch = 18)
arrows(x0 = GENIE3$nCells, x1 = GENIE3$nCells, y0 = GENIE3$accLB, y1 = GENIE3$accUB,
       length = 0.03, code = 3, angle = 90, col = pColors[4])
points(SC_PCR$nCells, SC_PCR$acc, ylim=c(0.5,0.8), type='b', col = pColors[5],
     ylab = '', xlab = '', pch = 15,)
arrows(x0 = SC_PCR$nCells, x1 = SC_PCR$nCells, y0 = SC_PCR$accLB, y1 = SC_PCR$accUB,
       length = 0.03, code = 3, angle = 90, col = pColors[5])
points(SC_PC$nCells, SC_PC$acc, ylim=c(0.5,0.8), type='b', col = pColors[6],
       ylab = '', xlab = '', pch = 15,)
arrows(x0 = SC_PC$nCells, x1 = SC_PC$nCells, y0 = SC_PC$accLB, y1 = SC_PC$accUB,
       length = 0.03, code = 3, angle = 90, col = pColors[6])

legend('bottomright', legend = c('PCR','SCC', 'MI', 'GENIE3', 'SC+PCR' , 'SC+PC'), bty = 'n',
       cex = 0.7, ncol = 2, pch = 15:18, col = pColors)
dev.off()

png('figures/REC.png', width = 900, height = 900, res = 300, pointsize = 10)
#layout(matrix(c(1,1,1,1,2,2,2,2,2), 1, 9, byrow = TRUE))
par(mar=c(3.5,3.5,1,1), mgp=c(2.4,0.5,0), las = 1)
plot(PCR$nCells, PCR$recall, ylim=c(0.15,1), type='b', col = pColors[1],
     ylab = '', xlab = '', pch = 15)
mtext('Number of Cells', side = 1, line = 1.6)
mtext('Recall', side = 2, line = 2.5, las = 3)
arrows(x0 = PCR$nCells, x1 = PCR$nCells, y0 = PCR$recallLB, y1 = PCR$recallUB,
       length = 0.03, code = 3, angle = 90, col = pColors[1])
points(SCC$nCells, SCC$recall, col = pColors[2], type='b', pch = 16)
arrows(x0 = SCC$nCells, x1 = SCC$nCells, y0 = SCC$recallLB, y1 = SCC$recallUB,
       length = 0.03, code = 3, angle = 90, col = pColors[2])
points(MI$nCells, MI$recall, col = pColors[3], type='b', pch = 17)
arrows(x0 = MI$nCells, x1 = MI$nCells, y0 = MI$recallLB, y1 = MI$recallUB,
       length = 0.03, code = 3, angle = 90, col = pColors[3])
points(GENIE3$nCells, GENIE3$recall, col = pColors[4], type='b', pch = 18)
arrows(x0 = GENIE3$nCells, x1 = GENIE3$nCells, y0 = GENIE3$recallLB, y1 = GENIE3$recallUB,
       length = 0.03, code = 3, angle = 90, col = pColors[4])
points(SC_PCR$nCells, SC_PCR$recall, ylim=c(0.15,1), type='b', col = pColors[5],
     ylab = '', xlab = '', pch = 15)
arrows(x0 = SC_PCR$nCells, x1 = SC_PCR$nCells, y0 = SC_PCR$recallLB, y1 = SC_PCR$recallUB,
       length = 0.03, code = 3, angle = 90, col = pColors[5])
points(SC_PC$nCells, SC_PC$recall, ylim=c(0.15,1), type='b', col = pColors[6],
       ylab = '', xlab = '', pch = 15)
arrows(x0 = SC_PC$nCells, x1 = SC_PC$nCells, y0 = SC_PC$recallLB, y1 = SC_PC$recallUB,
       length = 0.03, code = 3, angle = 90, col = pColors[6])
legend('bottomright', legend = c('PCR','SCC', 'MI', 'GENIE3', 'SC+PCR', 'SC+PC'), bty = 'n',
       cex = 0.7, ncol = 2, pch = 15:18, col = pColors)
dev.off()


PCR <- read.csv('metrics/PCR.csv')
SCC <- read.csv('metrics/SCC.csv')
MI <- read.csv('metrics/MI.csv')
GENIE3 <- read.csv('metrics/GENIE3.csv')

png('figures/PR.png', width = 900*2,height = 900*2, res = 300)
layout(matrix(c(1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2,
                1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2,
                1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
                3,3,3,3,4,4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,4,4,4,4,
                3,3,3,3,4,4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,4,4,4,4,
                3,3,3,3,4,4,4,4,5,5,5,5,5,5,5,5), 17, 8, byrow = TRUE))
par(mar=c(3,3,2,1), mgp=c(1.8,0.5,0))
pColors <- RColorBrewer::brewer.pal(7,'Dark2')
nCells <- unique(PCR$nCells)
tPCR <- PCR[PCR$nCells == nCells[1],]
plot(tPCR$recall,tPCR$acc, ylim=c(0.5,1), xlim = c(0,1), col=pColors[1], type = 'b',
     xlab = 'Recall', ylab = 'Accuracy', pch=15, main = 'PCR')

for(X in seq_along(nCells)[-1]){
  tPCR <- PCR[PCR$nCells == nCells[X],]
  points(tPCR$recall,tPCR$acc, ylim=c(0,1), col=pColors[X], type = 'b', pch=(15+(X-1)))
}
# legend('bottomright', legend = paste0(nCells, ' Cells'), bty = 'n',
#        cex = 0.8, pch=15:22, col=pColors)

tSCC <- SCC[SCC$nCells == nCells[1],]
plot(tSCC$recall,tSCC$acc, ylim=c(0.5,1), xlim = c(0,1), col=pColors[1], type = 'b',
     xlab = 'Recall', ylab = 'Accuracy', pch=15, main = 'SCC')

for(X in seq_along(nCells)[-1]){
  tSCC <- SCC[SCC$nCells == nCells[X],]
  points(tSCC$recall,tSCC$acc, ylim=c(0,1), col=pColors[X], type = 'b', pch=(15+(X-1)))
}
# legend('topright', legend = paste0(nCells, ' Cells'), bty = 'n',
#        cex = 0.8, pch=15:22, col=pColors)

tMI <- MI[MI$nCells == nCells[1],]
plot(tMI$recall,tMI$acc, ylim=c(0.5,1), xlim = c(0,1), col=pColors[1], type = 'b',
     xlab = 'Recall', ylab = 'Accuracy', pch=15, main = 'MI')

for(X in seq_along(nCells)[-1]){
  tMI <- MI[MI$nCells == nCells[X],]
  points(tMI$recall,tMI$acc, ylim=c(0,1), col=pColors[X], type = 'b', pch=(15+(X-1)))
}
#legend('topright', legend = paste0(nCells, ' Cells'), bty = 'n',
#       cex = 0.8, pch=15:22, col=pColors)

tGENIE3 <- GENIE3[GENIE3$nCells == nCells[1],]
plot(tGENIE3$recall,tGENIE3$acc, ylim=c(0.5,1), xlim = c(0,1), col=pColors[1], type = 'b',
     xlab = 'Recall', ylab = 'Accuracy', pch=15, main = 'GENIE3')

for(X in seq_along(nCells)[-1]){
  tGENIE3 <- GENIE3[GENIE3$nCells == nCells[X],]
  points(tGENIE3$recall,tGENIE3$acc, ylim=c(0,1), col=pColors[X], type = 'b', pch=(15+(X-1)))
}
par(mar=c(0,0,0,0), mgp=c(0,0,0))
plot(1, type = "n", axes=FALSE, xlab="", ylab="")
legend('top', legend = paste0(nCells, ' Cells'), bty = 'n',
       cex = 1, pch=15:22, col=pColors, ncol = 7)
dev.off()

