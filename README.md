
# cynthtools

<!-- badges: start -->
<!-- badges: end -->

`cynthtools` is a personal package for Cynthia A Huang, inspired by Robert M Flight's [`flighttools`](https://github.com/rmflight/flighttools/tree/main). For now, it mostly contains templates and helpers for setting up markdown documents and quarto projects. Some code and roxygen documentation is generated with assistance from GitHub co-pilot.

## Installation

You can install the development version of cynthtools from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cynthiahqy/cynthtools")
```

## Quarto Templates

The `new_*()` family of functions are all thin wrappers around `usethis::use_template()`, with templates stored in `inst/templates`.

```r
cynthtools::new_blog_post()
```
