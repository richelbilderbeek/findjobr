#' Find the best jobs for me.
#' @export
find_best_jobs <- function() {
  random_dois <- rcrossref::cr_r(sample = 10)

  df <- purrr::map(random_dois, .f = purrr::safely(
    function(x) roadoi::oadoi_fetch(x, email = "richel@richelbilderbeek.nl")
  )) %>% purrr::map_df("result")

  # Only use open access aricles
  df <- df[ df$is_oa == TRUE, ]
  df
}
