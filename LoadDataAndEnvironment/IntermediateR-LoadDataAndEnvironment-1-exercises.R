#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## INTERMEDIATER/LOADDATAANDENVIRONMENT/INTERMEDIATER LOADDATAANDENVIRONMENT 1 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise ####

# =================================================-



#### Please refer to module 1 of IntermediateR - LoadDataAndEnvironment for Tasks 1-9

#### Task 1 ####



# Clear the environment of variables from previous exercises using `rm`, `list`, and `ls`.

# Use "?rm" to refresh your knowledge of its usage.



# Result:



#================================================-

#### Task 2 ####



# Check your working directory.

# What is the name of the file that starts with the letter f?



# Result:





# Students can look in the Files window to confirm the file name once setting the correct working directory

# Or students can check using R commands:







#================================================-

#### Task 3 ####



# Use `read.csv` to read `fast_food_data.csv` into R and name it `fastfood`. 

# Set headers to TRUE and do not read in strings as factors.

# What is the class of `fastfood`?



# Result:







#================================================-

#### Task 4 ####



# Inspect the structure, attributes, and dimensions of `fastfood`.

# How many rows and columns does fastfood have?



# Result:







#================================================-

#### Task 5 #### 



# What's the difference in protein content between the 12th and 56th observation?

# What's the type of item 12 and item 56? 

# What is the specific item of item 12 and item 56?



# Hint:



# Identify the column number of Protein

# fastfood[12, 12] - fastfood[56, 12]

# fastfood[12, ]$Type

# fastfood[12, ]$Item



# Result:









#================================================-

#### Task 6 ####



# Create a subset of `fastfood` named `fastfood_sub` that contains rows 12:56 and the columns 

# "Fast.Food.Restaurant", "Item", "Type", "Protein..g.", and "Total.Fat..g.".

# Hint: Start by creating a vector of column names you wish to keep.



# Result:





#================================================-

#### Task 7 ####



# Use `head` and `tail` to return only the top and last observation of `fastfood_sub`.

# Which restaurant made each burger?



# Result:







#================================================-

#### Task 8 ####



# Save `fastfood_sub` to your data directory as "fast_food_subset.csv".



# Result:



# Write data to a CSV file providing 3 arguments:






