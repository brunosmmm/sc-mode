# sc-mode
Emacs minor mode for the SpecC language

Adds some syntax highlighting for SpecC.

Instructions: just put sc-mode.el in the load path and use

```lisp
(require 'sc-mode)
```

Also do associate SpecC files to c/cc-mode by doing
```elisp
(setq auto-mode-alist (cons '("\\.sc\\'" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sh\\'" . c-mode) auto-mode-alist))
```
