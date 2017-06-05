
%{

unsigned charCount = 0, wordCount = 0, lineCount = 0, punctCount = 0;

%}

word [^ \t\n.!?,]+
punct [.!?,]
eol \n

%%

{punct} { charCount++; punctCount++; }
{word} {wordCount++; charCount += yyleng; }
{eol} { charCount++; lineCount++; }
. charCount++;

%%

int main()
{
	
	yylex();
	printf("Line Count:%d\nWord Count:%d\nPunctuation Count:%d\nCharacter Count:%d\n",
	lineCount, wordCount, punctCount, charCount);
	return 0;

}

