\name{stri_stats_latex}
\alias{stri_stats_latex}
\title{Statistics for a Character Vector Containing LaTeX Commands}
\usage{
stri_stats_latex(str)
}
\arguments{
  \item{str}{character vector to be aggregated}
}
\value{
Returns an integer vector with the following named
elements: \enumerate{ \item \code{CharsWord} - number of
word characters; \item \code{CharsCmdEnvir} - command and
words characters; \item \code{CharsWhite} - LaTeX white
spaces, including \{ and \} in some contexts; \item
\code{Words} - number of words; \item \code{Cmds} - number
of commands; \item \code{Envirs} - number of environments;
\item ... (Other stuff that may appear in future releases
of \pkg{stringi}). }
}
\description{
This function gives LaTeX-oriented statistics for a
character vector, e.g. obtained by loading a text file with
the \code{\link{readLines}} function, where each text line
is represented by a separate string.
}
\details{
We use a slightly modified LaTeX Word Count algorithm taken
from Kile 2.1.3, see
\url{http://kile.sourceforge.net/team.php} for original
contributors.
}
\examples{
s <- c("Lorem \\\\textbf{ipsum} dolor sit \\\\textit{amet}, consectetur adipisicing elit.",
       "\\\\begin{small}Proin nibh augue,\\\\end{small} suscipit a, scelerisque sed, lacinia in, mi.",
       "")
stri_stats_latex(s)
\dontrun{
# Stats for the preprint version of M. Gagolewski's book
# "Programowanie w jezyku R", Wydawnictwo Naukowe PWN, 2014.
# see http://rksiazka.rexamine.com
apply(
   sapply(
      lapply(
         list.files(path="~/Publikacje/ProgramowanieR/rozdzialy/",
            pattern="*.tex$", recursive=TRUE, full.names=TRUE),
         readLines),
      stri_stats_latex),
   1, sum)

CharsWord CharsCmdEnvir    CharsWhite         Words          Cmds        Envirs
   718755        458403        281989        120202         37055          6119
}
}
\seealso{
Other stats: \code{\link{stri_stats_general}}
}

