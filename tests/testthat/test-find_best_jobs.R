test_that("use", {
  df <- find_best_jobs()
  expect_true(tibble::is_tibble(df))
})
