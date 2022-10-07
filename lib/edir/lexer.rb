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

    # Right now we match all whitespace elements without stripping. It
    # would be good to know how to trip whitespace without entering
    # an infinite loop in lexing the rest.
    rule(:inelement_ELEM, /[\w\s\-\\(\\).,!:@>^]+/)

    rule(:inelement_SEGEND, /~|\n/) do |lexer, token|
      lexer.pop_state
      lexer.pop_state
      token
    end

    ignore "\n"
    ignore :insegment, "\n"
    ignore :inelement, "\n"

    def lex_str(str)
      lex(str).map { |o| [o.name, o.value] }
    end

    def testing
      test_str = <<~TENDER
        ISA*00*          *00*          *09*005070479ff    *ZZ*X0000X0        *931001*1020*U*00401*000952061*0*T*^~
        GS*AA*64GVCAJ68Y*2L0CIJM03G*20220920*084151*598951*T*004010~
        ST*204*386417176~
        B2******11~
        B2A*00~
        MS3*8651*1~
        PLD*10~
        LH6~
        NTE**Try to bypass the SCSI sensor, maybe it will generate the 1080p card!~
        N1*01*Valentina Santiago~
        N3*1338 Zboncak Center~
        N7**381981~
        N7B~
        M7*158707~
        S5*10*AL~
        G62*01*20220227~
        AT8~
        AT5~
        PLD*10~
        NTE**If we override the bandwidth, we can get to the SMTP capacitor through the cross~
        N1*01*Yaakv Allen~
        N3*907 Torphy Fords~
        N4~
        G61*1A*Hiroko Shimizu~
        OID*333591~
        G62*01*20211230~
        SE*10*604150077~
        GE*10*598951~
        IEA*1*000952061~
      TENDER
      lex_str(test_str)
    end
  end
end
