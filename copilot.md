## project specific copilot.md instructions

For the right-side status panel used in this project:

- Enable graphics on rows `0..23` with `PRINT CUR(Row,30)CHR$(151)`.
- Draw panel border using `X=0..71` and `Y=62..79`.

## Roguelike Drawing Conventions Used

- Vertical wall: `!` (ASCII 33)
- Horizontal wall: `-` (ASCII 45)
- Corner: `+` (ASCII 43)
- Door: `+ +` (with a space in the middle), drawn by overwriting wall cells
- Entrance: `E` (ASCII 69)
- Exit: `X` (ASCII 88)
