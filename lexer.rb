#dave = Customer.new("Dave", "123 Main")
#dave.name     #=> "Dave"
#dave.greeting #=> "Hello Dave!"
#Token = Struct.new(:token, :type)
#Node = Struct.new(:token, :child)
#$pointer = 0
#$start = []

def getTokens(path)
    file = File.open path
    input = file.read
    file.close
    input = input.gsub(/[;()]/, ' \0')

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

        else
            tokens.append("identifier")
        end


    end
    return tokens
end

#lex tokens
tokens = getTokens("code.txt")
puts tokens