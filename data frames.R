
# Reading data

?read.table
?read.csv


mydata <- read.csv('evals.csv', stringsAsFactors=TRUE)


# Summaries

head(mydata, 3)
tail(mydata)

View(mydata)

str(mydata)

a <- names(mydata)

summary(mydata)




# Variables

b <- mydata$score

mean(mydata$score)

summary(mydata$score)

mydata$score * 2

mydata$ten_point_scale <- mydata$score * 2



summary(mydata$ten_point_scale)

mydata$new_varible <- 0
mydata$number <- 1:nrow(mydata)
summary(mydata$number)

nrow(mydata)
ncol(mydata)





# Subsetting

mydata$score[1:10]

mydata[1,1] # первыми идут строчки, потом столбцы
mydata[c(2,193,225),1]
mydata[101:200,1]

mydata[5,] # вся пятая строка со всеми столбцами
mydata[,1] == mydata$score

mydata[,2:5]
head(mydata[,2:5])

##


# Subsetting with condition

mydata$gender
mydata$gender == 'female'
head(mydata[mydata$gender == 'female',1:3]) # 3 столбца, где строки по полу женщины

head(subset(mydata, gender == 'female'))
head(subset(mydata, score > 3.5))

mtcars$cyl==4
mpg_4 <- mtcars$mpg[mtcars$cyl==4]
mini_mtcars <- mtcars[c(3, 7, 10, 12, nrow(mtcars)), ]
# rbind, cbind

mydata2 <- subset(mydata, gender == 'female')
mydata3 <- subset(mydata, gender == 'male')
mydata4 <- rbind(mydata2, mydata3)

mydata5 <- mydata[,1:10]
mydata6 <- mydata[,11:24]
mydata7 <- cbind(mydata6, mydata5)




#######################_______________________________________##########################
numeric_data <- readRDS("numeric_data.rds")


psych::describe(numeric_data)

mt_split <- mtcars |> split(~`mpg`)

library(readr)

df <- read_tsv("data_tsv.tsv")

data <- df
data %>% select(`Группа крови`, `Возраст`, function(x) anyNA(x))

data %>% select(`Группа`, function(x) !is.factor(x))

data %>% select(`Группа`, (function(x) is.factor(x)) | where(function(x) is.numeric(x)))
data %>% select(Группа крови, `Возраст`, function(x) anyNA(x))


data %>% select(function(x) sd(x, na.rm = TRUE) > 1)
data %>% select(where(function(x) is.character(x) & any(str_detect(x, "Жен"), na.rm = TRUE)))

data %>% mutate(across(!contains("E1") & !c(`Группа`, `Возраст`), function(x) x ^ 2))


data |> select(`Группа`, contains("E1")) |> pivot_longer(!"Группа")



