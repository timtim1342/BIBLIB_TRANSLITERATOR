library(tidyverse)
library(stringi)

id <- "
    щ > šč;
    ю > ju;
    я > ja;
    х > x;
    Щ > Šč;
    Ю > Ju;
    Я > Ja;
    Х > X;
    :: cyrillic-latin;
"
write_tsv(
  data.frame(
    lapply(
      read_tsv("./data/biblib.tsv"),
      function(x){
        stri_trans_general(x, id, rules=TRUE)
        }
      )
    ),
  './data/biblib_main_transliterated.tsv'
  )
