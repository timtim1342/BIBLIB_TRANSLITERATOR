# scientific transliteration
translit_dict = {
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'е': 'e',
    'ё': 'ё',
    'ж': 'ž',
    'з': 'z',
    'и': 'i',
    'й': 'j',
    'к': 'k',
    'л': 'l',
    'м': 'm',
    'н': 'n',
    'о': 'o',
    'п': 'p',
    'р': 'r',
    'с': 's',
    'т': 't',
    'у': 'u',
    'ф': 'f',
    'х': 'x',
    'ц': 'c',
    'ч': 'č',
    'ш': 'š',
    'щ': 'šč',
    'ъ': 'ʺ',
    'ы': 'y',
    'ь': 'ʹ',
    'э': 'è',
    'ю': 'ju',
    'я': 'ja'

}


def transl(line, letters_dict):

    for key in sorted(letters_dict.keys(), key=len, reverse=True):
        line = line.replace(key, letters_dict[key]).replace(key.title(), letters_dict[key].title())

    print(line)
    return line

def op(file_name):
    with open(file_name) as f:
        txt = f.read()

    return txt

def wr(file_name, flag, line):
    with open(file_name, flag, encoding='UTF-8') as f:
        f.write(line)


def main():
    #txt = [cols.split('\t') for cols in op('biblib_main.tsv').split('\n')]
    txt = transl(op('biblib_main.tsv'), translit_dict)
    wr('biblib_main_transliterated.tsv', 'w', '')
    wr('biblib_main_transliterated.tsv', 'a', txt)

if __name__ == '__main__':
    print(main())