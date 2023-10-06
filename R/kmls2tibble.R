#' kmls2tibble
#'
#' Read kml files and convert them to tibbles
#'
#' @title Read kml files and convert them to tibbles
#'
#' @description Read kml files and convert them to tibbles
#'
#' `r lifecycle::badge("experimental")`
#'
#' It looks for something like the following:
#'
#' ```xml
#' <?xml version="1.0" encoding="UTF-8"?>
#' <kml xmlns="http://www.opengis.net/kml/2.2">
#'   <Document>
#'   <name>Ruta 1 - Murillo</name>
#'   <Placemark>
#'      <name>Jardines de Murillo (SP)</name>
#'      <styleUrl>#icon-1899-DB4436-nodesc</styleUrl>
#'      <Point>
#'       <coordinates>
#'         -5.9890187,37.3831802,0
#'       </coordinates>
#'      </Point>
#'   </Placemark>
#'   (...)
#' ````
#'
#' @param kml_files A vector of kml files.
#'
#' @return A tibble with the data from the kml files.
#'
#' @examples
#' print("TODO:")
#'
#' @export
kmls2tibbles = function(kml_files) {
  # Read the files
  rutes = purrr::map(
    kml_files,
    xml2::read_xml
  )

  # Save rute names, in node rute
  rute_names = rutes %>% purrr::map(
    xml2::xml_find_first,
    ".//d1:name"
  ) %>%
    purrr::map(
      xml2::xml_text
    )

  rutes %<>% purrr::map(
    xml2::xml_find_all,
    ".//d1:Placemark" # We add the d1 because of the namespaces -> See https://www.w3schools.com/xml/xml_namespaces.asp
  )

  # Now we want to extract the name and the coordinates:
  ubications = rutes %>%
    purrr::map(
      xml2::xml_find_all,
      ".//d1:name"
    ) %>%
    purrr::map(
      xml2::xml_text
    )

  coordinates = rutes %>%
    purrr::map(
      ~ .x %>%
        xml2::xml_find_all(".//d1:coordinates") %>%
        xml2::xml_contents() %>%
        xml2::xml_text() %>%
        stringr::str_split(",") %>%
        purrr::map(
          ~ .x %>%
            # magrittr::set_names(readr::parse_number(.x[1:2]), nm = c("long", "lat"))) # This substitutes 3 lines of purrr::mappings
            magrittr::extract(1:2) %>%
            readr::parse_number() %>%
            magrittr::set_names(nm = c("long", "lat"))
        )
    )

  # Mix everything and return it
  tibble::tibble(
    Rute = rute_names,
    Ubication = ubications,
    Coordinates = coordinates
  ) %>%
    tidyr::unnest_longer(Rute) %>%
    tidyr::unnest_longer(c(Ubication, Coordinates)) %>%
    tidyr::unnest_wider(Coordinates)
}
