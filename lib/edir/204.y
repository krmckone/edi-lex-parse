class EdirParser
  rule
    segment : SEGSTART elem SEGEND { puts "1 #{val}" }
    elem : ELEMSEP elem { puts "2 #{val}" }
         | ELEM { puts "3 #{val}" }
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
