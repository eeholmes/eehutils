rtojekyll=function(filename){
  require("knitr")
  require("here")

# Check that it's a .Rmd file.
if(!grepl(".Rmd", filename)) {
  stop("You must specify a .Rmd file.")
}

# Knit and place in _posts.
output = paste0(here("_posts"),"/", sub('.Rmd', '.md', filename))
knit(filename, output)

# Copy .png files to the images directory.
fromdir = "http://tinyheero.github.io/assets"
todir = "../assets"

pics = list.files(fromdir, ".png")
pics = sapply(pics, function(x) paste(fromdir, x, sep="/"))
file.copy(pics, todir)

unlink("http://tinyheero.github.io", recursive = TRUE)
}
