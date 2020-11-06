get_fish_name <- function(){
  list_species <- readr::read_csv(here::here("data","list-species.csv"))


  msg <- ""
  for (i in 1:nrow(list_species)){
   msg=c(msg, paste0(list_species[i, 1], ": ", list_species[i, 2]," ", list_species[i, 3],"\n")) #ponctuation uk
  }


  cat(msg)
  response <- readline(prompt="Choose a species by selecting its ID number, enter your ANSWER: ")
  response <- as.numeric(response)
  if (response %in% list_species$ID){
    fishlatinname <- paste(list_species[response, 2], list_species[response, 3])
  } else {
    stop("sorry, try again!") #genere une error donc repete le msg entre paraenthese
  }
  return(fishlatinname)
}
