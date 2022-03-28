/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite

/* definitions regulieres */
number = [0-9]+
//word = [a-zA-Z_][a-zA-Z_0-9]*
word = [:letter:]\w*
blank = \n|\r|\r\n|\s|\t
semi = ";"
error = "erreur" | "ERREUR"
declaration_ident = "let" | "LET"


plus = "+"
minus = "-"
mult = "*"
div = "/"
mod = "%"
lpar = "("
rpar = ")"
equal = "="
comment = \/\/.*\n | \/\*.*\*\/





%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */

{blank} {/*nothing to do*/}
{number} {return new Symbol(SimpleParserSym.NUMBER, yyline, yycolumn, Integer.parseInt(yytext())); }
{word} {return new Symbol(SimpleParserSym.WORD, yyline, yycolumn, yytext()); }
{semi} {return new Symbol(SimpleParserSym.SEMI, yyline, yycolumn); }
{error} {return new Symbol(SimpleParserSym.ERROR, yyline, yycolumn); }
{declaration_ident} {return new Symbol(SimpleParserSym.DECLARATION_IDENT, yyline, yycolumn); }
{lpar} {return new Symbol(SimpleParserSym.LPAR, yyline, yycolumn); }
{rpar} {return new Symbol(SimpleParserSym.RPAR, yyline, yycolumn); }
{comment} {/*nothing to do*/}


{plus} {return new Symbol(SimpleParserSym.PLUS, yyline, yycolumn); }
{minus} {return new Symbol(SimpleParserSym.MINUS, yyline, yycolumn); }
{mult} {return new Symbol(SimpleParserSym.MULT, yyline, yycolumn); }
{div} {return new Symbol(SimpleParserSym.DIV, yyline, yycolumn); }
{mod} {return new Symbol(SimpleParserSym.MOD, yyline, yycolumn); }
{equal} {return new Symbol(SimpleParserSym.EQUAL, yyline, yycolumn); }
