#' multi_hist
#'
#' @title Print histograms for the numeric variables in a tibble.
#'
#' @description Each of the histograms will appear separated.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param data The dataset.
#' @param binwidth One numeric value or one of "scott", "fixed", "auto" or "freedman". Defaults to "scott".
#'
#' @importFrom magrittr %<>%
#' @importFrom grDevices hcl.colors
#'
#' @return
#' It returns...
#'
#' @examples
#' multi_hist(iris)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
multi_hist = function(data, binwidth = "scott") {
  # data = iris; binwidth = "scott"
  # data = ggplot2::mpg

  data %<>% dplyr::select_if(is.numeric)

  colnames(data) %>%
    purrr::map(
      \(c) {
        my_binwidth = if(is.numeric(binwidth)) {
          binwidth
        } else {
          switch(
            binwidth,
            "scott" = 3.5 * sd(data[[c]]) / (length(data[[c]])^(1/3)),
            "fixed" = 30,
            "auto" = (max(data[[c]]) - min(data[[c]])) / 30,
            "freedman" = 2 * IQR(data[[c]]) / (length(data[[c]])^(1/3))
          )
        };
        data %>% ggplot2::ggplot(ggplot2::aes(x = !!dplyr::sym(c))) +
          ggplot2::geom_histogram(fill = "darkorchid3", linewidth = 0.5, binwidth = my_binwidth) +
          ggplot2::ggtitle(
            # subtitle = paste(dim(join_data)[1], "valores"),
            label = paste(c, "en agosto de 2023")
          ) +
          ggplot2::theme_classic() +
          ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1)) +
          ggplot2::ylab("Frecuencia absoluta") +
          ggplot2::xlab(c)
      }
    )
}
