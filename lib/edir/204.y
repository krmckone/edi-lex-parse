class EdirParser
  rule
    file : SEGSTART segment { push_parsed(result) }
    segment : elem SEGEND { push_parsed(result) }
    elem : ELEMSEP elem { push_parsed(result) }
    | ELEM elem { push_parsed(result) }
    | ELEM { push_parsed(result) }
end

---- header
require './lexer'

class EdirParser
  attr_reader :parsed
  def initialize
    @position = 0
    @parsed = []
    @yydebug = true
  end

  def push_parsed(result)
    @parsed.push({ result: result, position: @position })
    @position += 1
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
