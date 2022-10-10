require 'lex'

module Edir
  # Top level API class for providing EDI lexing
  class Lexer < Lex::Lexer
    tokens(
      :SEGSTART,
      :SEGEND,
      :ELEMSEP,
      :ELEM
    )

    states(
      insegment: :exclusive,
      inelement: :exclusive
    )

    rule(:SEGSTART, /\w{2,3}(?=[*|~])/) do |lexer, token|
      lexer.push_state(:insegment)
      token
    end

    # Rule to match when we have started a segment
    # but it has no elements
    rule(:insegment_SEGEND, /~|\n/) do |lexer, token|
      lexer.pop_state
      token
    end

    rule(:insegment_ELEMSEP, /\*|\|/) do |lexer, token|
      # If we are insegment, when we encounter an element separator it means
      # we should now be inelement. Otherwise, we were inelement and should
      # leave the state, back to insegment.
      if lexer.current_state == :insegment
        lexer.push_state(:inelement)
      else
        lexer.pop_state
      end
      token
    end

    rule(:inelement_ELEMSEP, /\*|\|/)

    rule(:inelement_ELEM, /[\w\s\-().,!:@>^]+/) do |_lexer, token|
      token.value = token.value.strip
      token
    end

    rule(:inelement_SEGEND, /~|\n/) do |lexer, token|
      lexer.pop_state
      lexer.pop_state
      token
    end

    ignore "\n"
    ignore :insegment, "\s"
    ignore :inelement, "\s"

    def lex_str(str)
      lex(str).map { |o| [o.name, o.value] }
    end
  end
end
