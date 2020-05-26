#' Find the DOIs of golden articles
#' @export
find_gold_dois <- function(n) {
  df <- tibble::tibble();
  for (i in seq_len(n)) {
    df <- rbind(df, find_gold_doi())
  }
  df
}
