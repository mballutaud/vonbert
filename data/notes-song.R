notes <- c(A = 0, B = 2, C = 3, D = 5, E = 7, F = 8, G = 10)
pitch <- paste("D D D",
               "G D5",
               "C5 B A G5 D5",
               "C5 B A G5 D5",
               "C5 B C5 A D D D",
               "G D5",
               "C5 B A G5 D5",
               "C5 B A G5 D5",
               "C5 B C5 A D D",
               "E E C5 B A G",
               "G A B A E F# D D",
               "E E C5 B A G",
               "D5 A D D",
               "E E C5 B A G",
               "G A B A E F# D5 D5",
               "G5 F5 D#5 D5 C5 A# A G",
               "D5 D D D",
               "G D5",
               "C5 B A G5 D5",
               "C5 B A G5 D5",
               "C5 B C5 A D D D",
               "G D5",
               "C5 B A G5 D5",
               "G5 F5 D#5 Bb5 A5",
               "G5 G G G G")
duration <- c(0.33, 0.33, 0.33,
              2, 2,
              0.33, 0.33, 0.33, 2, 1,
              0.33, 0.33, 0.33, 2, 1,
              0.33, 0.33, 0.33, 2, 0.33, 0.33, 0.33,
              2, 2,
              0.33, 0.33, 0.33, 2, 1,
              0.33, 0.33, 0.33, 2, 1,
              0.33, 0.33, 0.33, 2, 0.75, 0.25,
              1.5, 0.5, 0.5, 0.5, 0.5, 0.5,
              0.33, 0.33, 0.33, 0.75, 0.25, 1, 0.75, 0.25,
              1.5, 0.5, 0.5, 0.5, 0.5, 0.5,
              1, 2, 0.75, 0.25,
              1.5, 0.5, 0.5, 0.5, 0.5, 0.5,
              0.33, 0.33, 0.33, 0.75, 0.25, 1, 0.75, 0.25,
              0.75, 0.25, 0.75, 0.25, 0.75, 0.25, 0.75, 0.25,
              3, 0.33, 0.33, 0.33,
              2, 2,
              0.33, 0.33, 0.33, 2, 1,
              0.33, 0.33, 0.33, 2, 1,
              0.33, 0.33, 0.33, 2, 0.33, 0.33, 0.33,
              2, 2,
              0.33, 0.33, 0.33, 2, 1,
              0.33, 0.33, 0.33, 2, 1,
              1,  0.33, 0.33, 0.33, 1)
tempo <- 150
sample_rate <- 44100
