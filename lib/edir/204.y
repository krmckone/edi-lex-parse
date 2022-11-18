class EdirParser
  token SEGSTART SEGEND ELEMSEP ELEM
  # local variables that racc provides in the environment of action:
  # * val is the right hand side
  # * result is the left hand side
  rule
    segment : SEGSTART elems SEGEND { return { segstart: val[0], segend: val[2], elems: val[1] } }
    elems   : ELEMSEP elems { return { elemsep: val[0], elems: val[1] } }
            | ELEM elems { return { elemsep: val[0], elems: val[1] } }
            | ELEM { return { elem: val[0] } }
end

---- header
require './lexer'

class EdirParser
  def initialize(debug: false)
    @yydebug = debug
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
