# import package dmetar - datasets
library(dmetar)

# Loads specified data sets, or list the available data sets.
data(TherapyFormats)


# print(head(TherapyFormats[1:5]))

print(as.matrix(table(TherapyFormats$author)))