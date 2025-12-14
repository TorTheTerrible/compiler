def createLexems(path)
    file = File.open path
    input = file.read
    file.close
    input = input.gsub(/[;()]{}/, ' \0')

    contents = input.split(" ")
    tokens = []

    for i in 0...contents.length
        t = contents[i]

        if ["float", "int"].include?(t)
            tokens.append("keyword")
        
        elsif "0123456789".include?(t)
            tokens.append("int_literal")
        
        elsif "{".include?(t)
            tokens.append("open_bracket")
        
        elsif "}".include?(t)
            tokens.append("closed_bracket")

        elsif t == "return"
            tokens.append("return")

        elsif t == ";"
            tokens.append("semicolon")

        elsif t == "("
            tokens.append("open_paren")

        elsif t == ")"
            tokens.append("closed_paren")

        elsif t == "+"
            tokens.append("addition")

        else
            tokens.append("identifier")
        end
    end
    return tokens
end

def match(char)
    if e[i] == char
        i += 1
    else
        puts "error"
        exit
    end
end

def E()
    if e[i] == "keyword"
        match("keyword")
        EE()
    end
end
    
def intParse()
    if e[i] == "int_literal"
        match("int_literal")
    else
        puts "error"
    end
end

def semicolonParse()
    if e[i] == "semicolon"
        match("semicolon")
    else
        puts "error"
    end
end

def EE()
    if e[i] == "addition"
        match("addition")
        match("int_literal")
        EE()
    else
        semicolonParse()
    end
end

#lex tokens
tokens = createLexems("code.txt")
puts tokens