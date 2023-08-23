#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOR/BASICS/INTROTOR BASICS 2 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 5: Basic calculations and operations  ####

# Add whole numbers.
1 + 2

# Add numbers with decimals.
3.23 + 4.65
# Subtract whole numbers.
10 - 7

# Subtract numbers with decimals.
3.23 - 4.65


#=================================================-
#### Slide 6: Basic calculations and operations (cont'd)  ####

# Multiply whole numbers.
1 * 2

# Multiply numbers with decimals.
3.23 * 4.65
# Divide whole numbers.
9 / 3

# Divide numbers with decimals.
3.23 / 4.65


#=================================================-
#### Slide 7: Basic calculations and operations (cont'd)  ####

# Take square root of a number with.
sqrt(100)

# Take square root of an expression.
sqrt(7 * 5)
# Raise number to a power with `^`.
9 ^ 3

# Raise number to a power with `**`.
9 ** 3

# Raise expression to a power.
(3.23 / 4.65)^2


#=================================================-
#### Slide 8: Basic calculations and operations (cont'd)  ####

# Get remainder from division.
7 %% 3

# Get remainder from division.
4 %% 2
# Perform integer division.
7 %/% 3

# Perform integer division.
4 %/% 2


#=================================================-
#### Slide 10: Variables   ####

# Define a variable using `<-` 
# as an assignment operator.
A <- 3  
A

# Define a variable using `=` 
# as an assignment operator.
B = 2 + 5
B


#=================================================-
#### Slide 12: Operations with variables  ####

# Add 2 variables.
C = A + B
C

# Add a variable and a number.
D = C + 5
D
# Subtract 2 variables from each other.
D - C

# Subtract a variable from number.
33 - D

# Or a number from a variable.
D - 33


#=================================================-
#### Slide 13: Comparison  ####

# Check variables are equal.
A == B

# Check if variables are not equal.
A != B

# Check if one is greater than the other.
A > B
# Check if one is greater than or equal to 5.
A >= 5

# Check if one is less than or equal to 3.
A <= 3

# Check if one is smaller than the other.
A < B


#=================================================-
#### Slide 14: Variable value re-assignment  ####

# 1. Create a variable and assign 67 to it.
this_variable = 67
this_variable

# 2. Create another variable and assign -54.
that_variable = -54
that_variable

# 3. Calculate their sum.
this_variable + that_variable
# 4. Re-assign a value to `this_variable`.
this_variable = 35
this_variable

# 5. Add two variables and store the result 
#    in `that_variable`.
that_variable = this_variable + that_variable
that_variable


#=================================================-
#### Slide 16: Good coding practices: comments  ####

# This is an example of a comment in R.

A = 2 + 5 #<- you can also add comments at the end of line
B = A + 3 


#=================================================-
#### Slide 17: Good coding practices: spacing  ####

# This code works but it is difficult to understand
my_object=array(5:20,c(7,8))
my_object<-array(5:20,c(7,8))
my_object[,c(1,2)]


# A clear way to make code readable
my_object = array(5:20, c(7, 8))
my_object <- array(5:20, c(7, 8))
my_object[, c(1, 2)]


#=================================================-
#### Slide 18: Good coding practices: naming conventions  ####

# Good 
my_variable_name <- -5

# Bad
myvariablename <- -5

# Good 
MyFunctionName()
my_function_name()

# Bad
myfunctionname()



#=================================================-
#### Slide 19: Good coding practices: reserved words  ####

?reserved


#=================================================-
#### Slide 20: Good coding practices: libraries first  ####


file_path <- "data.csv"
read.csv(file_path)
library(tidyverse)




#=================================================-
#### Slide 21: Good coding practices: libraries first (cont'd)  ####


library(readr)

my_list <- list(2,4,8)
file_path <- "data.csv"

read.csv(file_path)



#=================================================-
#### Slide 23: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
