class Edir::Parser 
  token SEGSTART SEGEND ELEMSEP ELEM
  # local variables that racc provides in the environment of action:
  # * val is the right hand side
  # * result is the left hand side
  # The plural definitions return an array while the singular ones
  # return a single element. In order to build a sensibly flat representation of the
  # document, we concatenate the single elements with the ones that return an array
  rule
    segments : segment segments { return [val[0]] + val[1] }
             | segment { return val }
    segment  : SEGSTART elems SEGEND { return [val[0]] + val[1] + [val[2]] }
             | SEGSTART SEGEND { return val }
    elems    : ELEMSEP elems { return [val[0]] + val[1] }
             | ELEM elems { return [val[0]] + val[1] }
             | ELEM { return val }
end

---- header
require './lexer'

module Edir
  class Parser < Racc::Parser
    def initialize(debug: false)
      @yydebug = debug
    end
  end
end

---- inner
def parse(str)
  @q = Edir::Lexer.new.lex_str(str)
  do_parse
end

def next_token
  @q.shift
end
