package Analizadores

import java_cup.runtime.*;

%%
%public
%class IdLexer
%cup

digit = [0-9]
letter = [a-zA-Z]
whitespace = [ \t\n]

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%eofval{
    return symbol(ParserSym.EOF);
%eofval}

%%

{digit}+ { return symbol(ParserSym.NUMBER, Integer.valueOf(yytext())); }
"(" {return symbol(ParserSym.pareni, yytext()); }
")" {return symbol(ParserSym.parend, yytext()); }
"+" {return symbol(ParserSym.mas, yytext()); }
"*" {return symbol(ParserSym.por, yytext()); }
"-" {return symbol(ParserSym.menos, yytext()); }
"/" {return symbol(ParserSym.division, yytext()); }

{whitespace}+ { /* skip white spaces */ }
[^]                             {throw new Error("Cadena ilegal <"+
                                                        yytext()+">"); }

