class TenderParser

prechigh
    nonassoc UMINUS
    left '*' '/'
    left '+' '-'
  preclow
rule
  target: exp
        | /* none */ { result = 0 }

  exp: exp '+' exp { result += val[2] }
     | exp '-' exp { result -= val[2] }
     | exp '*' exp { result *= val[2] }
     | exp '/' exp { result /= val[2] }
     | '(' exp ')' { result = val[1] }
     | '-' NUMBER  =UMINUS { result = -val[1] }
     | NUMBER
end

---- inner
require './lexer'

def parse(str)
  @q = EdiLexer.new.lex_str(str)
  do_parse

end

def next_token
  @q.shift
end

---- footer

parser = TenderParser.new

test = "ISA*00*          *00*          *09*005070479ff    *ZZ*X0000X0        *931001*1020*U*00401*000848243*0*T*^~
GS*AA*6GQ9XQD*82MBE*20220307*050159*337658*T*004010~
ST*204*752456169~
B2******11~
B2A*00~
L11*360228*01~
G62*01*20220101~
MS3*1718*1~
LH6~
NTE**If we override the bandwidth, we can get to the SMTP capacitor through the cross~
N1*01*Anita John~
N3*1332 Smitham Drive~
N4~
N7**802204~
N7A~
N7B~
M7*645072~
S5*10*AL~
L11*27583*01~
G62*01*20220628~
LAD~
NTE**Use the auxiliary SDD system, then you can input the redundant hard drive!~
N1*01*Michal Kristinsdóttir~
N3*1352 Fisher Light~
N4~
G61*1A*Yhudah Castillo~
OID*963550~
SE*10*65733208~
GE*10*337658~
IEA*1*000848243~
"

puts parser.parse(test)
