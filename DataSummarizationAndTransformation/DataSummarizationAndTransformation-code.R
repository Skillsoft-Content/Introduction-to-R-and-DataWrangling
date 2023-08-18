#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## DATAWRANGLINGINR/DATASUMMARIZATIONANDTRANSFORMATION/DATAWRANGLINGINR DATASUMMARIZATIONANDTRANSFORMATION 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 5: Summarise and group_by  ####

# Check for detailed documentation
?dplyr::summarise

# Use cases for `summarise` function
summarise(df,                #<- data frame 
          summary_function1, #<- summary rule(s) 
                             #   for new column
          ...)


#=================================================-
#### Slide 6: Summarise and group_by  ####

# Check for detailed documentation
?dplyr::group_by

# Use cases for `group_by` function
group_by(df,         #<- data frame 
          variable1, #<- 1st variable to group by
          variable2, #<- 2nd variable to group by
          ...)


#=================================================-
#### Slide 7: Summarise and group_by alone  ####

# Produce a summary 
summarise(flights, delay = mean(dep_delay, na.rm = TRUE)) 
# Create `by_day` by grouping `flights` by year, month, and day.
by_day = group_by(flights, year, month, day)     
by_day


#=================================================-
#### Slide 11: Utilizing the pipe operator  ####

delays = flights %>%                                   #<- take flights data
  group_by(dest) %>%                                   #<- group it by destination
  summarise(count = n(),                               #<- then summarize by creating count variable
            dist = mean(distance, na.rm = TRUE),       #<- and computing mean distance
            delay = mean(arr_delay, na.rm = TRUE)) %>% #<- and mean arrival delay
  filter(count > 20, dest != "HNL")                    #<- then filter it
delays


#=================================================-
#### Slide 15: Count instances without summarise()  ####

flights %>% 
  count(day) #<- count number of instances of entry in `day` column


#=================================================-
#### Slide 22: Ease of analysis with tidy datasets  ####

table2


#=================================================-
#### Slide 23: Ease of analysis with tidy datasets contd  ####

table4a
table3


#=================================================-
#### Slide 24: Characteristics of 'tidy' data  ####

table1


#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## DATAWRANGLINGINR/DATASUMMARIZATIONANDTRANSFORMATION/DATAWRANGLINGINR DATASUMMARIZATIONANDTRANSFORMATION 2 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 3: pivot_longer()  ####

?tidyr::pivot_longer

pivot_longer(cols,        #<- columns to convert
             names_to,    #<- name of new key column
             values_to)   #<- name of new value column


#=================================================-
#### Slide 5: pivot_longer example  ####

table4a


#=================================================-
#### Slide 6: pivot_longer example contd  ####

# Gather the `table4a` data frame to make it tidy.
table4a %>%    #<- set the data frame and use pipe to use it as input into `pivot_longer`
  pivot_longer(cols = `1999`:`2000`, #<- set columns to convert
               names_to = "year",    #<- set `year` column as a key
               values_to = "cases")  #<- set `cases` column for the values


#=================================================-
#### Slide 7: pivot_longer example specifying a range  ####

# Gather the `table4a` data frame to make it tidy.
table4a %>%    #<- set the data frame and use pipe to use it as input into `pivot_longer`
  pivot_longer(cols = 2:3,           #<- set columns to convert
               names_to = "year",    #<- set `year` column as a key
               values_to = "cases")  #<- set `cases` column for the values


#=================================================-
#### Slide 8: pivot_wider()  ####

?tidyr::pivot_wider()

pivot_wider(names_from,   #<- name of current key column
            values_from)  #<- name of current value column


#=================================================-
#### Slide 10: pivot_wider example  ####

# Let's look at `table2` inbuilt data.
table2


#=================================================-
#### Slide 11: pivot_wider example contd  ####

# Spread the data
# Pass data to spread with pipe.
table2 %>%      
  pivot_wider(names_from = type,      
              values_from = count)



#=================================================-
#### Slide 13: Separating and uniting  ####

table3


#=================================================-
#### Slide 14: separate() parameters  ####

?tidyr::separate

separate(df,   #<- data frame 
         col,  #<- name of column to separate 
         into) #<- name of new variables to 
               #   create as a character vector


#=================================================-
#### Slide 15: separate example  ####

# Using `table3` separate its `rate` column into two.
table3 %>%                   #<- set data frame and pass it to next function with pipe           
  separate(rate,                   #<- separate `rate`
           into = c("cases",       #<- into column `cases`, and
                    "population")) #<-      column `population`


#=================================================-
#### Slide 16: separate example using `sep`  ####

# Using `table3` separate its `rate` column into two.
table3 %>% 
  separate(rate, 
           into = c("cases", 
                    "population"), 
           sep = "/")              #<- set the separating character to `/`


#=================================================-
#### Slide 17: separate example using `sep`  ####

# Using `table3` separate its `year` column into two.
table3 %>%
  separate(year,              #<- separate `year`
           into= c("century", #<- into two columns: `century`, and 
                   "year"),   #<-                   `year`
           sep = 2)           #<- set the separator at index = 2


#=================================================-
#### Slide 18: Data type conversions using separate()  ####

# The new columns 
# are now also characters.
table3 %>%
  separate(rate, into = c("cases", "population"))
table3 %>%
  separate(rate, into = c("cases", "population"), convert = TRUE)


#=================================================-
#### Slide 19: unite()  ####

?tidyr::unite

unite(df,  #<- data frame 
      col, #<- name of column to unite 
      sep) #<- separator to use


#=================================================-
#### Slide 21: unite example  ####

# Let's separate the `table3`'s `year` column into `century` and `year` first.
ex_table = table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)
ex_table
# Now we use `unite` to combine the two new columns back into one.
# By default, unite will combine columns using `_` so we can use `sep` to specify that we 
# do not want anything between the two columns when combined into one cell.
ex_table %>%      #<- specify the data frame to pipe into `unite`
  unite(time,     #<- set the column `time` for combined values
        century,  #<- 1st column to unite
        year,     #<- 2nd column to unite
        sep = "") #<- set the separator to an empty string 


#=================================================-
#### Slide 23: Exercise   ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
