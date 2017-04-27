# terminal-keypress

Read keypresses from the terminal using [trivial-raw-io][trio].

# Overview

This is a library for reading semi-raw user input from terminals. Semi-raw as
in, we can't detect if the user pressed the <kbd>Control</kbd> key alone, and
the function keys are a mystery.

What is supported, however, is:

1. Regular characters
2. <kbd>Control</kbd>+<kbd>[key]<kbd>
3. <kbd>Alt</kbd>+<kbd>[key]<kbd>
4. <kbd>Control</kbd>+<kbd>Alt</kbd>+<kbd>[key]<kbd>

# Usage

```lisp
CL-USER> (terminal-keypress:read-event)
;; Press 't'

#S(TERMINAL-KEYPRESS::KEYPRESS
   :BYTES #(116)
   :CHARACTER #\t
   :CONTROL NIL
   :ESCAPE NIL)


CL-USER> (terminal-keypress:read-event)
;; Press 'Control-t'

#S(TERMINAL-KEYPRESS::KEYPRESS
   :BYTES #(20)
   :CHARACTER #\T
   :CONTROL T
   :ESCAPE NIL)


CL-USER> (terminal-keypress:read-event)
;; Press 'Alt-t'

#S(TERMINAL-KEYPRESS::KEYPRESS
   :BYTES #(27 116)
   :CHARACTER #\t
   :CONTROL NIL
   :ESCAPE T)


CL-USER> (terminal-keypress:read-event)
;; Press 'Control-Alt-t'

#S(TERMINAL-KEYPRESS::KEYPRESS
   :BYTES #(27 20)
   :CHARACTER #\T
   :CONTROL T
   :ESCAPE T)
```

# License

Copyright (c) 2016–2017 Fernando Borretti

Licensed under the MIT License.

[trio]: http://quickdocs.org/trivial-raw-io/
