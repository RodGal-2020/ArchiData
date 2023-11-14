# 🏛️ ArchiData

[![build](https://github.com/RodGal-2020/ArchiData/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/RodGal-2020/ArchiData/actions/workflows/pages/pages-build-deployment)
[![R](https://github.com/RodGal-2020/ArchiData/actions/workflows/r.yml/badge.svg?branch=main)](https://github.com/RodGal-2020/ArchiData/actions/workflows/r.yml)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange)](https://lifecycle.r-lib.org/articles/stages.html)
[![codecov](https://codecov.io/gh/RodGal-2020/archiData/settings/badge)](https://app.codecov.io/gh/RodGal-2020/archiData?branch=main)

`ArchiData` is an R package for the analysis of architectural data. It provides a suite of functions for analyzing and visualizing various aspects of architectural design, such as building dimensions, room layouts, and facade features.

> **Warning**: This is package is under development, and it comes with no warranty of any kind.

## Installation

You can install `ArchiData` from GitHub using the `devtools` package:

```r
devtools::install_github("RodGal-2020/ArchiData")
```

## Usage

To use `ArchiData`, simply load the package and start exploring your architectural data.

```r
library(ArchiData)
help(package="ArchiData")
```

## Status

Here you can see a quick overview of the package, as now it's in a development stage and it's not yet ready for production. The following diagrams show the main functions of the package.

```mermaid
%%{init: {"pie": {"textPosition": 0.5}, "themeVariables": {"pieOuterStrokeWidth": "5px"}} }%%
pie title ArchiData contents
         "High level representation" : 3
         "Thermal comfort processing" : 3
         "High level machine learning" : 2
         "Utilities" : 2
```

### High level representation

```mermaid
  graph TD
    tibble-->auto_cor
    auto_cor-->correlation_plot

    tibble-->multi_hist

    tibble-->print_hist
    print_hist-->histogram

    multi_hist-->histogram

    tibble-->multi_outliers
    multi_outliers-->histogram
    multi_outliers-->boxplot
    multi_outliers-->tibble

    tibble-->MVR
    MVR-->tibble

    tibble-->print_boxplot
    print_boxplot-->boxplot

    list-->glance
```

### High level machine learning

```mermaid
  graph TD
    tibble-->auto_clustering
    tibble-->auto_cor
    tibble-->auto_PCA
    tibble-->get_numeric

    auto_clustering-->model
    auto_cor-->model
    auto_PCA-->model

    get_numeric-->tibble

    tibble-->print_tree_importance
    tibble-->print_tree

    print_tree_importance-->plot
    print_tree-->plot
```

### Thermal comfort processing

```mermaid
  graph TD
    path-->kmls2tibble
    kmls2tibble-->tibble

    vector-->MRT
    vector-->UTCI

    UTCI-->UTCI2classification
    UTCI-->UTCI2color
    
    UTCI2classification-->UTCI_labels
    UTCI2color-->UTCI_colors
```

### Utilities

- `translate`
- `check_path`
- `inspect_environment`
- `package_info`
- `refactor`
- `template`

#### Deprecated

- `setup`
- `three_dots`

## License

See [`LICENSE.md`](LICENSE.md).
