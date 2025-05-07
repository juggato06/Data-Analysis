library(dplyr)
library(stringr)
library(plyr)
library(ggplot2)

# Data Import
fileUrl = "C:\\Users\\user\\OneDrive - Asia Pacific University of Technology And Innovation (APU)\\APU\\Assignment\\Data Analysis\\retail_data 1.csv"

df = read.csv(fileUrl)
df

# Check structure of dataset
str(df)

#open excel
View(df)

# Check how many NAs in dataset
colSums(is.na(df))

#turn empty column into NA
#main part
df$Shipping_Method = replace(df$Shipping_Method, df$Shipping_Method == "", NA)
df$Payment_Method = replace(df$Payment_Method, df$Payment_Method == "", NA)
df$Age = replace(df$Age, df$Age == "", NA)
df$Product_Category = replace(df$Product_Category, df$Product_Category == "", NA)

#sub part
df$Transaction_ID = replace(df$Transaction_ID, df$Transaction_ID == "", NA)
df$Customer_ID = replace(df$Customer_ID, df$Customer_ID == "", NA)
df$Phone = replace(df$Phone, df$Phone == "", NA)
df$Zipcode = replace(df$Zipcode, df$Zipcode == "", NA)
df$Year = replace(df$Year, df$Year == "", NA)
df$Total_Purchases = replace(df$Total_Purchases, df$Total_Purchases == "", NA)
df$Amount = replace(df$Amount, df$Amount == "", NA)
df$Total_Amount = replace(df$Total_Amount, df$Total_Amount == "", NA)
df$Ratings = replace(df$Ratings, df$Ratings == "", NA)

# Clear all NA from each data column
#main
df = df[!is.na(df$Shipping_Method), ]
df = df[!is.na(df$Payment_Method), ]
df = df[!is.na(df$Age), ]
df = df[!is.na(df$Product_Category), ]

#sub
df = df[!is.na(df$Transaction_ID), ]
df = df[!is.na(df$Customer_ID), ]
df = df[!is.na(df$Phone), ]
df = df[!is.na(df$Zipcode), ]
df = df[!is.na(df$Year), ]
df = df[!is.na(df$Total_Purchases), ]
df = df[!is.na(df$Amount), ]
df = df[!is.na(df$Total_Amount), ]
df = df[!is.na(df$Ratings), ]

# Check after cleaning dataset
colSums(is.na(df))

# Bar chart for Shipping Method
ggplot(df, aes(x = Shipping_Method)) +
  geom_bar(fill = "Blue")

ggplot(df,aes(x = Ratings)) +
  geom_bar(fill = "Yellow")

ggplot(df,aes(x = Shipping_Method, fill = Ratings)) +
  geom_bar(position = "dodge") +
  labs(title = "Ratings by Shipping Method", x = "Shipping Method", y = "Ratings")
