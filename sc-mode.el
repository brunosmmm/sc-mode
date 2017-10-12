;;; sc-mode.el ---  Better syntax highlighting for SpecC
;; Author: Bruno Morais <brunosmmm@gmail.com>

;;; Code:
(require 'font-lock)
(require 'cc-mode)

(defun check-and-load () "Check if this is a SpecC file by looking at the file name and load sc-mode automatically."

  ;;check that this is a SpecC file and if so load sc-mode
  (when (string-match ".*\\.\\(sc\\|sh\\|sx\\)$" buffer-file-name)
    (sc-mode)))

;;;###autoload
(define-minor-mode sc-mode
  "SpecC keywords and other on top of cc-mode"
  :lighter " SpecC"

  ;; check if in C mode

  (if (string-equal major-mode "c-mode")
      (progn
        ;; define our keywords
        (defvar sc-mode-kwords)
        (setq sc-mode-kwords
              '(("\\_<\\(note\\|seq\\|import\\|try\\|interrupt\\|trap\\|par\\|fsm\\|pipe\\|notify\\|range\\|timing\\|wait\\(for\\)?\\)\\_>" . font-lock-keyword-face)
                ;; maybe it would be good to move some of those to builtin face to get extra emphasis
                ("\\_<\\(signal\\|buffered\\|piped\\|interface\\|behavior\\|channel\\|event\\)\\_>" . font-lock-type-face)
                ;; implements keyword (doesn't work)
                ("\\_<implements\\_>" . font-lock-keyword-face)
                ;; bit type
                ("\\_<\\(bit\\)\\(\[[0-9+]:[0-9]+\]\\)?\\_>" 1 font-lock-type-face)
                ;;input / output declarations
                ("\\_<\\(in\\)?\\(out\\)?\\_>" . font-lock-builtin-face)
                ))

        (if sc-mode
            (font-lock-add-keywords nil sc-mode-kwords)
          (font-lock-remove-keywords nil sc-mode-kwords)
          )

        ;; update buffer
        (if (fboundp 'font-lock-flush)
            (font-lock-flush)
          (when font-lock-mode
            (with-no-warnings
              (font-lock-fontify-buffer)))))
    (message "not in c-mode")))

;; add C mode hook
;;;###autoload
(add-hook 'c-mode-common-hook 'check-and-load)

(provide 'sc-mode)
;;; sc-mode.el ends here
