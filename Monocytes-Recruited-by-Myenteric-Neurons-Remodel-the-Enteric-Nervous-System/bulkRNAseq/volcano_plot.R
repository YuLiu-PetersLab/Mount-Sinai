# code to generate volcano plots

library(EnhancedVolcano)

res <- read.csv("limma_Subset4_C_neg_L_neg_M_pos_vs_water0.csv", header=T)
selected1 <- read.table("MM4_vs_Water0_gene_Oct.txt", header=T, sep="\t")
selected2 <- selected1$MM4_vs_MM0
pdf("MM4_vs_Water0_pval_E-3_Oct_a.pdf" )
EnhancedVolcano(res,lab = res$Description, x = 'logFC', y = 'adj.P.Val', title = 'MM4 vs water0', subtitle = 'pval cutoff: 1E-3; logFC cutoff: 1.5', legendPosition = 'bottom', pointSize = 1, border = 'full', gridlines.major = TRUE, pCutoff=0.001, FCcutoff=1.5, labSize = 3, selectLab = selected2 ) + scale_y_sqrt(breaks = seq(0, 250, by = 40) )
dev.off()

