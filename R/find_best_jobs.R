#' Find the best jobs for me.
#' @export
find_best_jobs <- function() {

  if (1 == 2) {
    # Smart: browsing only through open access articles
    # Drawback: no idea if license is gold
    df <- jaod::jaod_article_search(query = "title:immunology AND year > 2019")
    df$total
  }

  df_gold_dois <- find_gold_dois()

  # Article must be in field relevant to me
  is_relevant_title <- stringr::str_detect(
    string = df_gold_dois$title,
    pattern = "(evolutio|immunolo|speciation)"
  )
  df_gold_dois$title[is_relevant_title]

  # University must be Max Planck or Sweden
  df_gold_dois

  df_gold_dois
}
