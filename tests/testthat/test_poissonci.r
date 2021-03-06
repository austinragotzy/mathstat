context("poissonci test")
samp <- "function return"
ep <- 1e-06


test_that("input", {
  expect_error(poissonci(NaN, 25, 4, 4.4, 0.95), "argument 1 cannot include a NaN")
  expect_error(poissonci(Inf, 25, 4, 4.4, 0.95), "argument 1 cannot include an Inf or -Inf")
  expect_error(poissonci("x", 25, 4, 4.4, 0.95), "argument 1 must be a number")
  expect_error(poissonci(125, NaN, 4, 4.4, 0.95), "argument 2 cannot include a NaN")
  expect_error(poissonci(125, Inf, 4, 4.4, 0.95), "argument 2 cannot include an Inf or -Inf")
  expect_error(poissonci(125, "x", 4, 4.4, 0.95), "argument 2 must be a number")
  expect_error(poissonci(125, 25, NaN, 4.4, 0.95), "argument 3 cannot include a NaN")
  expect_error(poissonci(125, 25, Inf, 4.4, 0.95), "argument 3 cannot include an Inf or -Inf")
  expect_error(poissonci(125, 25, "x", 4.4, 0.95), "argument 3 must be a number")
  expect_error(poissonci(125, 25, 4, NaN, 0.95), "argument 4 cannot include a NaN")
  expect_error(poissonci(125, 25, 4, Inf, 0.95), "argument 4 cannot include an Inf or -Inf")
  expect_error(poissonci(125, 25, 4, "x", 0.95), "argument 4 must be a number")
  expect_error(poissonci(125, 25, 4, 2.999999, 0.95), "argument 3 must be smaller than argument 4")
  expect_error(poissonci(125, 25, 4, 4.4, NaN), "argument 5 cannot include a NaN")
  expect_error(poissonci(125, 25, 4, 4.4, Inf), "argument 5 cannot include an Inf or -Inf")
  expect_error(poissonci(125, 25, 4, 4.4, "x"), "argument 5 must be a number")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, NaN), "argument 6 cannot include a NaN")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, Inf), "argument 6 cannot include an Inf or -Inf")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, "x"), "argument 6 must be a number")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, 200.3), "argument 6 must be an integer")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, eps = NaN), "argument 7 cannot include a NaN")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, eps = "x"), "argument 7 must be a number")
})

test_that("output", {
  samp <- poissonci(125, 25, 5.5, 6, 0.05)
  expect_is(samp, "list")
  expect_true(samp$solution >= 5.800575 - ep && samp$solution <= 
    5.800575 + ep)
  expect_true(samp$valatsol >= 0.04999878 - ep && samp$valatsol <= 
    0.04999878 + ep)
})

test_that("limits", {
  expect_error(poissonci(-1, 25, 4, 4.4, 0.95), "argument 1 must be positive")
  expect_error(poissonci(125, -1, 4, 4.4, 0.95), "argument 2 must be positive")
  expect_error(poissonci(125, 0, 4, 4.4, 0.95), "argument 2 must be numeric and non-zero")
  expect_error(poissonci(125, 25, -1, 4.4, 0.95), "argument 3 must be positive")
  expect_error(poissonci(125, 25, 4, -1, 0.95), "argument 4 must be positive")
  expect_error(poissonci(125, 25, 4, 4.4, -1), "argument 5 must be positive")
  expect_error(poissonci(123, 25.5, 0.06, 4.4, 0.8565844369232), 
    "argument 5 must be greater than or equal to 0.856584436923202 and")
  expect_error(poissonci(123, 25.5, 0.06, 4.4, 1.0001), "argument 5 must be greater than or equal to 0.856584436923202 and")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, 0), "argument 6 must be numeric and non-zero")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, -1), "argument 6 must be positive")
  expect_error(poissonci(125, 25, 4, 4.4, 0.95, eps = -1), "argument 7 must be positive")
  samp <- poissonci(127, 25, 4, 4.4, 0.95)
  expect_true(samp$solution >= 4.399054 - ep && samp$solution <= 
    4.399054 + ep)
  expect_true(samp$valatsol >= 0.9499986 - ep && samp$valatsol <= 
    0.9499986 + ep)
})
