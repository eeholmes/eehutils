jekyll_md_document = function (toc = FALSE, toc_depth = 3, fig_width = 7, fig_height = 5, 
                                dev = "png", df_print = "default", includes = NULL, md_extensions = NULL, 
                                hard_line_breaks = TRUE, pandoc_args = NULL, html_preview = TRUE) 
{
  require(rmarkdown)
  pandoc_args <- c(pandoc_args, "--template", pandoc_path_arg(paste(system.file(package="eehutils"),"/rmarkdown/templates/jekyll_md_document/resources/default.md",sep="")))
  pandoc2 <- rmarkdown:::pandoc2.0()
  variant <- if (pandoc2) 
    "gfm"
  else "markdown_github"
  if (!hard_line_breaks) 
    variant <- paste0(variant, "-hard_line_breaks")
  variant <- paste0(variant, "-ascii_identifiers")
  format <- md_document(variant = variant, toc = toc, toc_depth = toc_depth, 
                        fig_width = fig_width, fig_height = fig_height, dev = dev, 
                        df_print = df_print, includes = includes, md_extensions = md_extensions, 
                        pandoc_args = pandoc_args)
  format$pandoc$from <- gsub("+ascii_identifiers", "", format$pandoc$from, 
                             fixed = TRUE)
  if (html_preview) {
    format$post_processor <- function(metadata, input_file, 
                                      output_file, clean, verbose) {
      css <- pandoc_path_arg(rmarkdown:::rmarkdown_system_file("rmarkdown/templates/github_document/resources/github.css"))
      args <- c("--standalone", "--self-contained", "--highlight-style", 
                "pygments", "--template", pandoc_path_arg(rmarkdown:::rmarkdown_system_file("rmarkdown/templates/github_document/resources/preview.html")), 
                "--variable", paste0("github-markdown-css:", 
                                     css), "--email-obfuscation", "none", if (pandoc2) c("--metadata", 
                                                                                         "pagetitle=PREVIEW"))
      preview_file <- rmarkdown:::file_with_ext(output_file, "html")
      pandoc_convert(input = output_file, to = "html", 
                     from = variant, output = preview_file, options = args, 
                     verbose = verbose)
      preview_dir <- Sys.getenv("RMARKDOWN_PREVIEW_DIR", 
                                unset = NA)
      if (!is.na(preview_dir)) {
        relocated_preview_file <- tempfile("preview-", 
                                           preview_dir, ".html")
        file.copy(preview_file, relocated_preview_file)
        file.remove(preview_file)
        preview_file <- relocated_preview_file
      }
      if (verbose) 
        message("\nPreview created: ", preview_file)
      output_file
    }
  }
  format
}