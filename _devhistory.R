rrtools::use_compendium("../vonbert/", open = FALSE)
#create a new research compendium without openning new R session
usethis::use_git_ignore("_devhistory.R")
#✓ Adding '_devhistory.R' to '.gitignore'
usethis::edit_file("DESCRIPTION")
#modify 'DESCRIPTION' and open the file
dir.create("R")
dir.create("data")
dir.create("outputs")
#create new repertories: \R, \data, \outputs
usethis::use_r("growthmodel")
#create file in \R, modify 'R/growthmodel.R' and open the file
usethis::use_package("here")
usethis::use_package("readr")
usethis::use_package("rfishbase")
usethis::use_package("dplyr")
usethis::use_package("ggplot2")
#✓ Adding 'here' and 'readr' to Imports field in DESCRIPTION
rrtools::use_readme_rmd()
#✓ Creating 'README.Rmd' from template.
#✓ Adding 'README.Rmd' to `.Rbuildignore`.
#● Modify
#✓ Rendering README.Rmd to README.md for GitHub.
#✓ Adding code of conduct.
#✓ Creating 'CONDUCT.md' from template.
#✓ Adding 'CONDUCT.md' to `.Rbuildignore`.
#✓ Adding instructions to contributors.
#✓ Creating 'CONTRIBUTING.md' from template.
#✓ Adding 'CONTRIBUTING.md' to `.Rbuildignore`.
utils::sessionInfo()
# The MARINE'S session is:
#R version 4.0.3 (2020-10-10)
#Platform: x86_64-pc-linux-gnu (64-bit)
#Running under: Ubuntu 20.04.1 LTS
devtools::document()
#Updating vonbert documentation
#Loading vonbert
# and create the repertory 'man'
devtools::install_deps()
devtools::load_all()
#Loading vonbert
devtools::check()
#0 errors ✓ | 1 warning x | 1 note x
devtools::install()
#DONE (vonbert): YOUPiiiiiii
usethis::use_git(message = ":green_heart: first package")
#commit all files with this previous message
usethis::use_r("make")
## pas la bonne commande!!! comment faire pour l'avoir à la racine?????
