test_that("use", {
  n <- 3
  df <- find_gold_dois(n = n)
  expect_true("doi" %in% names(df))
  expect_equal(n, nrow(df))
})
