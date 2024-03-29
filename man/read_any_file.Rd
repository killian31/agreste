% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_any_file.R
\name{read_any_file}
\alias{read_any_file}
\title{Lit un fichier}
\usage{
read_any_file(
  filename,
  header = TRUE,
  sep = ",",
  decimal_mark = ".",
  sheet = 1
)
}
\arguments{
\item{filename}{CHAR le nom du fichier, extension incluse}
}
\value{
A dataframe
}
\description{
Prend en charge les fichiers csv, xlsx, rds
}
\examples{

\dontrun{
library(agreste)
write.csv(iris, "iris.csv", row.names = FALSE, sep = ",")
df <- read_any_file(filename = "iris.csv", header = TRUE, sep = ",", decimal_mark = ".")
#'}
}
