test_that("SykehusNavnStruktur", {
  expect_true(is.character(SykehusNavnStruktur$OrgNrShus))
  expect_true(is.character(SykehusNavnStruktur$SykehusNavn))
  expect_true(is.character(SykehusNavnStruktur$OrgNavnEnhetsreg))
  expect_true(is.numeric(SykehusNavnStruktur$TaMed))
})

test_that("hospital_structure", {
  expect_true(is.character(hospital_structure$OrgNr))
  expect_true(is.character(hospital_structure$NivaaOpp))
  expect_true(is.character(hospital_structure$Kortnavn))
  expect_true(is.character(hospital_structure$OrgNavnEnhetsreg))
  expect_true(is.numeric(hospital_structure$Nivaa))
})
