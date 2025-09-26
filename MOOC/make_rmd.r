generate_rmd_from_course <- function(input_file,
                                     output_file = sub("\\.R$", ".Rmd", input_file),
                                     title = NULL) {
  if (!file.exists(input_file)) stop("Fichier introuvable: ", input_file)
  lines <- readLines(input_file, warn = FALSE, encoding = "UTF-8")
  
  # --- Helpers ---------------------------------------------------------------
  is_section <- function(x) grepl("^##+[-]{2,}.*[-]{2,}\\s*$", x)
  clean_section_title <- function(x) {
    x <- sub("^##+\\s*", "", x)
    x <- gsub("^[-\\s]*|[-\\s]*$", "", x)
    x
  }
  trim <- function(x) sub("\\s+$", "", sub("^\\s+", "", x))
  # extract function names like foo(, bar.baz(
  extract_funcs <- function(x) {
    m <- gregexpr("\\b([A-Za-z.][A-Za-z0-9._]*)\\s*\\(", x, perl = TRUE)
    hits <- regmatches(x, m)[[1]]
    if (length(hits) == 0 || identical(hits, -1L)) return(character(0))
    unique(sub("\\s*\\($", "", hits))
  }
  # extract data$var patterns
  extract_vars <- function(x) {
    m <- gregexpr("\\b[A-Za-z.][A-Za-z0-9._]*\\$[A-Za-z0-9._]+", x, perl = TRUE)
    hits <- regmatches(x, m)[[1]]
    if (length(hits) == 0 || identical(hits, -1L)) return(character(0))
    unique(hits)
  }
  # Pretty label for first function as subheading
  titlecase <- function(x) {
    if (length(x) == 0) return("Exercice")
    t <- sub("_", " ", x[1], fixed = TRUE)
    t <- paste0(toupper(substr(t, 1, 1)), substr(t, 2, nchar(t)))
    t
  }
  
  # --- Split into sections ---------------------------------------------------
  sec_idx <- which(sapply(lines, is_section))
  if (length(sec_idx) == 0) {
    # Create a synthetic section if none provided
    sec_idx <- 1L
    lines <- c("##----SECTION----", lines)
  }
  sec_idx <- c(sec_idx, length(lines) + 1L)
  
  blocks <- list()
  for (i in seq_len(length(sec_idx) - 1L)) {
    head_line <- lines[sec_idx[i]]
    body <- lines[(sec_idx[i] + 1L):(sec_idx[i + 1L] - 1L)]
    # Split body into code and comments
    code_lines <- trim(body[!grepl("^\\s*#", body)])
    comment_lines <- trim(sub("^\\s*#\\s*", "", body[grepl("^\\s*#", body)]))
    # Keep only non-empty code lines
    code_lines <- code_lines[nzchar(code_lines)]
    # Build metadata
    funcs <- unique(unlist(lapply(code_lines, extract_funcs)))
    vars  <- unique(unlist(lapply(code_lines, extract_vars)))
    blocks[[length(blocks) + 1L]] <- list(
      section_title = clean_section_title(head_line),
      code = code_lines,
      comments = comment_lines,
      funcs = funcs,
      vars = vars
    )
  }
  
  # --- Build Rmd -------------------------------------------------------------
  if (is.null(title)) title <- paste0("Fiche d’exercices — ", basename(input_file))
  
  out <- c(
    "---",
    paste0('title: "', title, '"'),
    "output:",
    "  html_document:",
    "    toc: true",
    "params:",
    "  show_corrections: false",
    "---",
    ""
  )
  
  # Intro
  out <- c(out,
           "# Consignes",
           "",
           "- Complétez les blocs de code `# insérer le code`.",
           "- Répondez aux QROC sous chaque bloc.",
           "- Les **Corrections** sont masquées par défaut. Pour les afficher,",
           "  éditez l’entête YAML et passez `show_corrections: true`.",
           "",
           "---", "")
  
  # For each block, write exercise + conditional correction
  for (b in blocks) {
    # Section title
    out <- c(out,
             paste0("## ", b$section_title), "")
    
    # Subheading from first function
    subttl <- titlecase(b$funcs)
    out <- c(out, paste0("### ", subttl), "")
    
    # Exercise code chunk (blank)
    out <- c(out,
             "```{r, eval=FALSE}",
             "# insérer le code",
             "```",
             "")
    
    # QROC list
    qroc <- character(0)
    if (length(b$funcs)) {
      qroc <- c(qroc, paste0(b$funcs, " : utilité ?"))
    }
    if (length(b$vars)) {
      qroc <- c(qroc, paste0(b$vars, " : utilité ?"))
    }
    # If no funcs/vars detected, still add a generic prompt
    if (!length(qroc)) qroc <- "Expliquez l’objectif de ce code : utilité ?"
    
    out <- c(out, qroc, "", "----------------", "")
    
    # Correction (conditional on params)
    # We will inject original code and original comments.
    # Need to safely embed triple backticks via cat in a chunk.
    corr_code <- if (length(b$code)) paste(b$code, collapse = "\n") else ""
    corr_comments <- b$comments
    # Build the R chunk that prints the correction if params$show_corrections
    chunk <- c(
      "```{r, echo=FALSE, results='asis'}",
      "if (params$show_corrections) {",
      "  cat('\\n### Correction\\n\\n')",
      "  cat('```{r, eval=FALSE}\\n')",
      paste0("  cat(", paste0(shQuote(paste0(corr_code, "\n")), collapse = ", "), ")"),
      "  cat('```\\n\\n')"
    )
    if (length(corr_comments)) {
      # Print each comment as a bullet
      bullets <- paste0("  cat('- ", gsub("'", "’", corr_comments), "\\n')", collapse = "\n")
      chunk <- c(chunk, bullets)
    }
    chunk <- c(chunk, "  cat('\\n----------------\\n')", "}", "```", "")
    
    out <- c(out, chunk)
  }
  
  writeLines(out, con = output_file, useBytes = TRUE)
  message("Fichier généré : ", normalizePath(output_file, mustWork = FALSE))
  invisible(output_file)
}

generate_rmd_from_course(
  input_file = "~/Documents/R/M2 biostatistiques/S1C2 représentations graphiques.R"
)
