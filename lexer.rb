
#dave = Customer.new("Dave", "123 Main")
#dave.name     #=> "Dave"
#dave.greeting #=> "Hello Dave!"

Token = Struct.new(:token, :type)
Node = Struct.new(:token, :child)
pointer = 0

def getTokens(path)
    file = File.open path
    input = file.read
    file.close

    data = ["int", "bool", "float"]
    syms = ["=", "+", ";", "(", ")", "{", "}", "return" ]

    input = input.gsub(/[;()]/, ' \0')

    puts input
    contents = input.split(" ")
    tokens = []


    for i in 0...contents.length
        t = contents[i]

        if data.include?(t)
            tokens.append(Token.new(t, "type"))
        
        elsif syms.include?(t)
            tokens.append(Token.new(t, "symbol"))
        else
            tokens.append(Token.new(t, "number"))
        end

    end
    return tokens
end

def parse(token)
    if(token.type == "type")
        tmp = Token.new()

    end

    return tmp
end

def E(g)
    if g[pointer].type == "type"
        pointer += 1
    end

    puts g[pointer]
    EE()
end

def EE(g)
    if g[pointer].type == "symbol"
        pointer += 1
        puts g[pointer]
    
        if g[pointer].type == "number"
            pointer += 1
            puts g[pointer]
        end
    end
end

#lex tokens
tokens = getTokens("code.txt")
puts tokens
