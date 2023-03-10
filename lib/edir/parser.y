class Edir::Parser
  token SEGSTART SEGEND ELEMSEP ELEM
  # local variables that racc provides in the environment of action:
  # * val is the right hand side
  # * result is the left hand side
  # The plural definitions return an array while the singular ones
  # return a single element. In order to build a sensibly flat representation of the
  # document, we concatenate the single elements with the ones that return an array
  rule
    segments : segment segments { result = [val[0]] + val[1] }
             | segment { result = val }
    segment  : SEGSTART elems SEGEND { result = Edir::Segment.new([val[0]] + val[1]) }
             | SEGSTART SEGEND { result = Edir::Segment.new([val[0]]) }
    elems    : ELEMSEP elems { result = [val[0]] + val[1] }
             | ELEM elems { result = [val[0]] + val[1] }
             | ELEM { result = val }
end

---- header
require_relative 'lexer'
require_relative 'interchange'
require_relative 'functional_group'
require_relative 'transaction_set'
require_relative 'segment'
require_relative 'convert'

---- inner
include Edir::Convert

def initialize(debug: false)
  @yydebug = debug
end

def parse(str)
  @q = Edir::Lexer.new.lex_str(str)
  data = do_parse
  # Implicit segment vs document mode
  if data.length > 1
    convert_document(data)
  else
    data
  end
end

def next_token
  @q.shift
end
