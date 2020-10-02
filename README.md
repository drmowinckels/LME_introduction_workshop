
<!-- badges: start -->

[![R build
status](https://github.com/Athanasiamo/LME_introduction_workshop/workflows/R-CMD-check/badge.svg)](https://github.com/Athanasiamo/LME_introduction_workshop/actions)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

# Linear Mixed Models workshop

In this repo you should find the materials for my workshops in Linear
Mixed models.

The `dragons` data set is shamelessly stolen from [Gabriela Hajduk’s
introduction to
LME’s.](https://gkhajduk.github.io/2017-03-09-mixed-models/) Her
excellent tutorial is highly recommend, which I also have somewhat
adapted my own workshop.

## Workshop preparations

### Recommended setup

This workshop is a combination of presentation and live coding. If you
are attending it as a webinar, having a dual monitor set-up is
recommended. This would enable you to follow the live coding, by also
typing in the commands and experience the effects your self. Programming
is a skill where you learn best by doing.

### Install R

Make sure to have R installed on your computer. It is recommended that
you have a newer version of R installed, preferably higher than 4.0.0,
but at minimum higher than 3.5.3. Download R from [the
R-project](https://www.r-project.org/)

#### Windows computers

The tidyverse packages require
[rtools](https://cran.r-project.org/bin/windows/Rtools/) to be
installed. Make sure to have the required version installed before
proceeding.

### Install RStudio

The best experience with the workshop is to have an RStudio newer than
1.3. It is not necessary, but highly recommended.

[RStudio downloads
page](https://rstudio.com/products/rstudio/download/#download)

### Required packages

The course will use four packages, so please have these installed prior
to the course beginning.

``` r
install.packages(c("lme4", "tidyverse", "broom", "broom.mixed"))
```

If you are struggling to install the package, please create [a
ticket](https://github.com/Athanasiamo/LME_introduction_workshop/issues)
pasting the command and output you get so I can help you get it sorted.

## Slides

All slides for the workshop can be found at:
<https://athanasiamo.github.io/LME_introduction_workshop/>

## Code of Conduct

Please note that the LME\_introduction\_workshop project is released
with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
