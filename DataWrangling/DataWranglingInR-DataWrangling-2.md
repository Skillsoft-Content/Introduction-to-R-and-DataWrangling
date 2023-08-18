---
title: 'Data Wrangling in R - Data Wrangling - 2'
subtitle: 'One should look for what is and not what he thinks should be. (Albert Einstein)'
output:
 revealjs::revealjs_presentation:
  css: !expr here::here("dependencies/slides_rmd.css")
  transition: slide
  template: !expr here::here("dependencies/reveal_template.html")
  reveal_options:
    width: 1366
    height: 768
  keep_md: yes
params:
  topic_dir: !expr setwd('.')
---






Module completion checklist
=================================================
<table>
  <tr>
    <th>Objective</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Demonstrate installing a package and loading a library</td>
    <td></td>
  </tr>
  <tr>
    <td>Define the six functions that provide verbs for the language of data manipulation, from the package dplyr</td>
    <td></td>
  </tr>
</table>

Packages and datasets in R
=================================================

- We’ve now spent some time wrangling the CMP dataset by:

  - creating a subset of the data
  - identifying missing values (NAs)
  - imputing a new value (the mean) to replace missing values

- To continue practicing data wrangling, we are going install a series of packages
intended to help with data wrangling tasks, known as the `tidyverse`
- We will also prepare to use some datasets available directly within R as packages


  
Packages in RStudio
=================================================

:::::: {.columns}
::: {.column width="55%"}
- R packages are an extension of the R programming language 
- They are collections of compiled code, sample data, and documentation 
- They are typically installed from the CRAN (the Comprehensive R Archive Network)
- Learn more about 'base' and 'add-on' packages in R [here](https://cran.r-project.org/doc/FAQ/R-FAQ.html#R-Add_002dOn-Packages)
- The package we'll be using for the remainder of the course is called the `tidyverse`

:::
::: {.column width="45%"}
![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/tidyverse.png)
:::
::::::

Installing packages: package explorer
=================================================
:::::: {.columns}
::: {.column width="65%"}

- RStudio has a built-in package manager in the bottom right pane to help us install packages
- Click on <b>`Packages`</b> tab in the bottom-right pane
- Click <b>`Install`</b> button next to `Update`
- Type package name in the box and install

![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/package-manager.png)

:::
::: {.column width="35%"}

![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/package-manager2.png)
![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/package-manager3.png)


:::
::::::
Installing packages: package explorer
=================================================
:::::: {.columns}
::: {.column width="50%"}
- The installed package should appear in the list of packages in the package explorer

<br>

![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/package-manager4.png)

:::
::: {.column width="50%"}

- To load the package into R's environment, check the box next to the name of your desired package

![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/package-manager5.png)

:::
::::::
Installing packages
=================================================
:::::: {.columns}
::: {.column width="55%"}

- If the function we would like to use comes from a `package`, we need to install the `package` first
- In addition to installing `packages` with package explorer as we introduced earlier, we can also use the function `install.packages()`
- For this function, we need to provide a single required argument: a character string corresponding to the `package name`


```r
# Install package
?install.packages
```

:::
::: {.column width="45%"}
<br>
![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/install-packages.png)

:::
::::::
Installing packages example
=================================================


- Here is an example of how we install packages with function <b>`install.packages()`</b>
- You can always check the detailed documentation of a package with `help = "package name"`


```r
install.packages("tidyverse")   #<- Install package 
```

![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/tidyverse-docs.png)




Loading packages in RStudio
=================================================
- Once installed, it is ~~important~~ that your desired package is properly loaded in R. 
<br>
- You can do this two different ways:

:::::: {.columns}
::: {.column width="50%"}

- The first option uses the `library()` command

```r
library(tidyverse)
library(help = "tidyverse")     #<- View package documentation.
```
:::
::: {.column width="50%"}

- The second option involves locating the package name in the <b> Packages </b> pane and checking the appropriate box
![centered-border](/opt/atlassian/pipelines/agent/build/dependencies/img/package-manager5.png)

:::
::::::

Detaching packages in RStudio
=================================================
- Some packages are very large and consume quite a bit of available memory when loaded
- You may want to use `detach()` after usage to free up your computer's memory
<br>

```r
detach(package:tidyverse,unload=TRUE)
```
- You can also uncheck the box by the package's name on the <b>Packages</b> pane
- ~~Note: once detached you can not use any of the packages' function until reloaded~~

Built-in R Datasets
=================================================
- R comes with several built-in data packages, so that you always have sample data
available for exploring how new packages and functions work

  - Titanic: Survival of passengers on the Titanic
  - iris: Edgar Anderson's Iris Data
  - mtcars: Motor Trend Car Road Tests
  

Loading Built-in Datasets
=================================================
- Loading built-in datasets takes the form of installing a package rather than reading in an
external file
- Let's now install and load the `nycflights13` package


```r
install.packages("nycflights13", repos='http://cran.us.r-project.org')
```

```
Updating HTML index of packages in '.Library'
```

```
Making 'packages.html' ... done
```

```r
library(nycflights13)
```

- The `nycflights13` package contains the following five datasets:
  
  - `flights`: all flights that departed from NYC in 2013
  - `weather`: hourly meteorological data for each airport
  - `planes`: construction information about each plane
  - `airports`: airport names and locations
  - `airlines`: translation between two letter carrier codes and names


Data transformation with tidyverse
=================================================
:::::: {.columns}
::: {.column width="60%"}

- When you are given messy data, your goal is to transform it into a usable format
- To do this, you may need the help from multiple <b>packages</b> that can be found within the universe of [`tidyverse`](https://www.tidyverse.org/)
- Some core packages in `tidyverse` are:
  
  - `ggplot2`
  - `dplyr`
  - `tidyr`
  
- In this module, we will introduce few functions in `dplyr` that can be used to manipulate data

:::
::: {.column width="40%"}

![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/tidyverse.png)


:::
::::::
A little more about tidyverse
=================================================
- Packages in the tidyverse change fairly frequently
- You can see if updates are available, and optionally install them, by running the following code


```r
tidyverse_update()
```

- Like we noted previously, there are many libraries within the `tidyverse` package
<br>
<br>
- <b>The packages we will focus on help you wrangle and manipulate data quickly and efficiently</b>



Data transformation
=================================================
- <b>`dplyr`</b> is an essential library within the tidyverse universe
- It will be the tool we use for transforming our data by filtering, aggregating, and summarizing

- Before starting this lesson, understand that dplyr does ~~overwrite~~ some `base R` packages such as `filter` and `lag`

- Even functions with exactly the same name can be of different usage and syntax when belonging to different packages


- If you have loaded dplyr and want to use the base version of the package, you will have to type in the full name: 
  - for example `stats::filter` and `stats::lag`

Framework of dplyr
=================================================

- The framework of `dplyr` is as follows:

  - The first argument is the <b>original dataframe</b>
  - The next arguments describe <b>what to do with the original dataframe</b>, using the six key `dplyr` functions
  - The final result is a <b>new, transformed dataframe</b>



Basics of dplyr
=================================================
- Here are the six key `dplyr` functions we will discuss for the remainder of the course:

<table>
  <tr>
    <th>Function</th>
    <th>Use Case</th>
    <th>Data Type</th>
  </tr>
  <tr>
    <td><code>filter</code></td>
    <td> Pick observations by their value </td>
    <td> All data types </td>
  </tr>
  <tr>
    <td><code>arrange</code></td>
    <td>Reorder the rows</td>
    <td> All data types </td>
  </tr>
  <tr>
    <td><code>select</code></td>
    <td>Pick variables by their names</td>
    <td> All data types </td>
  </tr>
    <tr>
    <td><code>mutate</code></td>
    <td>Create new variables with functions of existing variables</td>
    <td> All data types </td>
  </tr>
   <tr>
    <td><code>summarize</code></td>
    <td>Collapse many values down to a single summary</td>
    <td> All data types </td>
  </tr>
  <tr>
    <td><code>group_by</code></td>
    <td>Allows the above functions to operate on a dataset group by group</td>
    <td> All data types </td>
  </tr>
</table>




Knowledge check
=================================================
![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/knowledge_check.png)



Module completion checklist
=================================================
<table>
  <tr>
    <th>Objective</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Demonstrate installing a package and loading a library</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
  <tr>
    <td>Define the six functions that provide verbs for the language of data manipulation, from the package dplyr</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
</table>


Congratulations on completing this module!
=================================================
![icon-left-bottom](/opt/atlassian/pipelines/agent/build/dependencies/img/circles-crayon-purple.png)
