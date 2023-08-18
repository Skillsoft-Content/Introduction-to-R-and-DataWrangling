---
title: 'Data Wrangling in R - Data Wrangling - 3'
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





Warm-up: review activity 
=================================================
- Match each term to the correct definition below, and share responses in the chat (ex: "1,E" to match the first function to the definition labelled "E")

:::::: {.columns}
::: {.column width="50%"}

1. `filter`
2. `arrange`
3. `select`
4. `mutate`
5. `summarize`
6. `group_by`

:::
::: {.column width="50%"}

<b>~~A.~~</b> Pick variables by their names
<br>
<b>~~B.~~</b> Collapse many values down to a single summary
<br>
<b>~~C.~~</b> Reorder the rows
<br>
<b>~~D.~~</b> Allows the above functions to operate on a dataset group by group
<br>
<b>~~E.~~</b> Pick observations by their value
<br>
<b>~~F.~~</b> Create new variables with functions of existing variables

:::
::::::


Warm-up: Review activity answers 
=================================================
- The answers are: <b>~~1,E; 2,C; 3,A; 4,F; 5,B; 6,D~~</b>

<br>

<table>
  <tr>
    <th>Function</th>
    <th>Use Case</th>
  </tr>
  <tr>
    <td><code>filter</code></td>
    <td> Pick observations by their value </td>
  </tr>
  <tr>
    <td><code>arrange</code></td>
    <td>Reorder the rows</td>
  </tr>
  <tr>
    <td><code>select</code></td>
    <td>Pick variables by their names</td>
  </tr>
    <tr>
    <td><code>mutate</code></td>
    <td>Create new variables with functions of existing variables</td>
  </tr>
   <tr>
    <td><code>summarize</code></td>
    <td>Collapse many values down to a single summary</td>
  </tr>
  <tr>
    <td><code>group_by</code></td>
    <td>Allows the above functions to operate on a dataset group by group</td>
  </tr>
</table>

<br>

- Any questions?



Module completion checklist
=================================================
<table>
  <tr>
    <th>Objective</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Apply the filter function to subset data</td>
    <td></td>
  </tr>
  <tr>
    <td>Rank data using the arrange function</td>
    <td></td>
  </tr>
</table>


Getting started with dplyr
=================================================
- Now that we have dplyr installed and the nycflights13 dataset loaded, we can start transforming our dataset
- Our goal is to get exposure to the core dplyr syntax and practice using some of the major function verbs
- For now, we will focus on just two:
  - `filter()`, to subset the observations in the data 
  - `arrange()`, to reorder the observations in the data

Filter 
=================================================
:::::: {.columns}
::: {.column width="55%"}
- `filter` allows you to subset observations based on their values
- Basic use cases for `filter` function include:
  
  - Subsetting the data to include flights from January 2013
  - Subsetting the data that contain missing values
  


  

```r
# Check for detailed documentation
?dplyr::filter

# Use cases for `filter` function

filter(df,           #<- dataframe 
       filter_cond1, #<- subsetting rule(s)   
       ...)          #<- other arguments
```


:::
::: {.column width="45%"}

![full-width](/opt/atlassian/pipelines/agent/build/dependencies/img/filter.png)


:::
::::::
Filter 
=================================================
- Let's say you would like to see all flights from January 2013
- Using `filter`, pass the original dataframe followed by filtering criteria 

```r
# Load the flights dataset into the environment.
data(flights)

# Filter `flights` data frame to display all records from January (month == 1) of 2013 (year == 2013).
filter(flights,      #<- set data 
       month == 1,   #<- filter by month 
       year == 2013) #<- filter by year
```

```
# A tibble: 27,004 x 19
    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
 1  2013     1     1      517            515         2      830            819
 2  2013     1     1      533            529         4      850            830
 3  2013     1     1      542            540         2      923            850
 4  2013     1     1      544            545        -1     1004           1022
 5  2013     1     1      554            600        -6      812            837
 6  2013     1     1      554            558        -4      740            728
 7  2013     1     1      555            600        -5      913            854
 8  2013     1     1      557            600        -3      709            723
 9  2013     1     1      557            600        -3      838            846
10  2013     1     1      558            600        -2      753            745
# … with 26,994 more rows, and 11 more variables: arr_delay <dbl>,
#   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```


Filter 
=================================================
- If you want to build on top of the filtered dataset, you will need to save your new subset to a new variable and perform further operations on this new subset

```r
# You will have to make sure to save the subset. To do this, use `=`.
filter_flights = filter(flights, month == 1, year == 2013)

# View your output.
filter_flights
```

```
# A tibble: 27,004 x 19
    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
 1  2013     1     1      517            515         2      830            819
 2  2013     1     1      533            529         4      850            830
 3  2013     1     1      542            540         2      923            850
 4  2013     1     1      544            545        -1     1004           1022
 5  2013     1     1      554            600        -6      812            837
 6  2013     1     1      554            558        -4      740            728
 7  2013     1     1      555            600        -5      913            854
 8  2013     1     1      557            600        -3      709            723
 9  2013     1     1      557            600        -3      838            846
10  2013     1     1      558            600        -2      753            745
# … with 26,994 more rows, and 11 more variables: arr_delay <dbl>,
#   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

Filter options
=================================================
- You can use the standard filtering operations when working with integer data types:

<table>
  <tr>
    <th>Operation</th>
    <th>Use Case</th>
    <th>Example</th>
  </tr>
  <tr>
    <td>`>`</td>
    <td> Greater than </td>
    <td> 6 > 4 </td>
  </tr>
  <tr>
    <td>`>=`</td>
    <td>Greater than or equal to</td>
    <td>4 >= 4 </td>
  </tr>
  <tr>
    <td> `<` </td>
    <td> Less than </td>
    <td> 4 < 6 </td>
  </tr>
    <tr>
    <td> `<=` </td>
    <td>Less than or equal to</td>
    <td> 4 <= 4 </td>
  </tr>
    <tr>
    <td> `!=` </td>
    <td>Not equal to</td>
    <td> 4 != 6 </td>
  </tr>
   <tr>
    <td>`==`</td>
    <td>Equal to</td>
    <td> 4 == 4 </td>
  </tr>
</table>

Filter options (cont'd)
=================================================
- And more general operators:

<table>
  <tr>
    <th>Operation</th>
    <th>Use Case</th>
    <th>Example</th>
  </tr>
  <tr>
    <td> `|` </td>
    <td> either can be true to satisfy </td>
    <td> x == 4 | x == 12,  x==2 | x==13 </td>
  </tr>
  <tr>
    <td> `&` </td>
    <td>and, both need to be true</td>
    <td> x == 4 & y == 2 </td>
  </tr>
  <tr>
    <td>  `!` </td>
    <td> Not true, inverse selection </td>
    <td> x != 4 </td>
  </tr>
    <tr>
    <td> `%in%` </td>
    <td> value in the following list of values</td>
    <td> x %in% c(4,16,32) </td>
</table>


Filter - logical operators
=================================================
![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/set_theory.png)


Filter - examples of logical operators
=================================================
- What if we want to see all flights from January ~~and~~ on the 25th?


```r
# Filter with just `&`.
filter(flights, month == 1 & day == 25)
```

```
# A tibble: 922 x 19
    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
 1  2013     1    25       15           1815       360      208           1958
 2  2013     1    25       17           2249        88      119           2357
 3  2013     1    25       26           1850       336      225           2055
 4  2013     1    25      123           2000       323      229           2101
 5  2013     1    25      123           2029       294      215           2140
 6  2013     1    25      456            500        -4      632            648
 7  2013     1    25      519            525        -6      804            820
 8  2013     1    25      527            530        -3      820            829
 9  2013     1    25      535            540        -5      826            850
10  2013     1    25      539            540        -1     1006           1017
# … with 912 more rows, and 11 more variables: arr_delay <dbl>, carrier <chr>,
#   flight <int>, tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>,
#   distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```
- <i><b>Note:</b> After running each example, we will record the number of rows. This will help illustrate each operator and how different a simple change of one boolean operator can have on the dataset. Total number of rows should be 922</i>


Filter - examples of logical operators (cont'd)
=================================================
- What if we want to see all flights, but ~~exclude~~ those from January and those on the 25th?

```r
# Filter with `!`.
filter(flights, month != 1 & day != 25)
```

```
# A tibble: 299,597 x 19
    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
 1  2013    10     1      447            500       -13      614            648
 2  2013    10     1      522            517         5      735            757
 3  2013    10     1      536            545        -9      809            855
 4  2013    10     1      539            545        -6      801            827
 5  2013    10     1      539            545        -6      917            933
 6  2013    10     1      544            550        -6      912            932
 7  2013    10     1      549            600       -11      653            716
 8  2013    10     1      550            600       -10      648            700
 9  2013    10     1      550            600       -10      649            659
10  2013    10     1      551            600        -9      727            730
# … with 299,587 more rows, and 11 more variables: arr_delay <dbl>,
#   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

- <i>Here we are looking for all flights that are not in January and not on the 25th; total number of rows should be 299,597</i>

Filter - examples of logical operators (cont'd)
=================================================

```r
# Filter with `%in%`.
filter(flights, month %in% c(1, 2) & day == 25)
```

```
# A tibble: 1,883 x 19
    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
 1  2013     1    25       15           1815       360      208           1958
 2  2013     1    25       17           2249        88      119           2357
 3  2013     1    25       26           1850       336      225           2055
 4  2013     1    25      123           2000       323      229           2101
 5  2013     1    25      123           2029       294      215           2140
 6  2013     1    25      456            500        -4      632            648
 7  2013     1    25      519            525        -6      804            820
 8  2013     1    25      527            530        -3      820            829
 9  2013     1    25      535            540        -5      826            850
10  2013     1    25      539            540        -1     1006           1017
# … with 1,873 more rows, and 11 more variables: arr_delay <dbl>,
#   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

- <i>This is a combination of `&` and `%in%` subsetting all flights from January and February that are on the 25th; number of rows should be 1,883</i>

<div class = "notes">
As you can see, there are multiple combinations using boolean operators.
The thing you must be careful about is the order and placing operators within parenthesis. 
One wrong move and you may have a query that means something very different than what
you were looking for.
You could also use in c(1:3) as an example
</div>

Using filter with NA values
=================================================
- `filter` only includes rows where the condition is TRUE; it ~~excludes~~ both FALSE and NA values
- If you want to preserve missing values, ask for them explicitly


```r
# Create a data frame with 2 columns.
NA_df = data.frame(x = c(1, NA, 2),  #<- column x with 3 entries with 1 NA
                   y = c(1, 2, 3))   #<- column y with 3 entries

# Filter without specifying anything regarding NAs.
filter(NA_df, x >= 1)
```

```
  x y
1 1 1
2 2 3
```

```r
# Filter with specifying to keep rows if there is an NA.
filter(NA_df, is.na(x) | x >= 1)
```

```
   x y
1  1 1
2 NA 2
3  2 3
```


Module completion checklist
=================================================
<table>
  <tr>
    <th>Objective</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Apply the filter function to subset data</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
  <tr>
    <td>Rank data using the arrange function</td>
    <td></td>
  </tr>
</table>

Arrange
=================================================
:::::: {.columns}
::: {.column width="50%"}

- `arrange` is used to reorder the observations within the specified column(s) 
- It is the equivalent of `sort` in SAS or `order by` in SQL


```r
# Check for detailed documentation
?dplyr::arrange

# Use cases for `arrange` function
arrange(df,            #<- data frame 
        arrange_cond1, #<- column by which 
                       #   to arrange
        ...)           #<- other args.
```


:::
::: {.column width="50%"}

![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/arrange.png)


:::
::::::
Arrange example
=================================================
- When using multiple columns with `arrange`, the additional columns will be used to break ties in the values of preceding columns

```r
# Arrange data by year, then month, and then day.
arrange(flights, #<- data frame we want to arrange
        year,    #<- 1st: arrange by year
        month,   #<- 2nd: arrange by month 
        day)     #<- 3rd: arrange by day
```

```
# A tibble: 336,776 x 19
    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
 1  2013     1     1      517            515         2      830            819
 2  2013     1     1      533            529         4      850            830
 3  2013     1     1      542            540         2      923            850
 4  2013     1     1      544            545        -1     1004           1022
 5  2013     1     1      554            600        -6      812            837
 6  2013     1     1      554            558        -4      740            728
 7  2013     1     1      555            600        -5      913            854
 8  2013     1     1      557            600        -3      709            723
 9  2013     1     1      557            600        -3      838            846
10  2013     1     1      558            600        -2      753            745
# … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
#   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```


Arrange options
=================================================
- `arrange` by default sorts everything in ascending order; to arrange in descending, use <b>`desc`</b>
- You can now see that the month at the top of the dataset is ~~December~~ (i.e., 12th month)


```r
# Arrange data by year, descending month and then day.
arrange(flights,     #<- data frame we want to arrange
        year,        #<- 1st: arrange by year
        desc(month), #<- 2nd: arrange by month in descending order
        day)         #<- 3rd: arrange by day 
```

```
# A tibble: 336,776 x 19
    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
 1  2013    12     1       13           2359        14      446            445
 2  2013    12     1       17           2359        18      443            437
 3  2013    12     1      453            500        -7      636            651
 4  2013    12     1      520            515         5      749            808
 5  2013    12     1      536            540        -4      845            850
 6  2013    12     1      540            550       -10     1005           1027
 7  2013    12     1      541            545        -4      734            755
 8  2013    12     1      546            545         1      826            835
 9  2013    12     1      549            600       -11      648            659
10  2013    12     1      550            600       -10      825            854
# … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
#   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
#   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```


Arrange with NA values
=================================================
- Missing values are ~~always~~ sorted at the end


```r
# Arrange data with missing values.
arrange(NA_df, x)
```

```
   x y
1  1 1
2  2 3
3 NA 2
```

```r
# Even when we use `desc` the `NA` is taken to the last row.
arrange(NA_df, desc(x))
```

```
   x y
1  2 3
2  1 1
3 NA 2
```

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
    <td>Apply the filter function to subset data</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
  <tr>
    <td>Rank data using the arrange function</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
</table>

 
Congratulations on completing this module!
=================================================
<br>
<div style="text-align:center;">
You are now ready to try Tasks 6-12 in the Exercise for this topic
</div>
![icon-left-bottom](/opt/atlassian/pipelines/agent/build/dependencies/img/circles-crayon-purple.png)
