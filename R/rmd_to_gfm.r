#' Rmd to GitHub flavored markdown for Jekyll Website
#'
#' Runs and Rmd file through knit.  Uses here, so you can run from 
#' anyplace in your project.  You don't need to worry about setting the 
#' working directory.  Will put the files in the right places.
#'
#' @param filename  Name of Rmd file
#' @param pdf TRUE/FALSE  Do you want a pdf made?  If TRUE, make sure to add info to the yaml of Rmd
#'
#' @return None
#'
#' @examples
#' rmd_to_gfm("2016-5-19-FI-recursion-2.Rmd")
rmd_to_gfm = function(filename, pdf=FALSE){
  require(here)
inFile = paste0(here("posts","Rmd"),"/",filename)
outFile = paste0(here("_posts"),"/",sub("Rmd","md",filename))
figDir = paste0(here("posts","figures"),"/",sub("[.]Rmd","",filename),"/")
opts_chunk$set(fig.path=figDir)
knit(inFile, output=outFile)
opts_chunk$set(fig.path="figure/")
pdfDir = here("posts","pdfs")
outFile = paste0(sub("Rmd","pdf",filename))
if(pdf) render(inFile, output_file=outFile, output_format="pdf_document", output_dir=pdfDir, clean=TRUE)
}
