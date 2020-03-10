test_that("SykehusNavnStruktur", {
  expect_true(is.character(SykehusNavnStruktur$OrgNrRHF))
  expect_true(is.character(SykehusNavnStruktur$OrgNrHF))
  expect_true(is.character(SykehusNavnStruktur$OrgNrShus))
})
