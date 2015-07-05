library(testthat)
library(WufooR)
options(Wufoo_Name = "johnmalc")

context("Users")

test_that("User request returns 17 rows, always", {
  userDB <- user_info(ApiKey = "F1QH-Q64B-BSBI-JASJ")
  expect_equal(dim(userDB)[1], 17)
})
