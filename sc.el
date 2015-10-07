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

  (font-lock-add-keywords nil
                          '(("\\_<\\(try\\|interrupt\\|trap\\|par\\|fsm\\|pipe\\|notify\\|implements\\|range\\|timing\\|wait\\(for\\)?\\)\\_>" . font-lock-keyword-face)
                            ("\\_<\\(piped\\|interface\\|behavior\\|channel\\|event\\)\\_>" . font-lock-type-face)
                            ("\\_<\\(bit\\)\\(\[[0-9+]:[0-9]+\]\\)?\\_>" 1 font-lock-type-face)
                            ("\\_<\\(in\\)?\\(out\\)?\\_>" . font-lock-builtin-face)
                            )
                          )

  (if (fboundp 'font-lock-flush)
      (font-lock-flush)
    (when font-lock-mode
      (with-no-warnings
        (font-lock-fontify-buffer))))

  )

(provide 'sc)
;;; sc.el ends here
