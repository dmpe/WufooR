library(testthat)
library(WufooR)

options(Wufoo_Name = "johnmalc", Wufoo_API = "S6VI-I8UA-BY11-TDHO")

context("Fields")

test_that("Fields request returns 17 rows, always", {
  fieldsALL <- fields_info(formIdentifier = "z5kqx7h1gtvg4g")
  expect_gt(dim(fieldsALL)[1], 10)
})

context("Reports")

test_that("Reports have 11 fields", {
  repo <- reports_info()
  expect_gte(dim(repo)[2], 11)
})

context("Widget")

test_that("Number of Widgets is above 5", {
  widg <- report_widgets(formIdentifier = "z5kqx7h1gtvg4g")
  expect_gte(dim(widg)[2], 5)
})
