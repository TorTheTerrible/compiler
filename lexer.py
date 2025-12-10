def getTokens(path)
    file = File.open path
    input = file.read
    file.close
    contents = input.split(" ")




    return tokens
end

#lex tokens
tokens = getTokens("code.txt")
puts tokens