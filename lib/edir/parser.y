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
    segment  : SEGSTART elems SEGEND { result = build_segment([val[0]] + val[1]) }
             | SEGSTART SEGEND { result = build_segment(val) }
    elems    : ELEMSEP elems { result = [val[0]] + val[1] }
             | ELEM elems { result = [val[0]] + val[1] }
             | ELEM { result = val }
end

---- header
require_relative 'lexer'

class Edir::Interchange
  def initialize(func_groups)
    @func_groups = func_groups
  end
end

class Edir::FunctionalGroup
  def initialize(transac_sets)
    @transac_sets = transac_sets
  end
end

class Edir::TransactionSet
  def initialize(segments)
    @segments = segments
  end
end

class Edir::Segment
  attr_reader :elements
  attr_reader :name

  def initialize(data)
    @raw_data = data

    @name = data.first
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
  data = do_parse
  convert(data)
end

def next_token
  @q.shift
end

def build_segment(data)
  Edir::Segment.new(data)
end

# For each transaction set start/end, create a unique transaction set object with
# the corrsponding segments.
# For each functional group start/end, create a unique functional group object with
# the corresponding transaction sets.
# For each interchange start/end, create a unique interchange object with the corresponding
# functional groups
def convert(data)
  # We need to be able to handle an arbitrary number of start/ends for each logical
  # grouping
  transac_set_start = data.find_index do |segment|
    segment.name == 'ST'
  end
  transac_set_end = data.find_index do |segment|
    segment.name == 'SE'
  end
  func_group_start = data.find_index do |segment|
    segment.name == 'GS'
  end
  func_group_end = data.find_index do |segment|
    segment.name == 'GE'
  end
  inter_start = data.find_index do |segment|
    segment.name == 'ISA'
  end
  inter_end = data.find_index do |segment|
    segment.name == 'IEA'
  end
  data
end
