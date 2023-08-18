#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## DATAWRANGLINGINR/DATAWRANGLING/DATAWRANGLINGINR DATAWRANGLING 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 8: Directory settings  ####

install.packages("box")
# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 9: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 10: Loading data set  ####

# Read CSV file called "ChemicalManufacturingProcess.csv"
CMP = read.csv(file = file.path(data_dir,"/ChemicalManufacturingProcess.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors

# View CMP dataset in tabular data explorer.
View(CMP)


#=================================================-
#### Slide 13: Subsetting data  ####

# Let's make a vector of column indices we would like to save.
column_ids = c(1:4,  #<- concatenate a range of ids
               14:16)#<- with another a range of ids
column_ids           #<- verify that we have the correct set of columns

# Let's save the subset into a new variable and look at its structure.
CMP_subset = CMP[ , column_ids]
str(CMP_subset)


#=================================================-
#### Slide 16: Summary statistics: CMP  ####

?summary

summary(data) #<- Either the data frame or single column 
summary(CMP_subset) #<- getting summary statistics of CMP_subset


#=================================================-
#### Slide 18: Working with missing data: max values  ####

# Let's try and compute the maximum value of the 1st manufacturing process.
max_process01 = max(CMP_subset$ManufacturingProcess01)
max_process01
max_process02 = max(CMP_subset$ManufacturingProcess01, na.rm = TRUE)
max_process02


#=================================================-
#### Slide 20: Working with missing data  ####

# Let's take a look at `ManufacturingProcess01`
# and see if any of the values in it are `NA`.
is.na(CMP_subset$ManufacturingProcess01)


#=================================================-
#### Slide 21: Working with missing data (cont'd)  ####

?which



#=================================================-
#### Slide 22: Working with missing data: Identifying NA values  ####

# Let's save this vector of logical values to a variable.
is_na_MP01 = is.na(CMP_subset$ManufacturingProcess01)

# To determine WHICH elements in the vector are `TRUE`and are NA, we will use `which` function.

# Since we already have a vector of `TRUE` or `FALSE` logical values
# we only have to give it to `which` and it will return all of the
# indices of values that are `TRUE`.
which(is_na_MP01)

# This is also a correct way to set it up.
which(is_na_MP01 == TRUE)


#=================================================-
#### Slide 23: Working with missing data: Locating NA values  ####

# Let's save the index to a variable.
na_id = which(is_na_MP01)
na_id

# Let's view the value at the `na_id` index.
CMP_subset$ManufacturingProcess01[na_id]


#=================================================-
#### Slide 24: Working with missing data: Mean replacement  ####

# Compute the mean of the `ManufacturingProcess01`.
mean_process01 = mean(CMP_subset$ManufacturingProcess01)
mean_process01

# Compute the mean of the `ManufacturingProcess01` and set `na.rm` to `TRUE`.
mean_process01 = mean(CMP_subset$ManufacturingProcess01, na.rm = TRUE)
mean_process01


#=================================================-
#### Slide 25: Working with missing data  ####

# Assign the mean to the entry with the `NA`.
CMP_subset$ManufacturingProcess01[na_id] = mean_process01
CMP_subset$ManufacturingProcess01[na_id]
max_process01 = max(CMP_subset$ManufacturingProcess01)
max_process01


#=================================================-
#### Slide 26: Working with missing data (cont'd)  ####

# Impute missing values of `ManufacturingProcess02` with the mean
is_na = is.na(CMP_subset$ManufacturingProcess02)
na_id = which(is_na)
mean_process02 = mean(CMP_subset$ManufacturingProcess02, na.rm = TRUE)
CMP_subset$ManufacturingProcess02[na_id] = mean_process02


# Impute missing values of `ManufacturingProcess03` with the mean
is_na = is.na(CMP_subset$ManufacturingProcess03)
na_id = which(is_na)
mean_process03 = mean(CMP_subset$ManufacturingProcess03, na.rm = TRUE)
CMP_subset$ManufacturingProcess03[na_id] = mean_process03


#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## DATAWRANGLINGINR/DATAWRANGLING/DATAWRANGLINGINR DATAWRANGLING 2 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 7: Installing packages example  ####

install.packages("tidyverse")   #<- Install package 


#=================================================-
#### Slide 11: Loading Built-in Datasets  ####

install.packages("nycflights13", repos='http://cran.us.r-project.org')
library(nycflights13)


#=================================================-
#### Slide 13: A little more about tidyverse  ####

tidyverse_update()


#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## DATAWRANGLINGINR/DATAWRANGLING/DATAWRANGLINGINR DATAWRANGLING 3 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 5: Filter   ####

# Check for detailed documentation
?dplyr::filter

# Use cases for `filter` function

filter(df,           #<- dataframe 
       filter_cond1, #<- subsetting rule(s)   
       ...)          #<- other arguments


#=================================================-
#### Slide 7: Filter   ####

# You will have to make sure to save the subset. To do this, use `=`.
filter_flights = filter(flights, month == 1, year == 2013)

# View your output.
filter_flights


#=================================================-
#### Slide 11: Filter - examples of logical operators  ####

# Filter with just `&`.
filter(flights, month == 1 & day == 25)


#=================================================-
#### Slide 12: Filter - examples of logical operators (cont'd)  ####

# Filter with `!`.
filter(flights, month != 1 & day != 25)


#=================================================-
#### Slide 13: Filter - examples of logical operators (cont'd)  ####

# Filter with `%in%`.
filter(flights, month %in% c(1, 2) & day == 25)


#=================================================-
#### Slide 14: Using filter with NA values  ####

# Create a data frame with 2 columns.
NA_df = data.frame(x = c(1, NA, 2),  #<- column x with 3 entries with 1 NA
                   y = c(1, 2, 3))   #<- column y with 3 entries

# Filter without specifying anything regarding NAs.
filter(NA_df, x >= 1)

# Filter with specifying to keep rows if there is an NA.
filter(NA_df, is.na(x) | x >= 1)


#=================================================-
#### Slide 16: Arrange  ####

# Check for detailed documentation
?dplyr::arrange

# Use cases for `arrange` function
arrange(df,            #<- data frame 
        arrange_cond1, #<- column by which 
                       #   to arrange
        ...)           #<- other args.


#=================================================-
#### Slide 17: Arrange example  ####

# Arrange data by year, then month, and then day.
arrange(flights, #<- data frame we want to arrange
        year,    #<- 1st: arrange by year
        month,   #<- 2nd: arrange by month 
        day)     #<- 3rd: arrange by day


#=================================================-
#### Slide 18: Arrange options  ####

# Arrange data by year, descending month and then day.
arrange(flights,     #<- data frame we want to arrange
        year,        #<- 1st: arrange by year
        desc(month), #<- 2nd: arrange by month in descending order
        day)         #<- 3rd: arrange by day 


#=================================================-
#### Slide 19: Arrange with NA values  ####

# Arrange data with missing values.
arrange(NA_df, x)

# Even when we use `desc` the `NA` is taken to the last row.
arrange(NA_df, desc(x))



#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## DATAWRANGLINGINR/DATAWRANGLING/DATAWRANGLINGINR DATAWRANGLING 4 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 2: Select  ####

# Check for detailed documentation
?dplyr::select

# Use cases for `select` function
select(df,           #<- dataframe 
       select_cond1, #<- selection rule(s)
       ...)


#=================================================-
#### Slide 3: Select a subset  ####

# Select columns from `flights` data frame.
select(flights, #<- specify the data frame
       year,    #<- specify the 1st column
       month,   #<- specify the 2nd column
       day)     #<- specify the 3rd column
# Select columns from `flights` data frame
select(flights,  #<- specify the data frame
       year:day) #<- specify the range of columns


#=================================================-
#### Slide 4: Select by excluding  ####

# Select multiple columns from `flights` data frame by providing which columns to exclude in selection
select(flights,     #<- specify the data frame
       -(year:day)) #<- specify the range of columns to exclude


#=================================================-
#### Slide 8: Mutate  ####

?dplyr::mutate

mutate(df,       # <- dataframe 
       new_col1, # <- rule(s) for the new column
       ...)


#=================================================-
#### Slide 9: First - create a new dataset  ####

# Let's select columns of `flights` data frame and save them as `flights_sml`.
flights_sml = select(flights,            #<- specify data fra,e
                     year:day,           #<- specify range of columns to include
                     ends_with("delay"), #<- find all columns that end with `delay`
                     distance,           #<- select `distance` column
                     air_time)           #<- select `air_time` column
flights_sml


#=================================================-
#### Slide 10: Mutate - arguments  ####

# Add two columns `gain` and `speed` to `flights_sml`. 
mutate(flights_sml,                      #<- specify the data frame
       gain = arr_delay - dep_delay,     #<- create `gain` column by subtracting departure delay 
                                         #   from arrival delay
       speed = distance / air_time * 60) #<- create `speed` from distance and air time columns


#=================================================-
#### Slide 11: Transmute  ####

transmute(df,       # <- dataframe 
          new_col1, # <- rule(s) for new column
          ...) 


#=================================================-
#### Slide 12: Transmute example  ####

# Add two columns `gain` and `speed` to `flights_sml`. 
transmute(flights_sml,                      #<- specify the data frame
          gain = arr_delay - dep_delay,     #<- create `gain` column by subtracting departure delay 
                                            #   from arrival delay
          speed = distance / air_time * 60) #<- create `speed` from distance and air time columns


#=================================================-
#### Slide 14: Mutate and transmute - useful functions (cont'd)  ####

# Check for detailed documentation
rank_function(x) # <- one of rank functions with
                 #    a vector of values to rank  


#=================================================-
#### Slide 16: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
