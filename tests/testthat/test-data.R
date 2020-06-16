test_that("SykehusNavnStruktur", {
  expect_true(is.character(SykehusNavnStruktur$OrgNr))
  expect_true(is.character(SykehusNavnStruktur$NivaaOpp))
  expect_true(is.character(SykehusNavnStruktur$Kortnavn))
  expect_true(is.character(SykehusNavnStruktur$OrgNavnEnhetsreg))
  expect_true(is.numeric(SykehusNavnStruktur$Nivaa))
})
