#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOR/BASICS/INTROTOR BASICS 2 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise ####
# =================================================-

#### Task 1 ####

# Add 3 and 5.
# Add -10.56 and 99.679

# Result:
3 + 5

-10.56 + 99.679


#================================================
#### Task 2 ####

# Subtract 67 from 666.
# Subtract -67 from 89.

# Result:
666 - 67

89 - (-67)


#================================================
#### Task 3 ####

# Multiply 555 by 444.
# Multiply -5.5 by 0.32.

# Result:
555 * 444

-5.5 * 0.32

#================================================
#### Task 4 ####

# Divide 20 by 65.
# Divide 0.333 by 0.999.

# Result:
20 / 65

0.333 / 0.999


#================================================
#### Task 5 ####

# Take the square root of 125.
# Take the square root of the product of 64 and 8.
# Take the square root of a -9.

# Result:
sqrt(125)

sqrt(64 * 8)

sqrt(-9)

# What do you get in return? Why do you think you got this as the output?

# Answer: You should get a warning message. This happens because taking a square root of a negative number does not produce a real number!

#================================================
#### Task 6 ####
# Raise 6 to the 10th power.
# Raise a sum of 95 and -7 to the 3rd power.

# Result:
6^10

(95 + (-7))^3


6**10 # Also a correct answer

(95 + (-7))**3

#================================================
#### Bonus question ####
# Take the cube root of 1000

# Result: 
1000^(1/3)


1000**(1/3) # Also a correct answer

# Why does this work?

# Answer: The root of an operation is also a power, but instead of raising the number into a power > 1, we raise it to a fraction. Square root is equivalent to raising a number to (1/2)th power.


#================================================
#### Task 7 ####

# What is the remainder when we divide 5 by 2?
# What is the remainder when we divide 6 by 7?
# How many times can we fit 8 into 999?
# What is the biggest integer we get if we divide 24 by -12?

# Result: 

# Answer: 1
5 %% 2

# Answer: 6
6 %% 7

# Answer: 124
999 %/% 8

# Answer: -2
24 %/% (-12)


#================================================
#### Task 8 ####

# Make a variable called `var_1` and let it be equal to a sum of 100 and 65.
# Make a variable called `var_2` and let it be equal a product of 3 and 1/2.
# Hint: when you create a new variable, make sure you view what it is equal to 
# in console and / or environment pane.

# Result:
var_1 = 100 + 65
var_1

var_2 = 3*(1/2)
var_2

#================================================
#### Task 9 ####

# Make a variable called `var_3`, which is a result of division of `var_1` by `var_2`.
# Make a variable called `var_4` and set it equal to 110.

# Result:
var_3 = var_1 / var_2
var_3

var_4 = 110
var_4

#================================================
#### Task 10 ####

# Compare `var_4` to `var_3`. Are they equal?
# Compare `var_1` to `var_4`. Is `var_4` greater than `var_1`?
# Compare `var_1` to `var_2`. Is `var_1` greater than `var_2`?
# Compare `var_2` to `var_3`. Is `var_2` at least as big as `var_3`?
# Compare `var_4` to `var_3`. Is `var_4` at most as big as `var_3`?

# Result:
var_4 == var_3

var_4 > var_1

var_1 > var_2

var_2 >= var_3

var_3 >= var_4


#================================================
#### Task 11 ####

# Make a variable called `temp_var` and set it equal to 10^3.
# Divide it by 10 and save it to itself. What is `temp_var` now equal to?
# Can we retrieve the initial value of `temp_var`?

# Result:
temp_var = 10^3

# Answer: 100
temp_var = temp_var / 10
temp_var

# Answer: No, the original value of `temp_var` was overwritten by our operation on itself. 

#================================================
#### Task 12 ####

# Make a variable `Temp_Var` and assign it to the negative third power of 5.
# Can we still retrieve the value assigned to `temp_var`? If yes, then what is it?

# Result: 
Temp_Var = 5^(-3)
Temp_Var

# Answer: Yes. These two variables, temp_var and Temp_Var, are DIFFERENT because R is case sensitive. The value is still 100.


#================================================
#### Bonus question 1 ####

# How many different remainders can we get from dividing any number by 2?

# Result: 

# Answer: 2

# What are they?

# Answer: 0 and 1

# Why is that?

# Answer: If the number is even, the remainder will always be 0, if the number is odd, the remainder will always be 1.

#================================================
#### Bonus question 2 ####
# Out of all possible pairs of the 4 variables (`var_1` through `var_4`), find the one with the biggest sum!
# Assign that sum to `var_5`.

# Result: 
# There are 6 possible combinations of 4 variables, i.e. 6 sums:
var_1 + var_2
# Answer: 166.5

var_1 + var_3
# Answer: 275

var_1 + var_4
# Answer: 275

var_2 + var_3
# Answer: 111.5

var_2 + var_4
# Answer: 111.5

var_3 + var_4
# Answer: 220

# There are 2 pairs that produce the same result:
var_1 + var_3

var_1 + var_4


# We can make `var_5` be equal to either 
var_5 = var_1 + var_3 
var_5

# or 
var_5 = var_1 + var_4
var_5

# You could also get to the correct result by comparing variables individually and picking
# the two largest variable  out of 4, because they will produce the biggest sum.

# Pick the 1st largest variable first:

# Compare var_1 to var_2 (we need to use >= instead of >, because > will 
# return FALSE in case the two variables are the same, >= will return TRUE and keeping 
# either of the two will be fine)
var_1 >= var_2

# Since `var_1` is greater than or equal to `var_2`, we'll keep `var_1`, and compare it to `var_3`.
var_1 >= var_3

# Since `var_1` is greater than or equal to `var_3`, we'll keep `var_1`, and compare it to `var_4`.
var_1 >= var_4

# Seems like `var_1` is the 1st biggest variable of 4, this will be the first number in our sum.

# Now let's pick the second biggest (exclude `var_1`):
var_2 >= var_3

# Since `var_3` is bigger than or equal to `var_3`, keep it and compare it to `var_4`
var_3 >= var_4

# Since `var_3` is bigger than or equal to `var_4`, the 2nd biggest number is `var_3`, so the sum will be
var_5 = var_1 + var_3
var_5



