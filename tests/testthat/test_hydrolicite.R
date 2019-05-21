context("hydrolicite fonctionne comme prevu")

x<-debit_mensuel(bulhydro)
test_that("Hydrolicite fonctionne sans erreurs", {
  expect_silent(hydrolicite(x))
})

test_that("Hydrolicite renvoi une erreur quand debit est pas bien forme", {
  expect_error(hydrolicite(15))
  expect_error(hydrolicite(USArrests$Murder))
})


test_that("Hydrolicite renvoi les valeurs comme calcule dans excel/ à la main", {
  expect_gt(hydrolicite(x)[4],0)
  expect_lt(hydrolicite(x)[4],1000)

})
