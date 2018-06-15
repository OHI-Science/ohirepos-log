## This will extract and save big datasets for the key, and then brew the global-explore.Rmd

## setup
# library(tidyverse)
# library(ohirepos)

## create global-explore folder ----
dir_gl_exp <- "~/github/ken/global_explore"
dir_gl_exp_data <- "~/github/ken/global_explore/data"
if (!exists(dir_gl_exp)) dir.create(dir_gl_exp, showWarnings=FALSE)
if (!exists(dir_gl_exp_data)) dir.create(dir_gl_exp_data, showWarnings=FALSE)


## extract from NCEAS' server MAZU ----

## stock_catch_by_rgn.csv
ohicore::extract_mazu_by_rgn(mazu_filename = "globalprep/fis/v2017/int/stock_catch_by_rgn.csv",
                  rgn_name = repo_registry$study_key,
                  save_local_dir = dir_gl_exp_data)

## rgn_spp_gl.csv
ohicore::extract_mazu_by_rgn(mazu_filename = "globalprep/spp_ico/v2017/summary/rgn_spp_gl.csv",
                  rgn_name = repo_registry$study_key,
                  save_local_dir = dir_gl_exp_data)


## brew explore-data.Rmd ----
key <- repo_registry$study_key
study_area <- repo_registry$study_area

brew::brew(system.file(sprintf('master/web/explore-data.brew.Rmd'), package='ohirepos'),
           file.path(repo_registry$dir_repo, 'global_explore/explore-data.Rmd'))


## fin ## ----
