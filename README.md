# ohirepos-log
Scripts for creating OHI repos with the `ohirepos` package.

[`create_repos.Rmd`](https://github.com/OHI-Science/ohirepos-log/blob/master/create_repos.rmd) is the recipe for creating new OHI tailored repos using the `ohirepos` package. The default is to populate tailored repos with OHI Global Assessments, but this can be respecified. 

## Example workflow

1. Clone `ohirepos-log` locally, or PULL!
1. Open `create_repos.Rmd` and start reading...
  1. Create `pal-scores` and `tet-scores` repos in the [OHI-4site](https://github.com/OHI-4site) github org and have admin permissions
  1. Open `repo_registry.csv` and [register `pal-scores` and `tet-scores`]()
    1. `scenario_year` and `suffix_origin`: use the most recently completed assessment (unless a special case)
    1. `scenario_name`: post-2018 we don't include a year to set up for multi-year assessments
    1. `rgn_id_global`: consult [rgn_global.csv](https://github.com/OHI-Science/ohirepos-log/blob/master/rgn_global.csv) to identify the most appropriate global rgn_id to use (trans-boundary are a special case but also could just pick one rgn_id in the trans-boundary). In this example, I used rgn_id = 147 French Polynesia for Tetiaroa and rgn_id = 150 Palmyra Atoll for Palmyra.
    1. Okay to not have shapefile information to create a full repo — as long as you know the number of regions within the OHI+ study area
