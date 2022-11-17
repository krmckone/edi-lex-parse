class EdirParser
  rule
    file : SEGSTART elem SEGEND { puts "1: #{result}" }
    elem : ELEMSEP elem { puts "2: #{result}" }
    | ELEM elem { puts "3: #{result}" }
    | ELEM { puts "4: #{result}" }
end

---- header
require './lexer'

---- inner
def parse(str)
  @q = Edir::Lexer.new.lex_str(str)
  do_parse
end

def next_token
  @q.shift
end
