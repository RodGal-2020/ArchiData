#' translate
#'
#' Translate words from one language to another using a dictionary.
#'
#' @title Translate words using a dictionary
#'
#' @description
#' This function takes a vector of words, a dictionary, and translates the words from one language to another.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param words A vector of words to be translated.
#'
#' @param dictionary A data frame containing translations. The first column represents the original language,
#' and the second column represents the target language.
#'
#' @param original_language The language of the input words (default is "Español").
#'
#' @param translate_to The target language for translation (default is "English").
#'
#' @return
#' A vector of translated words.
#'
#' @examples
#' dictionary <- read.csv2(header=TRUE, text='
#'   Español;English
#'   Hola;Hello
#'   Adiós;Goodbye
#'   ')
#'
#' words_to_translate <- c("Hola", "Adiós")
#' translated_words <- translate(words_to_translate, dictionary)
#' print(translated_words)
#' # Output: [1] "Hello"   "Goodbye"
#'
#' @section Warning:
#' Ensure that the dictionary includes the necessary translations for accurate results.
#'
#' @export
translate = function(words, dictionary, original_language = "Español", translate_to = "English") {
  dictionary %>%
    dplyr::filter(.data[[original_language]] %in% words) %>%
    dplyr::pull(.data[[translate_to]])
}

