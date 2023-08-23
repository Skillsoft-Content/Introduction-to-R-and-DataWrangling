---
title: 'Data Wrangling in R - Data Wrangling - 4'
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
    <td>Select specific variables using the select command</td>
    <td></td>
  </tr>
  <tr>
    <td>Derive new variables from the existing variables using the mutate and transmute commands</td>
    <td></td>
  </tr>
</table>

Select
=================================================
:::::: {.columns}
::: {.column width="50%"}
- `select()` helps you select specific columns within your dataframe


```r
# Check for detailed documentation
?dplyr::select

# Use cases for `select` function
select(df,           #<- dataframe 
       select_cond1, #<- selection rule(s)
       ...)
```

- We often use this function with pipes(`%>%`) which we will cover later in the course
- The selection criteria can be written in multiple ways, as shown in the next couple of slides

<div class="notes">
`select` is used a lot like it is used in `SQL`, actually most all these functions may remind you more of the `SQL` data manipulation style
</div>

:::
::: {.column width="50%"}

![full-width](/opt/atlassian/pipelines/agent/build/dependencies/img/select.png)

:::
::::::

Select a subset
=================================================
:::::: {.columns}
::: {.column width="50%"}
- Simply specify the column name(s)





```r
# Select columns from `flights` data frame.
select(flights, #<- specify the data frame
       year,    #<- specify the 1st column
       month,   #<- specify the 2nd column
       day)     #<- specify the 3rd column
```

```
# A tibble: 336,776 x 3
    year month   day
   <int> <int> <int>
 1  2013     1     1
 2  2013     1     1
 3  2013     1     1
 4  2013     1     1
 5  2013     1     1
 6  2013     1     1
 7  2013     1     1
 8  2013     1     1
 9  2013     1     1
10  2013     1     1
# … with 336,766 more rows
```

:::
::: {.column width="50%"}
- You can also specify a range of columns with the range operator (i.e. `:`)

```r
# Select columns from `flights` data frame
select(flights,  #<- specify the data frame
       year:day) #<- specify the range of columns
```

```
# A tibble: 336,776 x 3
    year month   day
   <int> <int> <int>
 1  2013     1     1
 2  2013     1     1
 3  2013     1     1
 4  2013     1     1
 5  2013     1     1
 6  2013     1     1
 7  2013     1     1
 8  2013     1     1
 9  2013     1     1
10  2013     1     1
# … with 336,766 more rows
```

:::
::::::
Select by excluding
=================================================
- Finally, you can select by excluding certain columns using the exclusion operator (i.e. `-`)


```r
# Select multiple columns from `flights` data frame by providing which columns to exclude in selection
select(flights,     #<- specify the data frame
       -(year:day)) #<- specify the range of columns to exclude
```

```
# A tibble: 336,776 x 16
   dep_time sched_dep_time dep_delay arr_time sched_arr_time arr_delay carrier
      <int>          <int>     <dbl>    <int>          <int>     <dbl> <chr>  
 1      517            515         2      830            819        11 UA     
 2      533            529         4      850            830        20 UA     
 3      542            540         2      923            850        33 AA     
 4      544            545        -1     1004           1022       -18 B6     
 5      554            600        -6      812            837       -25 DL     
 6      554            558        -4      740            728        12 UA     
 7      555            600        -5      913            854        19 B6     
 8      557            600        -3      709            723       -14 EV     
 9      557            600        -3      838            846        -8 B6     
10      558            600        -2      753            745         8 AA     
# … with 336,766 more rows, and 9 more variables: flight <int>, tailnum <chr>,
#   origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>,
#   minute <dbl>, time_hour <dttm>
```

Select - helper functions
=================================================
- Helpers are multiple functions you can use to select variables based on their names

- They act like regular expressions, but in a more simplified manner

- Here are some of the more commonly used helper functions:

<table>
  <tr>
    <th>Helper Function</th>
    <th>Use Case</th>
  </tr>
  <tr>
    <td><code>starts_with("abc")</code> </td>
    <td>matches names that begin with "abc" </td>
  </tr>
  <tr>
    <td><code>ends_with("xyz")</code></td>
    <td>matches names that end with "xyz"</td>
  </tr>
  <tr>
    <td><code>contains("ijk")</code></td>
    <td>matches names that contain "ijk"</td>
  </tr>
    <tr>
    <td><code>num_range("x", 1:3)</code></td>
    <td> matches "x1", "x2" and "x3"</td>
  </tr>
</table>

Select: Helper functions example
=================================================
- To select columns whose names start with 'arr':

```r
select(flights, starts_with("arr"))
```

```
# A tibble: 336,776 x 2
   arr_time arr_delay
      <int>     <dbl>
 1      830        11
 2      850        20
 3      923        33
 4     1004       -18
 5      812       -25
 6      740        12
 7      913        19
 8      709       -14
 9      838        -8
10      753         8
# … with 336,766 more rows
```

Module completion checklist
=================================================
<table>
  <tr>
    <th>Objective</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Select specific variables, sometimes using specific rules, using the select command</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
  <tr>
    <td>Derive new variables from the existing variables using the mutate and transmute commands</td>
    <td></td>
  </tr>
</table>

Mutate
=================================================
:::::: {.columns}
::: {.column width="50%"}
- `mutate()` is an essential function of dplyr
- It allows us to <b>create</b> new variables using the current data and <b>append</b> these variables to the existing dataframe


```r
?dplyr::mutate

mutate(df,       # <- dataframe 
       new_col1, # <- rule(s) for the new column
       ...)
```


- <b>Note:</b> `mutate()` always adds columns to the end of the dataset, so make sure you are able to see the last columns

:::
::: {.column width="50%"}

![full-width](/opt/atlassian/pipelines/agent/build/dependencies/img/mutate.png)


:::
::::::
First - create a new dataset
=================================================
- Create the dataset using `select()`


```r
# Let's select columns of `flights` data frame and save them as `flights_sml`.
flights_sml = select(flights,            #<- specify data fra,e
                     year:day,           #<- specify range of columns to include
                     ends_with("delay"), #<- find all columns that end with `delay`
                     distance,           #<- select `distance` column
                     air_time)           #<- select `air_time` column
flights_sml
```

```
# A tibble: 336,776 x 7
    year month   day dep_delay arr_delay distance air_time
   <int> <int> <int>     <dbl>     <dbl>    <dbl>    <dbl>
 1  2013     1     1         2        11     1400      227
 2  2013     1     1         4        20     1416      227
 3  2013     1     1         2        33     1089      160
 4  2013     1     1        -1       -18     1576      183
 5  2013     1     1        -6       -25      762      116
 6  2013     1     1        -4        12      719      150
 7  2013     1     1        -5        19     1065      158
 8  2013     1     1        -3       -14      229       53
 9  2013     1     1        -3        -8      944      140
10  2013     1     1        -2         8      733      138
# … with 336,766 more rows
```

Mutate - arguments
=================================================
- The first argument is the dataframe
- The following arguments are the columns we would like to add to the data frame


```r
# Add two columns `gain` and `speed` to `flights_sml`. 
mutate(flights_sml,                      #<- specify the data frame
       gain = arr_delay - dep_delay,     #<- create `gain` column by subtracting departure delay 
                                         #   from arrival delay
       speed = distance / air_time * 60) #<- create `speed` from distance and air time columns
```

```
# A tibble: 336,776 x 9
    year month   day dep_delay arr_delay distance air_time  gain speed
   <int> <int> <int>     <dbl>     <dbl>    <dbl>    <dbl> <dbl> <dbl>
 1  2013     1     1         2        11     1400      227     9  370.
 2  2013     1     1         4        20     1416      227    16  374.
 3  2013     1     1         2        33     1089      160    31  408.
 4  2013     1     1        -1       -18     1576      183   -17  517.
 5  2013     1     1        -6       -25      762      116   -19  394.
 6  2013     1     1        -4        12      719      150    16  288.
 7  2013     1     1        -5        19     1065      158    24  404.
 8  2013     1     1        -3       -14      229       53   -11  259.
 9  2013     1     1        -3        -8      944      140    -5  405.
10  2013     1     1        -2         8      733      138    10  319.
# … with 336,766 more rows
```

Transmute
=================================================
:::::: {.columns}
::: {.column width="50%"}
- `transmute()` is a function that does the same thing as `mutate()` ~~except it will
 only keep the new columns~~

```r
transmute(df,       # <- dataframe 
          new_col1, # <- rule(s) for new column
          ...) 
```


- The first argument is the dataframe
- The following arguments are the columns that will be included in your new data frame

:::
::: {.column width="50%"}

![full-width](/opt/atlassian/pipelines/agent/build/dependencies/img/transmute.png)

:::
::::::
Transmute example
=================================================
- With the same arguments as in the `mutate()` example, we can see `transmute()` function only returns new columns


```r
# Add two columns `gain` and `speed` to `flights_sml`. 
transmute(flights_sml,                      #<- specify the data frame
          gain = arr_delay - dep_delay,     #<- create `gain` column by subtracting departure delay 
                                            #   from arrival delay
          speed = distance / air_time * 60) #<- create `speed` from distance and air time columns
```

```
# A tibble: 336,776 x 2
    gain speed
   <dbl> <dbl>
 1     9  370.
 2    16  374.
 3    31  408.
 4   -17  517.
 5   -19  394.
 6    16  288.
 7    24  404.
 8   -11  259.
 9    -5  405.
10    10  319.
# … with 336,766 more rows
```


Mutate and transmute - useful functions
=================================================
- When creating new variables with `mutate/transmute`, there are many helpful widgets and functions that can assist in creating interesting features:

<table>
  <tr>
    <th>Useful Functions</th>
    <th>Explanation</th>
  </tr>
  <tr>
    <td><code>+, -, *, /, ^</code> </td>
    <td>all mathematical operators can be used on variables </td>
  </tr>
  <tr>
    <td><code>log, log2, log10</code></td>
    <td>logarithmic functions for variable transformation can be used</td>
  </tr>
  <tr>
    <td><code>%/%</code> and <code> %% </code></td>
    <td>modulus and remainder are useful when converting time</td>
  </tr>
  <tr>
    <td><code>lag(x)</code> and <code>lead(x)</code></td>
    <td> lag and lead allow reference to leading or lagging values - useful for detecting changes in values.</td>
  </tr>
    <tr>
    <td><code>cumsum(x)</code>,<code>cummean(x)</code>, <code>cummax(x)</code>,<code>cumprod(x)</code></td>
    <td> cumulative, running functions, mins, max, prod, mean, etc.</td>
  </tr>
</table>

Mutate and transmute - useful functions (cont'd)
=================================================
:::::: {.columns}
::: {.column width="50%"}

- ~~Ranking functions~~ are very helpful in data manipulation
- There are several within the `dplyr` package such as `row_number()`, `ntile()` and `dense_rank()`


```r
# Check for detailed documentation
rank_function(x) # <- one of rank functions with
                 #    a vector of values to rank  
```


:::
::: {.column width="50%"}
![Ranking](/opt/atlassian/pipelines/agent/build/dependencies/img/rank.png)

:::
::::::
Knowledge check
=================================================
![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/knowledge_check.png)




Exercise
=================================================
<br>
<div style="text-align:center;">
You are now ready to try Tasks 13-18 in the Exercise for this topic
</div>







![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/bear_slide.png)


Module completion checklist
=================================================
<table>
  <tr>
    <th>Objective</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Select specific variables, sometimes using specific rules, using the select command</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
  <tr>
    <td>Derive new variables from the existing variables using the mutate and transmute commands</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
</table>

Data Wrangling: Topic summary
=================================================
In this part of the course, we have covered:

- Data wrangling basics
- Use dplyr for data wrangling


Congratulations on completing this module!
=================================================
![icon-left-bottom](/opt/atlassian/pipelines/agent/build/dependencies/img/circles-crayon-purple.png)
