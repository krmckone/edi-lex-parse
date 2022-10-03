require 'lex'
require 'pry'

class EdiLexer < Lex::Lexer
  tokens(
    :ELEMSEP,
    :SEGSEP,
    :ELEM
  )

  rule(:ELEMSEP, /\*|\|/)
  rule(:SEGSEP, /~|\n/)
  rule(:ELEM, /([a-zA-Z0-9^\u00C0-\u017F,!\?\.]\s?)+/)

  ignore "\s\t\n"

  def lex_str(str)
    lex(str).map do |o| [o.name, o.value] end
  end
end
