% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mgidi.R
\name{mgidi}
\alias{mgidi}
\title{Genotype-Ideotype Distance Index}
\usage{
mgidi(
  .data,
  SI = 15,
  mineval = 1,
  ideotype = NULL,
  use = "complete.obs",
  verbose = TRUE
)
}
\arguments{
\item{.data}{An object fitted with the function \code{\link{gafem}()},
\code{\link{gamem}()} or a two-way table with BLUPs for genotypes in each
trait (genotypes in rows and traits in columns). In the last case, row
names must contain the genotypes names.}

\item{SI}{An integer (0-100). The selection intensity in percentage of the
total number of genotypes.}

\item{mineval}{The minimum value so that an eigenvector is retained in the
factor analysis.}

\item{ideotype}{A vector of length \code{nvar} where \code{nvar} is the
number of variables used to plan the ideotype. Use \code{'h'} to indicate
the traits in which higher values are desired or \code{'l'} to indicate the
variables in which lower values are desired. For example, \code{ideotype =
  c("h, h, h, h, l")} will consider that the ideotype has higher values for
the first four traits and lower values for the last trait. If \code{.data}
is a model fitted with the functions \code{\link{gafem}()} or
\code{\link{gamem}()}, the order of the traits will be the declared in the
argument \code{resp} in those functions.}

\item{use}{The method for computing covariances in the presence of missing
values. Defaults to \code{complete.obs}, i.e., missing values are handled
by casewise deletion.}

\item{verbose}{If \code{verbose = TRUE} (Default) then some results are
shown in the console.}
}
\value{
An object of class \code{mgidi} with the following items:
\itemize{
\item \strong{data} The data used to compute the factor analysis.
\item \strong{cormat} The correlation matrix among the environments.
\item \strong{PCA} The eigenvalues and explained variance.
\item \strong{FA} The factor analysis.
\item \strong{KMO} The result for the Kaiser-Meyer-Olkin test.
\item \strong{MSA} The measure of sampling adequacy for individual variable.
\item \strong{communalities} The communalities.
\item \strong{communalities_mean} The communalities' mean.
\item \strong{initial_loadings} The initial loadings.
\item \strong{finish_loadings} The final loadings after varimax rotation.
\item \strong{canonical_loadings} The canonical loadings.
\item \strong{scores_gen} The scores for genotypes in all retained factors.
\item \strong{scores_ide} The scores for the ideotype in all retained factors.
\item \strong{gen_ide} The distance between the scores of each genotype with the
ideotype.|
\item \strong{MGIDI} The multi-trait genotype-ideotype distance index.
\item \strong{contri_fac} The relative contribution of each factor on the MGIDI
value.
The lower the contribution of a factor, the close of the ideotype the
variables in such factor are.
\item \strong{sel_dif} The selection differential for the variables.
\item \strong{total_gain} The selection differential for the variables.
\item \strong{sel_gen} The selected genotypes.
}
}
\description{
Computes the multi-trait genotype-ideotype distance index (MGIDI). MGIDI can
be seen as the multi-trait stability index (Olivoto et al., 2019) computed
with weight for mean performance equals to 100. The MGIDI indes is computed
as follows:
\loadmathjax
\mjsdeqn{MGIDI_i = \sqrt{\sum\limits_{j = 1}^f(F_{ij} - {F_j})^2}}

where \mjseqn{MGIDI_i} is the multi-trait genotype-ideotype distance index
for the \emph{i}th genotype; \mjseqn{F_{ij}} is the score of the \emph{i}th
genotype in the \emph{j}th factor (\emph{i = 1, 2, ..., g; j = 1, 2, ...,
f}), being \emph{g} and \emph{f} the number of genotypes and factors,
respectively, and \mjseqn{F_j} is the \emph{j}th score of the ideotype. The
genotype with the lowest MGIDI is then closer to the ideotype and therefore
presents desired values for all the analyzed traits.
}
\examples{
\donttest{
library(metan)

model <- gamem(data_g,
               gen = GEN,
               rep = REP,
               resp = c(NR, KW, CW, CL, NKE, TKW, PERK, PH))

# Selection for increase all variables
mgidi_model <- mgidi(model)



# plot the contribution of each factor on the MGIDI index
plot(mgidi_model, type = "contribution")

}
}
\references{
Olivoto, T., A.D.C. L{\'{u}}cio, J.A.G. da silva, B.G. Sari, and
M.I. Diel. 2019. Mean performance and stability in multi-environment trials
II: Selection based on multiple traits. Agron. J. 111:2961-2969.
\href{https://acsess.onlinelibrary.wiley.com/doi/full/10.2134/agronj2019.03.0221}{doi:10.2134/agronj2019.03.0220}
}
\author{
Tiago Olivoto \email{tiagoolivoto@gmail.com}
}
