test_that("random color function", {
  expect_equal(length(rand_pal(6)), 6)
  }
)

x <- names(iris)
x <- tolower(x)
x <- stringi::stri_replace_all_regex(x, pattern = ".", "_", vectorize_all = F)

test_that("fix names", {
  expect_equal(fix_names(names(iris),
                         patterns = ".",
                         replacements = "_",
                         case = "lower"), x)
  }
)
