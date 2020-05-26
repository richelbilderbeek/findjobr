test_that("use", {
  df <- find_gold_doi()
  expect_true("doi" %in% names(df))
})
