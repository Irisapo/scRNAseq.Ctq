install.packages("ggplot2") # for plot
install.packages("SingleCellExperiment") # for storing single-cell experiment data 
install.packages("tsne") # for doing Tsne (T-stochastic neighbor embedding) 
install.packages("irlba")


a <- read.RDS("data.rds") 
a  # Brief look at your data
class(a)  # data type 
str(a) # data structure

# For this specific toy data, I already have cell-cluster stored in it
cell_cluster <- colData(a)$celda_cell_cluster
# ^ I only have 3 cell clusters in total. Their cell cluster is then extracted and saved in the variable `cell_cluster`
table(cell_cluster) 

# get gene-by-cell count matrix
counts <- counts(a, "counts") 


# Now suppose I only have the gene-by-cell count matrix, I want to infer the cell cluster/type
## I would want to 'cluster' cells into distinct groups. 
## I also want to visualize them and see that the groups makes sense

## Since scRNA-seq is usually high-dimension, most methods first reduce dimensions using PCA (Principle component analysis) 
pca_res <- irlba::prcomp_irlba(counts, n =2) # RUN PCA 
str(pca_res) 





