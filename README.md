
[![DOI](https://zenodo.org/badge/125386835.svg)](https://zenodo.org/badge/latestdoi/125386835)

# Correlating mean near surface temperature deviation on the number of children born in Vienna

# Experiment Description

The aim of this pseudo experiment is to analyze the relation between the global temperature change and the number of children born alive in Vienna.
The experiment is conducted, by means of visual data science (exploring the data by plotting it in an appropriate manner).

## Project structure

* `documentation` - Contains the documentation of the results (documentation.txt), the project metadata (metadata.xml) and the experiment architecture (architecture.png)
* `src` - Contains the code for preprocessing the data and conducting the experiment plus the results (see following subfolders)
* `src/data/raw` - Contains the downloaded (raw) datasets
* `src/data/processed` - Contains the preprocessed and merged dataset
* `src/preprocessData.R` - Contains the code for preprocessing the data
* `src/report.Rmd` - Contains the code necessary to load the preprocessed data and to execute the experiment and is used to generate the report.pdf file
* `src/plots` - Contains the result plots of the experiment

## Datasets
Both datasets have already been downloaded and placed into the `src/data/raw` folder.

### Live births in Vienna

The dataset was downloaded from the Open Data Austria website, accessed via https://www.data.gv.at/katalog/dataset/f54e6828-3d75-4a82-89cb-23c58057bad4 on April 19, 2019
It is freely available under the Creative Commons (CC BY 4.0) license and has the unique id f54e6828-3d75-4a82-89cb-23c58057bad4.

It contains data about the number of live births in Vienna from 2002 to 2017 group by age of the mother and gender of the child.

### Mean near surface temperature deviation 

The dataset was downloaded from the EU Open Data website, accessed via https://data.europa.eu/euodp/en/data/dataset/zQAEvhkR7H0NQYU1HP5fA on April 19, 2019
It is freely available under the Creative Commons (CC BY 4.0) license and has the unique id cli_iad_td.

It contains data about the global mean near surface temperature deviation from 1850 to 2017 from different sources. The source TD_GLB,NOAAGLOBALTEMP,DEGC was used for the conducted experiment.


## Instructions for running the experiment

Before running the experiment one needs to make sure, that the folders (described in Section Project Structure) exist and that the working directory in preprocessData.R is set to the project directory path (e.g. using `setwd(<project-path>)` in the R console).

The experiment was executed using the following libraries with the following versions:
* `RStudio` - Version 1.1.456
* `MiKTeX` - Version 2.9
* `R` - Version 3.5.1
* `rmarkdown` - Version 1.10
* `ggplot2` - Version 3.0.0

The data preprocessing script can be started from the `project` directory using `Rscript ./src/preprocessData.R`.
The report.Rmd file can be opened with e.g. RStudio and can be executed by using the `Run All` Button.

## Experiment Architecture
### Preprocessing
The datasets were preprocessed in the following way:
* At first the temperature and birth datasets were loaded.
* Next the number of births (aggregated by gender of the baby and age of the mother) was summed up.
* Then the TD_GLB,NOAAGLOBALTEMP,DEGC temperature deviation measures were selected
* And the temperature measures were filtered to contain only data from 2002 to 2017.
* In the end the two datasets were merged (by year) and saved in the `src/data/processed` directory.

### Experiment
The correlation of number of births and global temperature correlation was visualized by:
* Plotting the two time-series in one graph (using two different axes, such that the correlation can be seen easily).
* Creating a scatterplot of number of births and global temperature and fitting a linear model to the data.

Furthermore, to quantize the correlation in one single number the Pearson correlation coefficient of the global temperature deviation and the number of births in Vienna was calculated.

## Experiment output and results
The whole experiment report (report.pdf) can be found in the `src` directory.
In summary one can see a very strong correlation between global mean near surface temperature deviation and the number of live births in Vienna.
Thus one can argue (if ignoring the difference between causality and pure correlation), that the increase in global temperature leads to an increasing number of new born in Vienna.
