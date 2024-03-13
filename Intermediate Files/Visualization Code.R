df = read.table("C:/Users/XDH/Desktop/discordData.csv", sep = ",", header=T)

library(tidyverse)
library(ggplot2)
library(leaps)
library(gridExtra)
library(corrplot)

df$Release.Date..US. <- NULL
df$X..of.Gross.earned.abroad <- NULL
df$Opening.weekend...million. <- NULL
df$Oscar.Detail <- NULL
df$Foreign.Gross...million. <- NULL
df$Worldwide.Gross...million. <- NULL
df <- na.omit(df)

colnames(df) = c("film", "year", "rt_cr", "meta_cr", "rt_au", "meta_au", "pr_genre", "domestic_gross", "budget", "oscar", "distr", "imdb")

# Scatter plot
# Scatter plot
modrtct <- lm(df$domestic_gross~df$rt_cr)
sp1 <- ggplot(df, aes(x=rt_cr,y=domestic_gross)) + geom_point() + ggtitle("Domestic & rt_cr") + xlab("rt_cr") + ylab("Domestic Gross")
modmecr <- lm(df$domestic_gross~df$meta_cr)
sp2 <- ggplot(df, aes(x=meta_cr,y=domestic_gross)) + geom_point() + ggtitle("Domestic & meta_cr") + xlab("meta_cr") + ylab("Domestic Gross")
modrtau <- lm(df$domestic_gross~df$rt_au)
sp3 <- ggplot(df, aes(x=rt_au,y=domestic_gross)) + geom_point() + ggtitle("Domestic & rt_au") + xlab("rt_au") + ylab("Domestic Gross")
modmtau <- lm(df$domestic_gross~df$meta_au)
sp4 <- ggplot(df, aes(x=meta_au,y=domestic_gross)) + geom_point() + ggtitle("Domestic & meta_au") + xlab("meta_au") + ylab("Domestic Gross")
modbudg <- lm(df$domestic_gross~df$budget)
sp5 <- ggplot(df, aes(x=budget,y=domestic_gross)) + geom_point() + ggtitle("Domestic & budget") + xlab("budget") + ylab("Domestic Gross")
modimdb <- lm(df$domestic_gross~df$imdb)
sp6 <- ggplot(df, aes(x=imdb,y=domestic_gross)) + geom_point() + ggtitle("Domestic & imdb") + xlab("imdb") + ylab("Domestic Gross")
# Combine all the plots
grid.arrange(sp1, sp2, sp3, sp4, sp5, sp6, nrow = 2)

# Boxplot
as.factor(df$year)
as.factor(df$pr_genre)
as.factor(df$oscar)
as.factor(df$distr)
df$oscar <- ifelse(df$oscar == "", "Not Oscar Winner", df$oscar)
df$distr <- ifelse(df$distr %in% c("Walt Disney Studios Motion Pictures", "Paramount Pictures", "Warner Bros. Pictures", "Universal Pictures", "Sony Pictures"), df$distr, "Other")
df$distr[df$distr == "Walt Disney Studios Motion Pictures"] <- "Walt Disney"
df$distr[df$distr == "Warner Bros. Pictures"] <- "Warner Bros."

par(mfrow = c(2,2))
bp1 <- boxplot(df$domestic_gross ~ df$year, xlab = "Year Type", ylab="Domestic Gross", main='Domestic & year type')
bp2 <- boxplot(df$domestic_gross ~ df$pr_genre, xlab = "Primary Genre Type", ylab="Domestic Gross", main='Domestic & Primary Genre')
bp3 <- boxplot(df$domestic_gross ~ df$oscar, xlab = "Oscar Winnning or not", ylab="Domestic Gross", main='Domestic & Oscar')
bp4 <- boxplot(df$domestic_gross ~ df$distr, xlab = "Distirbution Company", ylab="Domestic Gross", main='Domestic & Distribution')
par(mfrow = c(1,1))

df_s = df |> select(-year, -film, -oscar, -distr, -pr_genre)
df_s <- df_s[c("domestic_gross", setdiff(names(df_s), "domestic_gross"))]
heatCorr <- cor(df_s)
corrplot(heatCorr, method="number")