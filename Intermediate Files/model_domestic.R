df = read.table("./data/data.csv", sep = ",", header=T)

library(ggplot2)
library(tidyverse)
library(leaps)

complete.cases(df)

df_small = df |> select(-Release.Date..US., -Oscar.Detail, -X..of.Gross.earned.abroad)
names(df_small)

colnames(df_small) = c("film", "year", "rt_cr", "meta_cr", "rt_au", "meta_au", "pr_genre", "op_weekend", "domestic_gross", "foreign_gross", "world_gross", "budget", "oscar", "distr", "imdb")

# df_small$distr = as.factor(df_small$distr)

df_small |> group_by(distr) |>
summarise(mean_dom_gross = mean(domestic_gross)) |>
arrange(desc(mean_dom_gross))

big7 = c("Walt Disney Studios", "Walt Disney Studios Motion Pictures", "Warner Bros. Pictures", "Paramount Pictures", "Sony Pictures", "Universal Pictures", "20th Century Fox")
df_small$distr[!(df_small$distr %in% big7)] = "other"

df_small |> ggplot(aes(x = distr, y = domestic_gross)) +
  geom_boxplot()

df_small |> ggplot(aes(x = distr, y = world_gross)) +
  geom_boxplot()

mf = lm(domestic_gross ~ rt_cr + rt_au + meta_au + op_weekend + oscar + imdb, data = df_small)

m1 = lm(domestic_gross ~ rt_cr + rt_au + meta_au+ oscar + imdb, data = df_small)
summary(m1)


cor(df_small$domestic_gross, df_small$rt_cr)
cor(df_small$domestic_gross, df_small$meta_cr)

cor(df_small$rt_cr, df_small$meta_cr)

cor(df_small$budget, df_small$domestic_gross)

m2 = lm(domestic_gross ~ oscar + imdb + budget + I(budget^2) + I(budget^3), data = df_small)
summary(m2)

m3 = lm(domestic_gross ~ oscar + imdb + budget + I(budget^2) + I(budget^3) + distr, data = df_small)
summary(m3)
names(df_small)
plot(m3$fitted.values, m3$residuals)

plot(m3$fitted.values, m3$residuals)

m3w = lm(world_gross ~ oscar + imdb + budget + I(budget^2) + I(budget^3) + distr, data = df_small)
summary(m3w)

m4 = lm(I(log(domestic_gross)) ~ imdb + budget + I(budget^2), data = df_small)
summary(m4)

plot(m4$fitted.values, m4$residuals)

m5 = lm(I(sqrt(domestic_gross)) ~ oscar + imdb + budget + I(budget^2) + I(budget^3) + distr, data = df_small)
summary(m5)

plot(m5$fitted.values, m5$residuals)


m6 = lm(I(domestic_gross^.5) ~ oscar + imdb + budget + I(budget^2), data = df_small)
summary(m6)
plot(m6$fitted.values, m6$residuals)

subset = regsubsets(I(domestic_gross^.5) ~ oscar + imdb + budget + I(budget^2) + I(budget^3), data = df_small, method = "exhaustive")
ssm = summary(subset)
ssm$which
ssm$cp
ssm$bic

subset2 = regsubsets(I(log(domestic_gross)) ~ oscar + imdb + budget + I(budget^2) + I(budget^3), data = df_small, method = "exhaustive")
ssm2 = summary(subset2)
ssm2$which
ssm2$cp
ssm2$bic

AIC(lm(I(domestic_gross^.5) ~ oscar + imdb + budget, data = df_small))
AIC(lm(I(domestic_gross^.5) ~ oscar + imdb + budget + I(budget^2), data = df_small))

AIC(lm(I(log(domestic_gross)) ~ oscar + imdb + budget + I(budget^2), data = df_small))

AIC(m6)

m2best = lm(I(log(domestic_gross)) ~ imdb + budget + I(budget^2) + I(budget^3), data = df_small)
summary(m2best)
plot(m2best$fitted.values, m2best$residuals)
ggplot() + stat_qq(aes(sample = m2best$fitted.values)) + stat_qq_line(aes(sample =  m2best$fitted.values))

m2simple = lm(I(log(domestic_gross)) ~ imdb + budget, data = df_small)
summary(m2simple)
plot(m2simple$fitted.values, m2simple$residuals)
ggplot() + stat_qq(aes(sample = m2simple$fitted.values)) + stat_qq_line(aes(sample =  m2simple$fitted.values))


# has better res plot
m2simple2 = lm(I((domestic_gross)^0.25) ~ imdb + budget + I(budget^2), data = df_small)
summary(m2simple2)
plot(m2simple2$fitted.values, m2simple2$residuals)
ggplot() + stat_qq(aes(sample = m2simple2$fitted.values)) + stat_qq_line(aes(sample=m2simple2$fitted.values))


# this one is probaby better but we have to note that violation of normal assumption is pretty liklely. Prof Li said it's fine as long as we acknoledge that.
m2simple2log = lm(I(log(domestic_gross)) ~ imdb + budget + I(budget^2), data = df_small)
summary(m2simple2log)
plot(m2simple2log$fitted.values, m2simple2log$residuals)
ggplot() + stat_qq(aes(sample = m2simple2log$fitted.values)) + stat_qq_line(aes(sample=m2simple2log$fitted.values))



df_small |> ggplot(aes(x = domestic_gross, y = budget)) +
  geom_point()

df_small |> ggplot(aes(x = world_gross, y = budget)) +
  geom_point()

df_small |> ggplot(aes(x = domestic_gross^0.5, y = budget)) +
  geom_point()

df_small |> ggplot(aes(y = world_gross^0.25, x = budget)) +
  geom_point()

df_small |> ggplot(aes(x = log(world_gross), y = budget)) +
  geom_point()

df_small |> ggplot(aes(x = log(domestic_gross), y = imdb)) +
  geom_point()

# no correlation, not useful

df_small |> ggplot(aes(x = domestic_gross, y = oscar)) +
  geom_boxplot()

# df_small$oscar[df_small$oscar == "Oscar Winner"] = 1
# df_small$oscar[df_small$oscar != "Oscar Winner"] = 0

cor(df_small$domestic_gross, df_small$world_gross)
mw = lm(world_gross ~ domestic_gross, data = df_small)
summary(mw)

df_small |> ggplot() +
  geom_point(aes(x = domestic_gross, y = world_gross))

df_small |> ggplot() +
  geom_point(aes(x = domestic_gross, y = world_gross))


m2 = lm(domestic_gross ~ oscar + imdb + budget + I(budget^2) + I(budget^3), data = df_small)
summary(m2)


included_vars <- colnames(df_small)[!(colnames(df_small) %in% c("film", "pr_genre", "foreign_gross", "world_gross", "op_weekend"))]
formula <- as.formula(paste("domestic_gross ~ ", paste(included_vars, collapse = " + ")))

library(leaps)
s <- regsubsets(formula, data = df_small, method = "exhaustive")
ss <- summary(s)
ss$which
ss$adjr2
ss$cp
ss$aic
ss$bic


x0 <- rnorm(200, 0, 1)
ggplot() + stat_qq(aes(sample = m5$fitted.values)) + stat_qq_line(aes(sample =  m5$fitted.values))

