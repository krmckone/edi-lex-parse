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
    segment  : SEGSTART elems SEGEND { return build_segment([val[0]] + val[1]) }
             | SEGSTART SEGEND { return build_segment(val) }
    elems    : ELEMSEP elems { return [val[0]] + val[1] }
             | ELEM elems { return [val[0]] + val[1] }
             | ELEM { return val }
end

---- header
require_relative 'lexer'

class Edir::Segment
  def initialize(data)
    @raw_data = data

    @segment_name = data.first
    @elements = []
    position = 0
    separators = 0
    @raw_data[1..].each do |element|
      if element =~ /[*|]/
        separators += 1
        position += 1
      else
        @elements.push([element, position])
      end
    end
  end
end

---- inner
def initialize(debug: false)
  @yydebug = debug
end

def parse(str)
  @q = Edir::Lexer.new.lex_str(str)
  do_parse
end

def next_token
  @q.shift
end

def build_segment(data)
  Edir::Segment.new(data)
end
