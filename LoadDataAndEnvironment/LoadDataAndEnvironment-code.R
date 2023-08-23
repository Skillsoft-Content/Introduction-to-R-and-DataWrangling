#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERMEDIATER/LOADDATAANDENVIRONMENT/INTERMEDIATER LOADDATAANDENVIRONMENT 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 9: Setting the working directory via R  ####

# Check the current working directory. 
# Note: your directory path may look different.
getwd()


#=================================================-
#### Slide 12: Directory settings  ####

install.packages("box")
# Set `main_dir` to the location of your materials folder.
# Note: your directory path may look different.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 13: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")
list.files(path = data_dir, pattern="temp")


#=================================================-
#### Slide 14: Loading dataset into R: read CSV files  ####

# To read a C[omma] S[eparated] V[alues] file into
# R you can use a simple command `read.csv`.
temp_heart_data = read.csv(file = file.path(data_dir, "temp_heart_rate.csv"),  #<- provide file path
                           header = TRUE,            #<- if file has header set to TRUE
                           stringsAsFactors = FALSE) #<- read strings as characters, not as factors


#=================================================-
#### Slide 15: Viewing data in R  ####

# Inspect the structure of the data.
str(temp_heart_data)


#=================================================-
#### Slide 16: Viewing data in R (cont'd)  ####

head(temp_heart_data, 4) #<- Inspect the `head` (first 4 rows).


tail(temp_heart_data, 4) #<- Inspect the `tail` (last 4 rows).


#=================================================-
#### Slide 17: Viewing data in R (cont'd)  ####

View(temp_heart_data)


#=================================================-
#### Slide 19: Saving data: write CSV files  ####

# Let's save the first 10 rows of our data to a variable.
temp_heart_subset = temp_heart_data[1:10, ]
temp_heart_subset


# Write data to a CSV file providing 3 arguments:
write.csv(temp_heart_subset,            #<- name of variable to save 
          file.path(data_dir, "temp_heart_rate_subset.csv"), #<- name of file where to save
          row.names = FALSE)            #<- logical value for row names


#=================================================-
#### Slide 21: Clearing objects from environment  ####

# List all objects in environment.
ls()
# Remove individual variable(s).
rm(X, x, this_is_a_valid_name, This.Is.Also.A.Valid.Name, unnamed_list) #<- example
rm(list=ls()) #<- actual command
# List all objects again to check.
ls()


#=================================================-
#### Slide 25: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
