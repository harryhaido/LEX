import java_cup.runtime.*;
%%

%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%class A3Scanner
%eofval{ return null;
%eofval}

IDENTIFIER = [a-zA-Z][a-zA-Z0-9]*
NUMBER = [0-9]+(\.[0-9]+)?
QUOTE = \"[^\"]*\"


%state COMMENT

%%
<YYINITIAL>"/**" {yybegin(COMMENT);}
<COMMENT>"**/" {yybegin(YYINITIAL);}
<COMMENT>\r|\n|. {}

<YYINITIAL>"+" { return new Symbol(A3Symbol.PLUS); }
<YYINITIAL>"-" { return new Symbol(A3Symbol.MINUS); }
<YYINITIAL>"*" { return new Symbol(A3Symbol.TIMES); }
<YYINITIAL>"/" { return new Symbol(A3Symbol.DIVIDE); }
<YYINITIAL>"(" { return new Symbol(A3Symbol.LPAREN); }
<YYINITIAL>")" { return new Symbol(A3Symbol.RPAREN); }
<YYINITIAL>"," { return new Symbol(A3Symbol.COMMA); }
<YYINITIAL>";" { return new Symbol(A3Symbol.SEMI); }
<YYINITIAL>":=" { return new Symbol(A3Symbol.ASSIGN); }
<YYINITIAL>"==" { return new Symbol(A3Symbol.EEQUAL); }
<YYINITIAL>"!=" { return new Symbol(A3Symbol.NEQUAL); }

<YYINITIAL>"WRITE" { return new Symbol(A3Symbol.WRITE); }
<YYINITIAL>"READ" { return new Symbol(A3Symbol.READ); }
<YYINITIAL>"IF" { return new Symbol(A3Symbol.IF); }
<YYINITIAL>"ELSE" { return new Symbol(A3Symbol.ELSE); }
<YYINITIAL>"RETURN" { return new Symbol(A3Symbol.RETURN); }
<YYINITIAL>"BEGIN" { return new Symbol(A3Symbol.BEGIN); }
<YYINITIAL>"END" { return new Symbol(A3Symbol.END); }
<YYINITIAL>"MAIN" { return new Symbol(A3Symbol.MAIN); }
<YYINITIAL>"STRING" { return new Symbol(A3Symbol.STRING); }
<YYINITIAL>"INT" { return new Symbol(A3Symbol.INT);}
<YYINITIAL>"REAL" { return new Symbol(A3Symbol.REAL);}




<YYINITIAL>{IDENTIFIER} { return new Symbol(A3Symbol.IDENTIFIER, yytext());}
<YYINITIAL>{NUMBER} { return new Symbol(A3Symbol.NUMBER, yytext());}  
<YYINITIAL>{QUOTE} { return new Symbol(A3Symbol.QUOTE, yytext()); }


<YYINITIAL>\r|\n|\t|" " {}
<YYINITIAL>. { return new Symbol(A3Symbol.error); }