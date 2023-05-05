# 🏛️ ArchiData

ArchiData is an R package for the analysis of architectural data. It provides a suite of functions for analyzing and visualizing various aspects of architectural design, such as building dimensions, room layouts, and facade features.

> **Warning**: This is a new package I'm developing; don't expect it to work (for now at least).

## Installation

You can install ArchiData from GitHub using the `devtools` package:

``` r
devtools::install_github("RodGal-2020/ArchiData")
```

## Usage

To use ArchiData, simply load the package and start exploring your architectural data.


## Ideas

- `setup`:
  - Use lists of elements for the `parameters.R` file instead of the `not_for_printing` and `function_names` parameters. YAML could also work.
  - Add a comprobation for files declared, such as `csv_paths`, creating a list like the `not_for_printing` or the `function_names` lists.
