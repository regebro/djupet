# ABC80 BASIC Notes

## Language And Syntax

- Numeric variables should use integer suffix `%` for speed (example: `A%`, `X%`, `P%(K%)`).
- Keep variable names single-letter (with optional `%` or `$` suffix).
- String variables use `$` (example: `C$`, `CHR$`).
- In complex logical `IF` expressions, wrap each part in parentheses.
  - Example: `IF (Y%=T%) AND ((X%=L%) OR (X%=L%+2)) THEN ...`

A note: The $ sign is on ABC80 replaced with a currency sign: ¤ 
It has the ASCII value of $, so this text uses $ as it's replacement for simplicity.
The display looks like ¤, but for all intents and purposes it's a $.

## Screen Handling

- Clear the screen with: `PRINT CHR$(12)`.
- Text cursor placement uses `CUR(Row,Col)` in print statements.
  - `Row` is vertical and ranges `0..23`.
  - `Col` is horizontal and ranges `0..39`.
  - Ending a print statement with `;` skips the CR, which is good practice
    if printing in specific positions with CUR() calls.
  - Example: `PRINT CUR(4,5)"Text output";` prints at row 4, column 5.

- Screen memory can be written directly with `POKE`.

## ABC80 Text Screen Addressing

The ABC80 text rows are not linear in memory.

- Top-left screen address is `31744`.
- Rows are grouped into 3 groups of 8 rows.
- Within a group, each next row starts `128` bytes later.
- The next group starts `40` bytes later.

For 1-based text coordinates `(X%, Y%)` where `X%` is horizontal (column) and `Y%` is vertical (row):

- `R%=Y%-1`
- `G%=INT(R%/8)`
- `B%=R%-(G%*8)`
- `A%=31744+(G%*40)+(B%*128)+(X%-1)`

Use `A%` as the target address for `POKE`.

## Graphics

The ABC80 has a 78 x 72 graphics mode that must be enabled row by row,
by printing the ASCII code 151, and can be reset back with character 135.

Graphics pixel coordinates use `SETDOT X,Y` and `CLRDOT X,Y` where:

- `X` is vertical pixel position (`0..71`).
- `Y` is horizontal pixel position (`2..79`).

You can set a pixel to white with `SETDOT X,Y` and to black with `CLRDOT X,Y`.
You can also create graphics by just printing ASCII characters from 0 to 63
which will, if the line is in graphics mode, create a pattern of six dots.

The dots in each character are according to the binary value of the character,
with the bits in this order:

  0 1
  2 3
  4 5

ASCII characters with a value above 63 will be shown as normal, 
even if the line is in graphics mode.

## Input

Inputing a string is done with INPUTLINE

50 INPUTLINE K$

You can also input a string with INPUT

50 INPUT K$

That will prompt with a ? first, and strip all whitespace.

One character key reading is done with GET, for example:

50 GET K$

Which puts the pressed key into K$.

To read keys without pausing, use INP(56)

60 K = INP(56)

This reads the keyboard status without pausing. If a key is pressed, 
it will return the key code of that key + 128. If no key is pressed,
it will return the key code of the last pressed key.
