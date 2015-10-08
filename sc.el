;;; sc-mode ---  Better syntax highlighting for SpecC
;;; Commentary:
;; Author: Bruno Morais <brunosmmm@gmail.com>

;;; Code:
(require 'font-lock)
(require 'cc-mode)

;;;###autoload
(define-minor-mode sc-mode
  "SpecC keywords and other on top of cc-mode"
  :lighter " SpecC"

  ; define our keywords
  (defvar thekwords)
  (setq thekwords
        '(("\\_<\\(import\\|try\\|interrupt\\|trap\\|par\\|fsm\\|pipe\\|notify\\|implements\\|range\\|timing\\|wait\\(for\\)?\\)\\_>" . font-lock-keyword-face)
                                        ; maybe it would be good to move some of those to builtin face to get extra emphasis

          ("\\_<\\(signal\\|buffered\\|piped\\|interface\\|behavior\\|channel\\|event\\)\\_>" . font-lock-type-face)
                            ; bit type
          ("\\_<\\(bit\\)\\(\[[0-9+]:[0-9]+\]\\)?\\_>" 1 font-lock-type-face)

                            ;input / output declarations
          ("\\_<\\(in\\)?\\(out\\)?\\_>" . font-lock-builtin-face)
          ))

  (if sc-mode
      (font-lock-add-keywords nil thekwords)
    (font-lock-remove-keywords nil thekwords)
    )

                                        ;update buffer
  (if (fboundp 'font-lock-flush)
      (font-lock-flush)
    (when font-lock-mode
      (with-no-warnings
        (font-lock-fontify-buffer))))

  )

(provide 'sc)
;;; sc.el ends here
