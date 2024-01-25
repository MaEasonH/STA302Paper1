
library(stats)

data <- read.csv('/cloud/project/input/data/clean_reduced.csv')
result <- aov(Incident_Count ~ Perceived_Race_of_People_Involv, data = data)
summary <- summary(anova_result)
print(summary)
p_value <- summary[[1]][["Pr(>F)"]][1]
if (!is.null(p_value) && p_value < 0.1) {
  # Perform Tukey's HSD test
  tukey_result <- TukeyHSD(result, conf.level = 0.90)
  print(result)
} else {
  print("No significant differences found at 90% confidence level.")
}
