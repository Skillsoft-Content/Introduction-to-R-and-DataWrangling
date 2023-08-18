---
title: 'Data Summarization and Transformation - 2'
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
    <th>Topic</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Transform messy data to tidy data using tidyr package</td>
    <td></td>
  </tr>
    <tr>
    <td>Manipulate columns by using the separate and unite functions</td>
    <td></td>
  </tr>
</table>

Using tidyr to tidy data
=================================================
- Tidy data is defined by three main properties:
  - Each ~~variable~~ must have its own <b>column</b>
  - Each ~~observation~~ must have its own <b>row</b>
  - Each ~~value~~ must have its own <b>cell</b>

- Using the tidyr package can help us tidy our wrangled data
- The most important functions for restructuring rows and columns involve a `pivot`


pivot_longer()
=================================================
:::::: {.columns}
::: {.column width="50%"}
- `pivot_longer()` pulls multiple columns into one new variable 



 

```r
?tidyr::pivot_longer

pivot_longer(cols,        #<- columns to convert
             names_to,    #<- name of new key column
             values_to)   #<- name of new value column
```
:::
::: {.column width="50%"}
![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/pivot_longer.png)

:::
::::::
pivot_longer parameters
=================================================
:::::: {.columns}
::: {.column width="60%"}
We need three parameters for `pivot_longer()`:

  - The ~~set of columns~~ that represent the values 
  - The ~~name of the variable~~ (which we decide upon) that represents those values, or the `key`
  - The ~~name of the variable~~ (which we decide upon) that represents the values that are currently within the value columns, or the `value`
  
:::
::: {.column width="40%"}

![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/checklist.png)

:::
::::::

pivot_longer example
=================================================
:::::: {.columns}
::: {.column width="50%"}
- Let’s look at `table4a` data from the WHO tuberculosis dataset



```r
table4a
```

```
# A tibble: 3 x 3
  country     `1999` `2000`
* <chr>        <int>  <int>
1 Afghanistan    745   2666
2 Brazil       37737  80488
3 China       212258 213766
```
:::
::: {.column width="50%"}
- Notice that the second and third column are actually both values (1999 and 2000) of a single hypothetical variable, year
- We can use pivot_longer to combine these two columns into a single column, year
- We can also create a new column, cases, to contain the count that currently appears in the 1999 and 2000 columns

   
:::
::::::

pivot_longer example contd
=================================================
- Let's pivot the `table4a` data frame from a wide format to a long format

```r
# Gather the `table4a` data frame to make it tidy.
table4a %>%    #<- set the data frame and use pipe to use it as input into `pivot_longer`
  pivot_longer(cols = `1999`:`2000`, #<- set columns to convert
               names_to = "year",    #<- set `year` column as a key
               values_to = "cases")  #<- set `cases` column for the values
```

```
# A tibble: 6 x 3
  country     year   cases
  <chr>       <chr>  <int>
1 Afghanistan 1999     745
2 Afghanistan 2000    2666
3 Brazil      1999   37737
4 Brazil      2000   80488
5 China       1999  212258
6 China       2000  213766
```

- ~~Reminder:~~ You can use the pipe (`%>%`) in all the packages within `tidyverse`!

<div class = "notes">
We need three parameters to describe the operation of `gather`:

1. The set of the columns that represent the values  (i.e. `1999` and `2000` in our example)
2. The name of the variable (which we decide on) that represents those values, or the `key` (i.e. `year` in our example)
3. The name of the variable (which we decide on) that represents the values that are currently within the value columns, or the `value` (i.e. `cases` in our example) 
Also note that `magritrr` is a package that you can download and then you can use the pipe function outside of tidyverse packages in combination with other libraries or just base R functions.
</div>

pivot_longer example specifying a range
=================================================
- Let's modify the same example, this time using the colon syntax to specify range
- Note that the code substitutes `2:3` instead of column names


```r
# Gather the `table4a` data frame to make it tidy.
table4a %>%    #<- set the data frame and use pipe to use it as input into `pivot_longer`
  pivot_longer(cols = 2:3,           #<- set columns to convert
               names_to = "year",    #<- set `year` column as a key
               values_to = "cases")  #<- set `cases` column for the values
```

```
# A tibble: 6 x 3
  country     year   cases
  <chr>       <chr>  <int>
1 Afghanistan 1999     745
2 Afghanistan 2000    2666
3 Brazil      1999   37737
4 Brazil      2000   80488
5 China       1999  212258
6 China       2000  213766
```


<div class = "notes">
Notice that the results in Example a and Example b are identical, in the first one we used the names of the columns explicitly to tell `gather` which variables to use and in the second one we specified the range of the columns to gather.
Either way is correct, but providing a range of columns is more of a shorthand. If you are using the range of the columns, be sure to check the indices of columns and whether you would like to include all of the variables within that range. It may be better sometimes to specify the variables explicitly not to include some undesired columns by mistake!
</div>

 
pivot_wider()
=================================================
:::::: {.columns}
::: {.column width="60%"}

- You use `pivot_wider()` when an observation is scattered across multiple rows
- `pivot_wider()` spreads one column into multiple variables
- `pivot_wider()` is the opposite of `pivot_longer()`


```r
?tidyr::pivot_wider()

pivot_wider(names_from,   #<- name of current key column
            values_from)  #<- name of current value column
```



:::
::: {.column width="40%"}
<br>
![full-width](/opt/atlassian/pipelines/agent/build/dependencies/img/pivot_wider.png)

:::
::::::

pivot_wider parameters
=================================================
:::::: {.columns}
::: {.column width="60%"}

There are two parameters we need to pay attention to when using `pivot_wider`:

  - The ~~column~~ that contains the variable names, the `names_from` column 
  - The ~~column~~ that contains the values for the multiple variables, the `values_from` column
  
:::
::: {.column width="40%"}

![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/checklist.png)

:::
::::::


pivot_wider example
=================================================
:::::: {.columns}
::: {.column width="50%"}

- Use `table2` as the initial data frame
- The type column currently contains multiple categories of information, `cases` and `population`
- To reshape and tidy this table, we might create a `cases` column and a `population` column


:::
::: {.column width="50%"}



```r
# Let's look at `table2` inbuilt data.
table2
```

```
# A tibble: 12 x 4
   country      year type            count
   <chr>       <int> <chr>           <int>
 1 Afghanistan  1999 cases             745
 2 Afghanistan  1999 population   19987071
 3 Afghanistan  2000 cases            2666
 4 Afghanistan  2000 population   20595360
 5 Brazil       1999 cases           37737
 6 Brazil       1999 population  172006362
 7 Brazil       2000 cases           80488
 8 Brazil       2000 population  174504898
 9 China        1999 cases          212258
10 China        1999 population 1272915272
11 China        2000 cases          213766
12 China        2000 population 1280428583
```

:::
::::::

pivot_wider example contd
=================================================
- Let's pivot the `table2` data frame from a long format to a wide format
- Use `pivot_wider()` with 2 main parameters:
  - The `type`, which contains the variables
  - The `count`, which contains the values for each of the rows of the variables in the `type` column

```r
# Spread the data
# Pass data to spread with pipe.
table2 %>%      
  pivot_wider(names_from = type,      
              values_from = count)
```

```
# A tibble: 6 x 4
  country      year  cases population
  <chr>       <int>  <int>      <int>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3 Brazil       1999  37737  172006362
4 Brazil       2000  80488  174504898
5 China        1999 212258 1272915272
6 China        2000 213766 1280428583
```

Module completion checklist
=================================================
<table>
  <tr>
    <th>Topic</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Transform messy data to tidy data using tidyr package</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
  <tr>
    <td>Manipulate columns by using the separate and unite functions</td>
    <td></td>
  </tr>
</table>


Separating and uniting
=================================================
:::::: {.columns}
::: {.column width="50%"}

- We can also use **tidyr** to address a single variable, a single column, containing multiple
pieces of information


```r
table3
```

```
# A tibble: 6 x 3
  country      year rate             
* <chr>       <int> <chr>            
1 Afghanistan  1999 745/19987071     
2 Afghanistan  2000 2666/20595360    
3 Brazil       1999 37737/172006362  
4 Brazil       2000 80488/174504898  
5 China        1999 212258/1272915272
6 China        2000 213766/1280428583
```

:::
::: {.column width="50%"}
- For instance, `table3` shows both cases and population as a single rate
- We can use the function `separate()` to extract the values into separate columns
- We will also practice using the complementary function, `unite()`

:::
::::::
separate() parameters
=================================================
:::::: {.columns}
::: {.column width="60%"}

- `separate()` separates a single character column into multiple columns and takes two arguments:
  - The column to be separated
  - What to separate the variable into, like into = c("var_1", "var_2")


```r
?tidyr::separate

separate(df,   #<- data frame 
         col,  #<- name of column to separate 
         into) #<- name of new variables to 
               #   create as a character vector
```

:::
::: {.column width="40%"}
![full-width](/opt/atlassian/pipelines/agent/build/dependencies/img/separate.png)

:::
::::::
separate example
=================================================
- Let’s try out `separate()` on `table3` to create `cases` and `population` columns using the pipe operator

```r
# Using `table3` separate its `rate` column into two.
table3 %>%                   #<- set data frame and pass it to next function with pipe           
  separate(rate,                   #<- separate `rate`
           into = c("cases",       #<- into column `cases`, and
                    "population")) #<-      column `population`
```

```
# A tibble: 6 x 4
  country      year cases  population
  <chr>       <int> <chr>  <chr>     
1 Afghanistan  1999 745    19987071  
2 Afghanistan  2000 2666   20595360  
3 Brazil       1999 37737  172006362 
4 Brazil       2000 80488  174504898 
5 China        1999 212258 1272915272
6 China        2000 213766 1280428583
```

separate example using `sep`
=================================================
- By default, `separate()` will operate on any non alpha-numeric character 
- However, it is also possible to specify the character by which to split using the `sep=` parameter

```r
# Using `table3` separate its `rate` column into two.
table3 %>% 
  separate(rate, 
           into = c("cases", 
                    "population"), 
           sep = "/")              #<- set the separating character to `/`
```

```
# A tibble: 6 x 4
  country      year cases  population
  <chr>       <int> <chr>  <chr>     
1 Afghanistan  1999 745    19987071  
2 Afghanistan  2000 2666   20595360  
3 Brazil       1999 37737  172006362 
4 Brazil       2000 80488  174504898 
5 China        1999 212258 1272915272
6 China        2000 213766 1280428583
```

separate example using `sep`
=================================================
- Next, let's use the `sep` parameter to separate the year column on the <b>character index</b> 
- If we split the `year` column at index 2, we can create two new columns: `century` and `year`


```r
# Using `table3` separate its `year` column into two.
table3 %>%
  separate(year,              #<- separate `year`
           into= c("century", #<- into two columns: `century`, and 
                   "year"),   #<-                   `year`
           sep = 2)           #<- set the separator at index = 2
```

```
# A tibble: 6 x 4
  country     century year  rate             
  <chr>       <chr>   <chr> <chr>            
1 Afghanistan 19      99    745/19987071     
2 Afghanistan 20      00    2666/20595360    
3 Brazil      19      99    37737/172006362  
4 Brazil      20      00    80488/174504898  
5 China       19      99    212258/1272915272
6 China       20      00    213766/1280428583
```
<div class="notes">
Note: `sep` is a regular expression - we cover regular expressions in the text mining course
</div>

Data type conversions using separate()
=================================================
:::::: {.columns}
::: {.column width="50%"}
- When using `separate()`, the data type of the original column will be preserved

```r
# The new columns 
# are now also characters.
table3 %>%
  separate(rate, into = c("cases", "population"))
```

```
# A tibble: 6 x 4
  country      year cases  population
  <chr>       <int> <chr>  <chr>     
1 Afghanistan  1999 745    19987071  
2 Afghanistan  2000 2666   20595360  
3 Brazil       1999 37737  172006362 
4 Brazil       2000 80488  174504898 
5 China        1999 212258 1272915272
6 China        2000 213766 1280428583
```

:::
::: {.column width="50%"}
- However, `separate()` can be instructed to convert to what it thinks the data types of new columns should be

```r
table3 %>%
  separate(rate, into = c("cases", "population"), convert = TRUE)
```

```
# A tibble: 6 x 4
  country      year  cases population
  <chr>       <int>  <int>      <int>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3 Brazil       1999  37737  172006362
4 Brazil       2000  80488  174504898
5 China        1999 212258 1272915272
6 China        2000 213766 1280428583
```


:::
::::::
unite()
=================================================
:::::: {.columns}
::: {.column width="50%"}
- `unite()` combines multiple character columns into a single column
- `unite()` is the inverse of separate 



```r
?tidyr::unite

unite(df,  #<- data frame 
      col, #<- name of column to unite 
      sep) #<- separator to use
```

:::
::: {.column width="50%"}

![full-width](/opt/atlassian/pipelines/agent/build/dependencies/img/unite.png)

:::
::::::

unite parameters
=================================================
:::::: {.columns}
::: {.column width="60%"}
- `unite()` separates a single character column into multiple columns and takes two arguments:
  - The name of the new column
  - Columns to unite, ex c("var_1", "var_2")

:::
::: {.column width="40%"}

![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/checklist.png)


:::
::::::

unite example
=================================================
- To demonstrate how `unite()` works, let’s undo the separation of century and year in `table3`

:::::: {.columns}
::: {.column width="50%"}


```r
# Let's separate the `table3`'s `year` column into `century` and `year` first.
ex_table = table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)
ex_table
```

```
# A tibble: 6 x 4
  country     century year  rate             
  <chr>       <chr>   <chr> <chr>            
1 Afghanistan 19      99    745/19987071     
2 Afghanistan 20      00    2666/20595360    
3 Brazil      19      99    37737/172006362  
4 Brazil      20      00    80488/174504898  
5 China       19      99    212258/1272915272
6 China       20      00    213766/1280428583
```

:::
::: {.column width="50%"}

```r
# Now we use `unite` to combine the two new columns back into one.
# By default, unite will combine columns using `_` so we can use `sep` to specify that we 
# do not want anything between the two columns when combined into one cell.
ex_table %>%      #<- specify the data frame to pipe into `unite`
  unite(time,     #<- set the column `time` for combined values
        century,  #<- 1st column to unite
        year,     #<- 2nd column to unite
        sep = "") #<- set the separator to an empty string 
```

```
# A tibble: 6 x 3
  country     time  rate             
  <chr>       <chr> <chr>            
1 Afghanistan 1999  745/19987071     
2 Afghanistan 2000  2666/20595360    
3 Brazil      1999  37737/172006362  
4 Brazil      2000  80488/174504898  
5 China       1999  212258/1272915272
6 China       2000  213766/1280428583
```


:::
::::::

Knowledge check
=================================================
![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/knowledge_check.png)



Exercise 
=================================================
![centered](/opt/atlassian/pipelines/agent/build/dependencies/img/exercise.png)

<br>
<div style="text-align:center;">
You are now ready to try Tasks 4-9 in the Exercise for this topic
</div>








Module completion checklist
=================================================
<table>
  <tr>
    <th>Topic</th>
    <th>Complete</th>
  </tr>
  <tr>
    <td>Transform messy data to tidy data using tidyr package</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
  <tr>
    <td>Manipulate columns by using the separate and unite functions</td>
    <td><p class="centered-text"><b class="green-emphasis" style="font-size: 42px;">&#10004;</b></p></td>
  </tr>
</table>

Data Summarization and Transformation: Topic summary
=================================================
In this part of the course, we have covered:

- Tidy data best practices
- Transform data with tidyr

Congratulations on completing this module!
=================================================
![icon-left-bottom](/opt/atlassian/pipelines/agent/build/dependencies/img/circles-crayon-purple.png)
