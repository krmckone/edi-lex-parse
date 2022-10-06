require 'lex'
require 'pry'

class EdiLexer < Lex::Lexer
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

  rule(:SEGSTART, /\w{2,3}(?=\*)/) do |lexer, token|
    lexer.push_state(:insegment)
    token
  end

  rule(:insegment_ELEMSEP, /\*|\|/) do |lexer, token|
    if lexer.current_state == :insegment
      lexer.push_state(:inelement)
    else
      lexer.pop_state
    end
    token
  end

  rule(:inelement_ELEMSEP, /\*|\|/) do |lexer, token|
    token
  end

  rule(:inelement_ELEM, /[\w\s\-\\(\\).,!:@>]+/) do |_lexer, token|
    # token.value = token.value.strip
    token
  end

  rule(:inelement_SEGEND, /~|\n/) do |lexer, token|
    lexer.pop_state
    lexer.pop_state
    token
  end

  ignore "\s\t\n"
  ignore :insegment, "\t"
  ignore :inelement, "\t"

  def lex_str(str)
    lex(str).map { |o| [o.name, o.value] }
  end

  def testing
    test_str = "ISA*00*          *00*          *08*9251554000     *02*APYI           *220909*1911*U*00401*000211456*0*P*>~GS*SM*9251554000*APYI*20220909*1911*211456*X*004010~ST*204*0001~B2**APYI**0033324410**PP~B2A*00~L11*0033324410*SI*ShipmentID~L11*116251539*TN*TransactionNumber~L11*0050494600*ZZ*Carrier ID~L11*0033324410*MB*BOL~L11*00794000333244104*BM*VICSBOL~L11*OB*S5*IB-OB Indicator~L11*1447.28 USD*LH*Linehaul Cost~L11*HAZMAT INDICATOR*HD*N~L11*UL COMMENT*TOC*LIVE~G62*64*20220909*1*202504~MS3*APYI*B**J~PLD*27~NTE*ZZZ*Reefer set point of -20F (-28.8C)during transit: preload may begin once trailer~NTE*ZZZ*reaches -10F degrees~NTE*ZZZ*UL_PALLET_COUNT: 27~NTE*ZZZ*UL_PIECE_COUNT: 5500~N1*SH*KEVIN AGUILAR~G61*SH*KEVIN AGUILAR*EM*kevin.g.aguilar@unilever.com~N7**FZNTLUS53~MEA*TE*TES**FA**-20~S5*1*LD~G62*37*20220914*E*000000~G62*37*20220914*D*000000~LAD*****L*4351*ZZ*0193858450_000010-001*VN*000000000068607438~LAD*****L*23138*ZZ*0193858450_000020-001*VN*000000000068649099~N1*SF*SIKESTON OVERFLOW*ZZ*USZQ~N3*444 GILBERT ROAD~N4*BENSON*NC*27504*USA~OID**7604353256*0193858450*UN*5500*L*27489*E*1995~S5*2*UL~G62*53*20220916*E*000000~G62*53*20220916*D*000000~LAD*****L*4351*ZZ*0193858450_000010-001*VN*000000000068607438~LAD*****L*23138*ZZ*0193858450_000020-001*VN*000000000068649099~N1*ST*LITTLE ROCK OVERFLOW*ZZ*USZY~N3*1400 GREGORY STREET~N4*NORTH LITTLE ROCK*AR*72114*USA~OID**7604353256*0193858450*UN*5500*L*27489*E*1995~L3*27489*L*******1995*E*5500*L~SE*43*0001~GE*1*211456~IEA*1*000211456~"
    lex_str(test_str)
  end
end
