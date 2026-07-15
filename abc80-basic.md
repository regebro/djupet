# ABC80 BASIC Notes

## Language And Syntax

- Numeric variables should use integer suffix `%` for speed (example: `A%`, `X%`, `P%(K%)`).
- Keep variable names single-letter (with optional `%` or `$` suffix).
- String variables use `$` (example: `C$`, `CHR$`).
- In complex logical `IF` expressions, wrap each part in parentheses.
  - Example: `IF (Y%=T%) AND ((X%=L%) OR (X%=L%+2)) THEN ...`

## Screen Handling

- Clear the screen with: `PRINT CHR$(12)`.
- Screen memory can be written directly with `POKE`.

## ABC80 Text Screen Addressing

The ABC80 text rows are not linear in memory.

- Top-left screen address is `31744`.
- Rows are grouped into 3 groups of 8 rows.
- Within a group, each next row starts `128` bytes later.
- The next group starts `40` bytes later.

For 1-based screen coordinates `(X%, Y%)`:

- `R%=Y%-1`
- `G%=INT(R%/8)`
- `B%=R%-(G%*8)`
- `A%=31744+(G%*40)+(B%*128)+(X%-1)`

Use `A%` as the target address for `POKE`.

## Key input

Real time key reading is done with GET, for example:

50 GET K$

Which puts the last pressed key into K$ without pausing.


## Roguelike Drawing Conventions Used

- Vertical wall: `!` (ASCII 33)
- Horizontal wall: `-` (ASCII 45)
- Corner: `+` (ASCII 43)
- Door: `+ +` (with a space in the middle), drawn by overwriting wall cells
- Entrance: `E` (ASCII 69)
- Exit: `X` (ASCII 88)
