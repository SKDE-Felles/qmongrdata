
test_that("load_data", {

  expect_type(load_data(), "list")

  expect_equal(
    names(load_data()),
    c("description", "indicator", "hospital_name_structure")
  )

  expect_equal(
    names(load_data(data_type = "all")),
    c("description", "indicator", "hospital_name_structure")
  )

  expect_equal(
    names(load_data("description")),
    "description"
  )

  expect_equal(
    names(load_data(data_type = "indicator")),
    "indicator"
  )

  expect_equal(
    names(load_data("hospital_name_structure")),
    "hospital_name_structure"
  )

  expect_equal_to_reference(
    names(load_data("description")[["description"]]), "data/description.rds"
  )

  expect_equal_to_reference(
    names(load_data("hospital_name_structure")[["hospital_name_structure"]]),
    "data/hospital_name_structure.rds"
  )

  expect_equal_to_reference(
    names(load_data("indicator")[["indicator"]]),
    "data/indicator.rds"
  )
})
