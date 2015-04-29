/*
TEST_OUTPUT:
---
fail_compilation/lexer4.d(2): Error: unterminated character constant
fail_compilation/lexer4.d(4): Error: unterminated character constant
fail_compilation/lexer4.d(5): Error: unterminated character constant
fail_compilation/lexer4.d(6): Error: binary digit expected
fail_compilation/lexer4.d(7): Error: radix 8 digit expected, not '8'
fail_compilation/lexer4.d(7): Error: octal literals 0130 are no longer supported, use std.conv.octal!130 instead
fail_compilation/lexer4.d(8): Error: radix 10 digit expected, not 'a'
fail_compilation/lexer4.d(9): Error: unrecognized token
fail_compilation/lexer4.d(10): Error: exponent required for hex float
fail_compilation/lexer4.d(11): Error: lower case integer suffix 'l' is not allowed. Please use 'L' instead
fail_compilation/lexer4.d(12): Error: use 'i' suffix instead of 'I'
fail_compilation/lexer4.d(14): Error: line number 1234567891234567879 out of range
fail_compilation/lexer4.d(16): Error: #line integer ["filespec"]\n expected, not 'whatever'
fail_compilation/lexer4.d(19): Error: #line integer ["filespec"]\n expected, found extra start quote
fail_compilation/lexer4.d(19): Error: declaration expected, not '"file"'
fail_compilation/lexer4.d(24): Error: no identifier for declarator int
fail_compilation/lexer4.d(24): Error: declaration expected, not '#'
---
*/

#line 1

static c1 = '
;
static c2 = '';
static c3 = 'a;
int i = 0b12;
int j = 0128;
int k = 12a;
int l = 12UU;
int f = 0x1234.0;
int m = 12l;
static n = 12.1I;

#line 1234567891234567879

#line whatever

#line 18 __FILE__

#line 20 "file" "file"

/** asdf *//** asdf2 */
int o;

int #;

