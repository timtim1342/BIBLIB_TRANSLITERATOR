library(tidyverse)
library(stringr)
# scientific transliteration
translit_dict = list(
  'а'= 'a',
  'б'= 'b',
  'в'= 'v',
  'г'= 'g',
  'д'= 'd',
  'е'= 'e',
  'ё'= 'ё',
  'ж'= 'ž',
  'з'= 'z',
  'и'= 'i',
  'й'= 'j',
  'к'= 'k',
  'л'= 'l',
  'м'= 'm',
  'н'= 'n',
  'о'= 'o',
  'п'= 'p',
  'р'= 'r',
  'с'= 's',
  'т'= 't',
  'у'= 'u',
  'ф'= 'f',
  'х'= 'x',
  'ц'= 'c',
  'ч'= 'č',
  'ш'= 'š',
  'щ'= 'šč',
  'ъ'= 'ʺ',
  'ы'= 'y',
  'ь'= 'ʹ',
  'э'= 'è',
  'ю'= 'ju',
  'я'= 'ja'
  )

biblib <- read_tsv("./data/biblib.tsv")
for (name in names(translit_dict)){
  translit_dict[str_to_title(name)] = str_to_title(translit_dict[name])
}
for (name in names(translit_dict)){
  
  biblib$author <- gsub(name, translit_dict[name], biblib$author)
  biblib$title <- gsub(name, translit_dict[name], biblib$title)
  biblib$publisher <- gsub(name, translit_dict[name], biblib$publisher)
  biblib$address <- gsub(name, translit_dict[name], biblib$address)
  biblib$booktitle <- gsub(name, translit_dict[name], biblib$booktitle)
  biblib$editor <- gsub(name, translit_dict[name], biblib$editor)
  biblib$journal <- gsub(name, translit_dict[name], biblib$journal)
  biblib$school <- gsub(name, translit_dict[name], biblib$school)
  biblib$note <- gsub(name, translit_dict[name], biblib$note)
}

write_tsv(biblib, './data/biblib_main_translited.tsv')