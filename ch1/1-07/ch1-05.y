%{

/* building a lexical analyzer
for high-level parser
*/

#include "stdio.h"

%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUCTION

%%

sentence: subject VERB object{ printf("Sentence is valid.\n"); };

subject:	NOUN | PRONOUN;

object:		NOUN;

%%

main()
{
	do
	{
		yyparse();
	}
	while(!feof(yyin));
}

yyerror(s) char *s;
{
	fprintf(stderr, "%s\n", s);
}
