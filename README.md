# racket-practice

# Setup
## Environment
Downlad and install racket.

[Download Racket](http://racket-lang.org/download/)

## Editor
Install [emacs](https://www.gnu.org/software/emacs/download.html).

Add the line as `~/.emacs.d/init.el` to load melpa.

```
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
```

Start emacs and type `M(Esc or Alt)-x` + `list-package` then install `racket-mode` and `paredit`.

Add the following lines for `~/.emacs.d/init.el` to activate paredit for racket.

```
(require 'paredit)
(add-hook 'racket-mode-hook 'paredit-mode)
(add-hook 'racket-repl-mode-hook 'paredit-mode)
```

On `racket-mode`, you can execute your code on repl by typing `Ctrl-c` twice.

# Programs
## first-program
```
./first-program
```

## first-server
```
raco pkg install --auto web-server
racket first-server.rkt
```

You can access http://localhost:8001/first-page

## first-gui
```
racket first-gui.rkt
```

Run with using standanlone file.
```
raco exe --gui first-gui.rkt
./first-gui
```

## second, third gui
```
racket second-gui.rkt
racket thirg-gui.rkt
```

## serial monitor
```
sudo apt install libserialport-dev
raco pkg install --auto libserialport
racket serial-monitor.rkt
```

## first contract
```
racket first-contract.rkt
```

# References
- [The Racket Guide](https://docs.racket-lang.org/guide/index.html)
- [Simple Web Applications in Racket](https://www.monolune.com/simple-web-applications-in-racket/)
- [The Racket Graphical Interface Toolkit](https://docs.racket-lang.org/gui/)
- [2 raco exe: Creating Stand-Alone Executables](https://docs.racket-lang.org/raco/exe.html)
- [read-bytes-avail!*](https://docs.racket-lang.org/reference/Byte_and_String_Input.html#%28def._%28%28quote._~23~25kernel%29._read-bytes-avail%21%2A%29%29)
- [Interface and Application Programming](http://fab.cba.mit.edu/classes/863.17/Harvard/people/julia-ebert/2017/11/22/interface-application-programming.html)
