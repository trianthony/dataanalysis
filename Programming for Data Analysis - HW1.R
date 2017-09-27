#Tri N Anthony Situmorang
#Programming for Data Analysis


h <- "hello world"
h
?seq()

# Create a numeric vector
v <- c(2,15,5,7)
# Create a naming vector
n <- c("two","fifteen","five","seven")
# Assign the names to the vector
names(n) <- v
# When n is named using values in v vector, n becomes the vector and v becomes the "column header"
#       2        15         5         7 
#     "two" "  fifteen"  "five"    "seven" 
# v remains the same unnamed vector.


#change the length of v
v <- c(2,15,5,7,19)
names(v) <- n
v
# the last vector element has the column header as <NA>
#two fifteen    five   seven    <NA> 
#  2      15       5       7      19 
names(n) <- v
# when the name vector's length is less than the value vector, an error will show up showing names must be the same length as the vector
#Error in names(n) <- v : 
# 'names' attribute [5] must be the same length as the vector [4]

# change the length of n to larget than v
n <- c("two","fifteen","five","seven","nineteen","a hundred")
names(n) <- v
n
# same, last element gets <NA>
names(v) <- n
#same, when the name vector's length is less than the value vector, an error will show up showing names must be the same length as the vector

#change name to have two same labels
n <- c("two","fifteen","five","seven","seven")
names(v) <- n
v
#two elements will have the same header name
#two fifteen    five   seven   seven 
#2      15       5       7      19 

#subset v
v[c(1,2)]
#What happens if you swap the index?
v[c(2,1)]
#subset v swapping index
#index 2 becomes 1, 1 becomes 2
#fifteen     two 
#15       2

#What happens if you subset by the name not present, like v[c("two","three")]?
v[c("two", "three")]
#It will show NA for the non-existing value and name
#two <NA> 
#  2   NA 

v[-c(1,2)]
#Does the “subseting some”" operation work with names?
v[-c("two", "fifteen")]
#no it does not work with names
#Error in -c("two", "fifteen") : invalid argument to unary operator

#What happens if the logical vector has less elements than the orginal vector v (remember recyling)?
v[c(FALSE,TRUE,TRUE)]
#it recycles the values from beginning -> FALSE, TRUE, TRUE
#fifteen    five   seven 
#15       5      19 

# Make a vector of length 5 with NA in them and test for missing values using the is.na() function.
v2 <- c(1, 6, NA, 19, 0)
is.na(v2)
#it returns FALSE FALSE  TRUE FALSE FALSE

#Extend this to a vector of length 5000
length(v2) <- 5000
is.na(v2)

#Play with the sep argument to include other type of delimiters (like comma etc.) 
paste(c("Oxy", "Hydro", "Nitro", "Oxyhydro"), "gen", sep="")
paste(c("January 1", "October 14", "C", "April 11"), "1991", sep=", ")


#What happens if the number of rows/coumns are more than the generated numbers when using the function matrix()?
matrix(1:9, nrow=5, ncol=4)
#it recycles the numbers and returns a warning

#What happens in cbind() (and rbind()) if one of the columns (and rows) have more numbers than the other?
cbind(1:5, 1:3)
#it recycles the numbers for the smaller column

#What happens in cbind() (and rbind()) if one of the columns (and rows) have more numbers than the other?
rbind(1:5, 1:3)
#it recycles the numbers for the smaller row

#Combine two matrices using cbind().
cbind(matrix(1:9, nrow=3, ncol=3), matrix(10:18, nrow=3, ncol=3))

#Can you “bind” two matrices of different data types? What happens when you do that? 
cbind(matrix(1:9, nrow=3, ncol=3), matrix(letters[1:9], nrow=3, ncol=3))
cbind(matrix(1:9, nrow=3, ncol=3), matrix(c(TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE), nrow=3, ncol=3))
cbind(matrix(1:9, nrow=3, ncol=3), matrix(letters[1:9], nrow=3, ncol=3), matrix(c(TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE), nrow=3, ncol=3))
#character takes presedence, then, numeric, then logical
#meaning if charater is combined with any other type, the other type will be coerced to character
#if numeric is combined with logical, the logical data will be converted to their corresponding numerical value, 1 for TRUE, 0 for FALSE


# Create a matrix
M <- matrix(1:9,nrow=3)
M
#What will M[5] print? Specify the rationale behind this.
M[5]
#it prints 5 as it is the 5th element in the matrix counting from the most left down to the bottom, then to the top of the next column

#What does this subset print, M[c(2,3),c(1,2)]?
M
M[c(3,1),c(2,1)]
#it prints the elements (3,2) (3,1)
#                       (1,2) (1,1)
#     [,1] [,2]
#[1,]    6    3
#[2,]    4    1

#What happens if you subtract/add/multiply two matrices of different size? 
M1 <- matrix(1:9,nrow=3)
M2 <- matrix(10:21,nrow=3)
M1
M2
M1 + M2
M1 - M2
M1 * M2
M1 / M2
M1 ^ M2
#It will return error 
#Error in M1 + M2 : non-conformable arrays








#--------------------------Lecture 3----------------------------#


#Rename the blood_type_factor in the above example as follows:
#levels(blood_type_factor) <- c("BT_A", "BT_B", "BT_AB", "BT_O")
#and justify the result of outputting blood_type_factor.

# Define blood type
blood_type <- c("B", "A", "AB", "A", "O")
blood_type
# Find the factors
blood_type_factor <- factor(blood_type)
blood_type_factor
levels(blood_type_factor) <- c("BT_A", "BT_B", "BT_AB", "BT_O")
str(blood_type_factor)
#because renaming order does not follow the default order, the factor becomes extremely confusing
#BT_A represents A, BT_B represents AB, BT_AB represents B, BT_O represents O

#labeling levels should be defined like this instead
blood_type_factor <- factor(blood_type, levels=c("A","B","AB","O"), labels=c("BT_A","BT_B","BT_AB","BT_O"))


#Use the inequality operator (< or >) on a nominal category and print the output. 
cancer_type <- c("Breast", "Leukemia", "Prostate", "Prostate", "Colon", "Lung", "Leukemia")
cancer_type
cancer_type_factor <- factor(cancer_type)
cancer_type_factor
cancer_type_factor[1] < cancer_type_factor[5]
#it returns NA with warning
#Warning message:
#In Ops.factor(cancer_type_factor[1], cancer_type_factor[5]) :
#  ‘<’ not meaningful for factors

# Define a list
blood_test <- list(Fluid="Blood sugar",Category="High", Value=140, Units="mg/dL")
# Make another list containing this list
patient <- list(Name="Mike",Age=36,Btest=blood_test)
# Access the first list
patient[1]
patient[3]

#What does patient[c(1,3)] give us? Is it a list or elements?
patient[c(1,3)]
#it returns a list containing every element of list patient[1] and every element of list patient[3]

#What does patient[[c(1,3)] give us? Is it a list or elements?
patient[[c(1,3)]]
#it returns error since it is trying to return the 3rd element of list patient[1] which does not exist, list[1] only has one element

#How about patient[[c(3,1)]? What is the difference? 
patient[[c(3,1)]]
#it returns the 1st element of list patient[3], which is "Blood sugar"

#How do you remove an element from a list? 
# Extend the list to include gender
patient$Gender <- "Male"
#remove gender
patient <- patient[-4]
#OR
patient$Gender <- NULL 

#Examine the structure of the data frame.

# Create name, age and logical vectors
name <- c("Anne","James","Mike","Betty")
age <- c(20,43,27,25)
cancer <- c(TRUE,FALSE,FALSE,TRUE)

# Form a data frame
df <- data.frame(name,age,cancer)
df

# Create names function
names(df) <- c("Name","Age","Cancer_Status")
df

str(df)
#Dataframe contains rows and columns, resembling a database table.
#Each column is a vector containing values of the same datatype
#While each row contains data of different datatypes
#For character type columns (eg. name column), R automatically convert the vector to factor. This can be overriden.

#What happens if one of the vectors have unequal length? 

#Take out one record from name or one from age or one from cancer
name <- c("Anne","James","Mike")
age <- c(20,43,27,25)
cancer <- c(TRUE,FALSE,FALSE,TRUE)
df <- data.frame(name,age,cancer)
#it returns error because of differing number of rows
#Error in data.frame(name, age, cancer) : 
#arguments imply differing number of rows: 3, 4

#However, if you take out two records from name or age or cancer, df works but it recycles the data
name <- c("Anne","James")
age <- c(20,43,27,25)
cancer <- c(TRUE,FALSE,FALSE,TRUE)
df <- data.frame(name,age,cancer)
df

#Another example shows that if some of the vectors has unequal length, df will work as long as the number of data in the largest column is divisible by the number of data in the smaller columns, meaning that each data in the smaller columns will all be recycled equally for the larger column
name <- c("Anne","James","Mike")
age <- c(20,43,27,76,29,30)
cancer <- c(TRUE,FALSE)
df <- data.frame(name,age,cancer)
df

#Kembalikan ke semula
name <- c("Anne","James","Mike","Betty")
age <- c(20,43,27,25)
cancer <- c(TRUE,FALSE,FALSE,TRUE)
#Create dataframe
df <- data.frame(name,age,cancer)
df

#Test the operations of lists (like [age] & [["age"]]) to data frames. 
df["age"]
#df["age"] returns the column vector age
df[["age"]]
#df[["age"]] is the same as df[,2] which returns all the data in second column (column "age")

#To retrieve all data from a row, the first index can be used while leaving the second index blank
df[2,]

#To retrieve one particular record, specify the index/name for both the row and column
df[1,"cancer"]

#To retrieve a specific rows and columns, function c() can be used
df[c(1,3),c(1,3)]

#Use cbind() to append a vector of choice.
df <- cbind(df, "tumor_size"=c("T0","T3","T2","T0"))
df

#What happens if the length of the appending vector is greater than (or less than) row dimensions? 
df <- cbind(df, "gender"=c("F","M","M","F","M"))
#Similar to the previous situation, it will return error if the length of the appending vector is not divisible by the lengths of each of other vectors
#But if the length of the new vector (e.g. length = 8) is divisible by the lengths of other vectors, then it will recycle each of the records from other vectors equally for the appending vector
cbind(df, "gender"=c("F","M","M","F","M","F","M","F"))

# Create a data frame
tom <- data.frame(name="Tom", age=47,cancer="TRUE",tumor_size="T2")
# And append
df <- rbind(df,tom)
df

#Can you use the list() function instead of the data frame function in the above code?
tom <- list(name="Tom", age=47,cancer="TRUE",tumor_size="T2")
df <- rbind(df,tom)
df
#Yes it is possible to use list() function in place of data.frame() function to add a new row to dataframe.

#What happens if you leave the arguments name=, age= etc. in the above code? 
tom <- data.frame("Tom", 47, "TRUE", tumor_size="T2")
df <- rbind(df,tom)
#Neither data.frame() function nor list() function will work in this case without the names of the columns

# Rank the entries of a column, say "age"
ranks <- order(df$age)
# Sort the data frame according to the rank
df[ranks,]


#What does sort(df$age) perform and how is it related to the ranks?
sort(df$age)
#sort(df$age) returns the ordered age data from the youngest to the oldest

order(df$age)
#order(df$age) returns in the indices of sorted data, that is why to get the actual sorted data the df[] is needed

#Also, df[order(df$age)] returns the whole content of the dataframe sorted by age while sort(df$age) only returns the sorted age data

#Sort the entries in descending order of the age. (Hint: Question the function to find out more about the function in question). 
ranks <- order(df$age, decreasing = "TRUE")
df[ranks,]



#======================GRAPHS=====================
# Install packahe RCurl
install.packages("RCurl")
# Load the library
library(RCurl)

# Import the HANES data set from GitHub; break the string into two for readability
# (Please note this readability aspect very carefully)
URL_text_1 <- "https://raw.githubusercontent.com/kannan-kasthuri/kannan-kasthuri.github.io"
URL_text_2 <- "/master/Datasets/HANES/NYC_HANES_DIAB.csv"
# Paste it to constitute a single URL 
URL <- paste(URL_text_1,URL_text_2, sep="")
HANES <- read.csv(text=getURL(URL))

str(HANES)

# Convert them to factors
HANES$GENDER <- as.factor(HANES$GENDER)
HANES$AGEGROUP <- as.factor(HANES$AGEGROUP)
HANES$HSQ_1 <- as.factor(HANES$HSQ_1)
# Now observe the structure
str(HANES)

# Load library graphics
library(graphics)

# Plot the factor gender
plot(HANES$GENDER)

# Is the above plot informative?
# No, it is not informative. The plot does not show what the bars 1 and 2 and the Y axis represent. To only graph gender data is also not be very informative.

# What will you do to make it more informative? 
# - Add legends to the plot
# - Plot other variables too that is related to gender for better analysis

plot(HANES$GENDER, xlab = "Gender. 1 = Male, 2 = Female", ylab = "Number of people")

#Find the distribution of A1C for the female population in the above data set. Are they different?

# Form a logical vector consisting only the FEMALE gender
HANES_FEMALE <- HANES$GENDER == "F"
# Select only the records for the female population
FEMALES_DF <- HANES[HANES_FEMALE,]
# Make a historgam
hist(FEMALES_DF$A1C)

#Similar to male population, Glycohemoglobin percentage lies between 5−6 for most of the women.
#R has also chosen the number of bins, 6 by default.

#Find the distribution of A1C for three age groups in the above data set. Is there a difference?

# Form a logical vector consisting only the AGEGROUP 20-39
HANES_AGEGROUP1 <- HANES$AGEGROUP == "20-39"
# Select only the records for the 20-39 of age population
AGEGROUP1_DF <- HANES[HANES_AGEGROUP1,]
# Make a historgam
hist(AGEGROUP1_DF$A1C)
#Glycohemoglobin percentage lies between 4.5−5.5 for most of population of age 20-39.

# Form a logical vector consisting only the AGEGROUP 40-59
HANES_AGEGROUP2 <- HANES$AGEGROUP == "40-59"
# Select only the records for the 40-59 of age population
AGEGROUP2_DF <- HANES[HANES_AGEGROUP2,]
# Make a historgam
hist(AGEGROUP2_DF$A1C)
#Glycohemoglobin percentage lies between 5−6 for most of population of age 40-59.

# Form a logical vector consisting only the AGEGROUP 60+
HANES_AGEGROUP3 <- HANES$AGEGROUP == "60+"
# Select only the records for the 60+ of age population
AGEGROUP3_DF <- HANES[HANES_AGEGROUP3,]
# Make a historgam
hist(AGEGROUP3_DF$A1C)
#Glycohemoglobin percentage also lies between 5−6 for most of population of age 60+, a few lies below 4.





#Try to find the distribution of one more numeric variable (other than A1C) for the three age-groups.
# Make a historgam
hist(AGEGROUP1_DF$CHOLESTEROLTOTAL)
#Total cholesterol lies between 140-200 for most of population of age 20-39.

# Make a historgam
hist(AGEGROUP2_DF$CHOLESTEROLTOTAL)
#Total cholesterol lies between 160−220 for most of population of age 40-59.

# Make a historgam
hist(AGEGROUP3_DF$CHOLESTEROLTOTAL)
#Total cholesterol also lies between 150−250 for most of population of age 60+, a few lies between 350 to 400.

#Increase the number of bins to 10 in the above exercise. 
hist(AGEGROUP3_DF$CHOLESTEROLTOTAL, breaks=10)
#Now we can see more details about the total cholestor of population 60+ of age. We can see that the majority of them lies between 140-160 and 180-220.


# Plot GLUCOSE vs GLUCOSESI with parameters
plot(HANES$GLUCOSE, HANES$GLUCOSESI, xlab= "Plasma Glucose", 
     ylab = "Blood Glucose SI units", main = "Plasma vs Blood Glucose", type = "o", col="blue")

#Change the type to “l” and report the plot type. 
plot(HANES$GLUCOSE, HANES$GLUCOSESI, xlab= "Plasma Glucose", 
     ylab = "Blood Glucose SI units", main = "Plasma vs Blood Glucose", type = "l",col="blue")

#Type l plots the data in lines only as opposed to overplotted lines (type o).




# Do the above exercise with “mfcol” argument. How does it plot? 

# Set the par function with mfrow to 2x2 "grid"
par(col="red")
par(mfcol = c(2,2))
# Plot LDL vs HDL
plot(HANES$LDL, HANES$HDL)
# Plot A1C vs HDL
plot(HANES$A1C, HANES$HDL)
# Plot GLUCOSE vs HDL
plot(HANES$GLUCOSE, HANES$HDL)
# Plot CHOLESTEROLTOTAL vs HDL
plot(HANES$CHOLESTEROLTOTAL, HANES$HDL)
#reset par
par(mfcol = c(1,1))

#mfcol plots all the four graphs just like mfrow. However it adds graph one by one by the column first as opposed to row first, which mfrow does



#Make a plot and add elements through the functions points(), lines(), segments() and text(). 
# Plot A1C vs GLUCOSESI
plot(HANES$A1C,HANES$GLUCOSESI, xlim=c(6,8), ylim=c(3,10))
# Using linear fit model. 
# Note: `lm()` function will return a vector of coefficients for the fit
lm_glucose_SI <- lm(HANES$A1C ~ HANES$GLUCOSESI)
# Stack the linear model on top of the plot with line width 2 (specified by `lwd` argument)
abline(coef(lm_glucose_SI),lwd = 2)
#add points to the plot
points(HANES$GLUCOSESI,HANES$A1C)
#order GLUCOSESI
ranks <- order(HANES$GLUCOSESI)
#add lines to the plot
lines(HANES$GLUCOSESI[ranks],HANES$A1C[ranks])
#add segments to the plot
segments(HANES$GLUCOSESI,HANES$A1C, c(HANES$GLUCOSESI,HANES$A1C))
#add text labels to the plot
text(HANES$GLUCOSESI,HANES$A1C)


?segments



# Plot a numerical variable
plot(HANES$A1C)

# Plot two numerical variables 
# A1c - Hemoglobin percentage, UACR - Urine Albumin/Creatinine Ratio
plot(HANES$A1C,HANES$UACR)

# Plot two numerical variables with appropriate scaling
plot(HANES$A1C,HANES$UACR, ylim=c(0,10))

# Transform the data using the log function and plot the result
plot(log(HANES$A1C), log(HANES$UACR))

#Rename the GENDER factor for identification
HANES$GENDER <- factor(HANES$GENDER, labels=c("M","F"))
# Rename the AGEGROUP factor for identification
HANES$AGEGROUP <- factor(HANES$AGEGROUP, labels=c("20-39","40-59","60+"))
# Plot GENDER vs AGEGROUP
plot(HANES$GENDER,HANES$AGEGROUP)
# Swap AGEGROUP vs GENDER
plot(HANES$AGEGROUP,HANES$GENDER)

# Form a logical vector consisting only the MALE gender
HANES_MALE <- HANES$GENDER == "M"

# Select only the records for the male population
MALES_DF <- HANES[HANES_MALE,]

# Make a historgam
hist(MALES_DF$A1C)





