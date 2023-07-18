# import package dmetar - datasets
library(dmetar)
library(netmeta)
library(rgl)

# Loads specified data sets, or list the available data sets.
data(TherapyFormats)

# print("The first 20 lines from dataset:")
# print(head(TherapyFormats[1:5], n = 20)) # n = 20L -> works fine too

# print(as.matrix(table(TherapyFormats$author)))

m.netmeta <- netmeta(TE = TE,
    seTE = seTE,
    treat1 = treat1,
    treat2 = treat2,
    studlab = author,
    data = TherapyFormats,
    sm = "SMD",
    comb.fixed = TRUE,
    comb.random = FALSE,
    reference.group = "cau",
    details.chkmultiarm = TRUE,
    sep.trts = " vs"
)

m.decomp <- decomp.design(m.netmeta)

# print(m.decomp)

# print(m.netmeta$trts)

# long.labels <- c("Care AsUsual", "Group",
#     "Guided Self-Help",
#     "Individual", "Telephone",
#     "Unguided Self-Help",
#     "Waitlist"
# )

# netgraph(
#     m.netmeta,
#     labels = long.labels,
#     dim = "3d"
# )


# d.evidence <- direct.evidence.plot(m.netmeta)
# plot(d.evidence)

result.matrix <- m.netmeta$TE.fixed
result.matrix <- round(result.matrix, 2)
result.matrix[lower.tri(result.matrix, diag = FALSE)] <- NA
# print(result.matrix)

netleague <- netleague(
    m.netmeta,
    bracket = "(",
    digits=2
)


# print(netleague)
# write.csv(netleague$fixed, "netleague.csv")

m.netrank = netrank(m.netmeta, small.values = "good")
print(m.netrank)