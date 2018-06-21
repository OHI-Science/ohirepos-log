## This will extract and save big datasets for the key, and then brew the global-explore.Rmd

## setup
key <- repo_registry$study_key
study_area <- repo_registry$study_area
rgn_id_global <- repo_registry$rgn_id_global


## create global-explore folder ----
dir_gl_exp <- file.path(repo_registry$dir_repo, "global_explore")
dir_gl_exp_data <- file.path(repo_registry$dir_repo, "global_explore/data")
if (!exists(dir_gl_exp)) dir.create(dir_gl_exp, showWarnings=FALSE)
if (!exists(dir_gl_exp_data)) dir.create(dir_gl_exp_data, showWarnings=FALSE)


## extract from NCEAS' server MAZU ----

## stock_catch_by_rgn.csv
ohirepos::extract_mazu_by_rgn(mazu_filename = "globalprep/fis/v2017/int/stock_catch_by_rgn.csv",
                  rgn_name = study_area,
                  save_local_dir = dir_gl_exp_data)

## rgn_spp_gl.csv
ohirepos::extract_mazu_by_rgn(mazu_filename = "globalprep/spp_ico/v2017/summary/rgn_spp_gl.csv",
                  rgn_name = study_area,
                  save_local_dir = dir_gl_exp_data)


## brew explore-data.Rmd ----

brew::brew(system.file(sprintf('master/explore_data.brew.Rmd'), package='ohirepos'),
           file.path(repo_registry$dir_repo, 'global_explore/explore_data.Rmd'))

## knit .html
rmarkdown::render(file.path(repo_registry$dir_repo, 'global_explore/explore_data.Rmd'))

## create README with url
brew::brew(system.file(sprintf('master/README_global_explore.brew.md'), package='ohirepos'),
           file.path(repo_registry$dir_repo, 'global_explore/README.md'))


## fin ## ----
