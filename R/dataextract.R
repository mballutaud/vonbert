data_extract <- function(fishlatinname, parameters = FALSE, t0 = NULL, K = NULL){

  if(parameters == FALSE) { # In the case where the parameters are not know

    # Database Extraction
    data <- rfishbase::species(fishlatinname, fields = c("Species", "Length", "LengthFemale", "LongevityWild", "Pic"))

    # Length numeric conversion
    data$LengthFemale <- as.numeric(data$LengthFemale) # To avoid problems
    data$Length <- as.numeric(data$Length) # To avoid problems

    # Adding model parameters
    data$t0 <- 0.01 # T0 is equal to 1% of maturity length
    data$K <- 0.23 # K is equal to ...
    data$HatchLength <- data$Length * data$t0 # The hatch length is computed here

    final_dd <- NULL

    for (i in 1:nrow(data)){

    if(is.na(data$LongevityWild[i])) {
    age <- seq(0,30,1)
    dd <- data.frame(specie = data$Species[i],
                     age = age,
                     length = data$Length[i] * (1 - exp(-data$K[i] * (age - data$t0[i]))))

    final_dd <- rbind(final_dd, dd)
    rm(dd)
    }

    if(!is.na(data$LongevityWild[i])) {
    age <- seq(0, data$LongevityWild[i], 1)
    dd <- data.frame(specie = data$Species[i],
                       age = age,
                       length = data$Length[i] * (1 - exp(-data$K[i] * (age - data$t0[i]))))

      final_dd <- rbind(final_dd, dd)
      rm(dd)
    }
 }

    return(final_dd) # Return the dataframe

  }

  if(parameters == TRUE) { # In the case when the parameters are known

    data <- rfishbase::species(specie, fields = c("Species", "Length", "Pic"))

    # Database Extraction
    data$Length <- as.numeric(data$Length) # To avoid problems

    # Adding model parameters
    data$t0 <- t0
    data$K <- K
    data$HatchLength <- data$Length * data$t0 # The hatch length is computed here

    return(data)

  }
}
