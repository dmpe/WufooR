library(testthat)
library(WufooR)

options(Wufoo_Name = "johnmalc", Wufoo_API = "S6VI-I8UA-BY11-TDHO")

context("Forms")

test_that("Form request returns 17 rows, always", {
  userDB <- form_info()
  expect_gte(dim(userDB)[2], 17)
})

test_that("Form returns entries, with the requested URL", {
  userDB <- form_entries(formIdentifier = "z5kqx7h1gtvg4g", systemFields = "false", showRequestURL = FALSE)

  expect_gt(length(userDB), 1)
  expect_output(form_entries(formIdentifier = "z5kqx7h1gtvg4g", showRequestURL = T), "The requested URL has been this:")
})

test_that("CSV df is returned", {
  df_csv <- form_entriesFromCSV(reportName = "untitled-report", showRequestURL = F)
  expect_gte(dim(df_csv)[2], 19)
})

test_that("There are no comments", {
  expect_warning(form_comments(formIdentifier = "z5kqx7h1gtvg4g"))
})

test_that("There are no comments", {
  expect_gte(form_commentsCount(formIdentifier = "z5kqx7h1gtvg4g"), 0)
})
