file_qmd <- "/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/devoir_stats_avancees.qmd"

lines <- readLines(file_qmd)

# trouver les débuts de chunks R
starts <- grep("^```\\{r", lines)
# trouver les fins de chunks
ends   <- grep("^```\\s*$", lines)

if (length(starts) != length(ends)) {
  stop("Extraction des chunks R impossible : démarcations incohérentes")
}

code_r <- character(0)

for (i in seq_along(starts)) {
  # lignes à l’intérieur du chunk (excluant les balises de début et fin)
  chunk_lines <- lines[(starts[i] + 1):(ends[i] - 1)]
  # filtrer : garder seulement les lignes qui **ne sont pas des options Quarto**
  real_code <- chunk_lines[!grepl("^\\s*#\\|", chunk_lines)]
  # ajouter au vecteur final
  code_r <- c(code_r, real_code, "")
}

outfile <- "/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/all_chunks_code.R"
cat(code_r, file = outfile, sep = "\n")

system(
  "quarto render /Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/devoir_stats_avancees.qmd --to pdf"
)



system(
  "quarto render ~/Documents/Projets/M2biostatistiques/devoir_stats_avancees/devoir_stats_avancees.qmd --to pdf"
)