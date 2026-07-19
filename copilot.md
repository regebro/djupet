## project specific copilot.md instructions

For the right-side status panel used in this project:

- Enable graphics on rows `0..23` with `PRINT CUR(Row,30)CHR$(151)`.
- Draw panel border using `X=0..71` and `Y=62..79`.
- When printing text or numbers onto a graphics row in the status panel, first switch that row to character mode with `CHR$(135)`.
- After printing text or numbers on a status row, switch the row back to graphics mode with `CHR$(151)` and redraw the right-side vertical border using `"j"`.
- Lines printed with `PRINT CUR(...)` should end with `;` to avoid an unnecessary carriage return.

## Current Status Panel Layout

- Row 1 shows HP.
- Row 2 shows XP.
- Row 3 shows gold.
- Row 5 shows condition text.
- Row 8 shows `INV` and rows 9..18 show inventory slots `1..0`.

## Current Gameplay Conventions

- The player is drawn as `]` while moving, but the README describes the intended player glyph as `Å`.
- The entrance is `F` and the exit is `E`.
- Press `P` to pick up items from the floor.
- Press Enter while standing on `E` to go down to the next level.
- Gold is `.` on the floor; picking it up adds a random value from `1` to `10`.
- Inventory uses screen memory only, not a BASIC array.
- Inventory slots are rendered in the status panel and store the picked item character directly.

## Current Player State Conventions

- `H` is HP and should stay within `1..99`; if it reaches `0`, the player loses.
- `X` is XP and should stay within `1..99`.
- `U` is the hungry flag.
- `V` is the poisoned flag.
- Condition text on row 5 is blank for normal, `SV[LT` for hungry, `GIFT` for poisoned, and `SJUK` for hungry plus poisoned.
- `Z` is the current gold total.

## Roguelike Drawing Conventions Used

- Vertical wall: `!` (ASCII 33)
- Horizontal wall: `-` (ASCII 45)
- Corner: `+` (ASCII 43)
- Door: `+ +` (with a space in the middle), drawn by overwriting wall cells
- Entrance: `F` (ASCII 70)
- Exit: `E` (ASCII 69)
