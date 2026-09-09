The emulator and BASIC converter on this site support several standard cross-compiler macro sets used for PETSCII control codes (such as **petcat**, **C64Studio**, **BasText**, and **c64list**).

### Common Macro Definitions

#### Colors

* **`{blk}`**, **`{wht}`**, **`{red}`**, **`{cyn}`**, **`{pur}`**, **`{grn}`**, **`{blu}`**, **`{yel}`**
* **`{rvon}`** / **`{rvof}`** (reverse video on/off)
* **`{orng}`**, **`{brn}`**, **`{lred}`**, **`{gry1}`**, **`{gry2}`**, **`{lgry}`** *(or `{lgray}` depending on the macro set)*, **`{lblu}`**, **`{lgrn}`**

#### Cursor Movement & Screen Control

* **`{clr}`** or `{home}` (clear screen / cursor home)
* **`{up}`**, **`{down}`**, **`{left}`**, **`{right}`**
* **`{crsr up}`**, **`{crsr down}`**, **`{crsr left}`**, **`{crsr right}`**
* **`{inst}`**, **`{del}`**

#### Case Switching

* **`{swlc}`** (switch to lower/upper-case mode)
* **`{swuc}`** (switch to upper/graphic mode)

### How to Select or Check Active Macro Sets

On the web page, click **[Convert]** (or navigate to the [C64 PRG/BASIC converter](https://stigc.dk/c64/basic/convert/)) to select the exact macro definition dialect (**petcat**, **C64Studio**, **BasText**, or **c64list**) or toggle **Apply macros** off/on.
