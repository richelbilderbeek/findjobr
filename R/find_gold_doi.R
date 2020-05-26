# Find one golden DOI
#' @export
find_gold_doi <- function() {
  attempt <- 1
  while (1) {
    random_doi <- rcrossref::cr_r(sample = 1, query = "speciation")

    df_random_doi <- purrr::map(random_doi, .f = purrr::safely(
      function(x) roadoi::oadoi_fetch(x, email = "richel@richelbilderbeek.nl")
    )) %>% purrr::map_df("result")

    # Only use recent open access aricles with gold standard
    if (df_random_doi$oa_status == "gold" &&
        df_random_doi$genre == "journal-article" &&
        !is.na(df_random_doi$year) &&
        as.numeric(df_random_doi$year) > 2015
    ) {
      message(attempt)
      return(df_random_doi)
    }
    attempt <- attempt + 1
  }
}
