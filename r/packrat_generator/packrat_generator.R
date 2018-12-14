#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
packages = args[1]
output = args[2]

packages <- as.character(read.delim(packages, header=FALSE)$V1) #, header=F, row.names=1)
print(packages)
print(typeof(packages))

library(packrat)
packrat::init(output)

if (!requireNamespace("BiocManager"))
    install.packages("BiocManager")
BiocManager::install()
BiocManager::install(packages)

