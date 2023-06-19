test_that("loaded packages", {
  loaded <- names(sessionInfo()$otherPkgs)
  expect_true(
    "ArchiData" %in% loaded
  )
})
