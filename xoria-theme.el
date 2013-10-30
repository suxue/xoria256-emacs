; Name:  xoria-theme.el
; Original Author: Dmitriy Y. Zotikov (xio) <xio@ungrund.org>
; Port by: Hao Fei <mrfeihao@gmail.com>
;
; original vim version AT
;  (http://www.vim.org/scripts/script.php?script_id=2140)

(make-face 'font-lock-number-face)
(set-face-attribute 'font-lock-number-face nil :inherit font-lock-constant-face)
(setq font-lock-number-face 'font-lock-number-face)
(defvar font-lock-number "[0-9]+\\([eE][+-]?[0-9]*\\)?")
(defvar font-lock-hexnumber "0[xX][0-9a-fA-F]+")

; from https://github.com/fgallina/python.el/issues/42
(defun add-font-lock-numbers ()
        (font-lock-add-keywords nil (list
                      (list (concat "\\<\\(" font-lock-number "\\)\\>" )
                       0 font-lock-number-face)
                      (list (concat "\\<\\(" font-lock-hexnumber "\\)\\>" )
                       0 font-lock-number-face)
                      )))

(deftheme xoria
  "port of xoria256.vim (vim.org #2140)")

(let ((class '((class color) (min-colors 89)))
    (default_fg "#d0d0d0") (default_bg "#202020")
    (cursor_line_bg "#3a3a3a")
    (inc_search_fg "black") (inc_search_bg "#80aa2a")
    (non_text_fg "#a8a8a8")
    (visual_fg "brightwhite") (visual_bg "brightblue")
    (wild_menu_fg "black") (wild_menu_fg "#dfdf00")
    ; syntax highlighting
    (comment_fg "#808080")
;    (constant_fg "#ffffaf")
    (constant_fg "#d4d480")
    (error_fg "brightwhite")
    (identifier_fg "#dfafdf")
    (ignore_fg "#444444")
    (line_no_fg "#3a3a3a")
    (match_paren_fg "#dfdfdf")
    (number_fg "#dfaf87")
    (preproc_fg "#afdf87")
    (special_fg "#dfaf87")
    (statement_fg "#5580aa")
    (todo_fg "black") (todo_bg "#5555aa")
    (special_fg "#df8787")
    (number_fg "#dfaf87")
    (success_fg "#2a2ad4")
    (warning_fg "#aa552a")
    (status_line_fg "brightwhite") (status_line_bg "#4e4e4e")
    (status_line_NC_fg "#b2b2b2") (status_line_NC_bg "#3a3a3a")
    (underlined_fg "#0080d4"))

  (custom-theme-set-faces
   'xoria
   ;; Ensure sufficient contrast on low-color terminals.
   `(default (
	      (((class color) (min-colors 256))
	       (:foreground ,default_fg  :background ,default_bg))))
   ;; Highlighting faces
   `(highlight ((,class (:foreground "black" :background "brightyellow"))))
   `(region ((,class (:background ,visual_bg :foreground ,visual_fg))))
   `(isearch ((,class (:foreground ,inc_search_fg :background ,inc_search_bg))))
   `(lazy-highlight ((,class (:background ,visual_bg :foreground ,visual_fg))))
   `(trailing-whitespace ((,class (:background "red"))))
   ;; Mode line faces
   `(mode-line ((,class
         (:box (:line-width -1 :style released-button)
          :background ,status_line_bg :foreground ,status_line_fg))))
   `(mode-line-inactive ((,class
              (:box (:line-width -1 :style released-button)
               :background ,status_line_NC_bg :foreground ,status_line_NC_fg))))
   `(compilation-mode-line-fail ((,class (:foreground "brightred"))))
   `(compilation-mode-line-run  ((,class (:foreground "brightyellow"))))
   `(compilation-mode-line-exit ((,class (:foreground "brightgreen"))))
   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:foreground ,default_fg))))
   `(escape-glyph ((,class (:foreground ,special_fg))))
   `(error ((,class (:foreground ,error_fg))))
   `(warning ((,class (:foreground ,warning_fg))))
   `(success ((,class (:foreground ,success_fg))))
   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,statement_fg))))
   `(font-lock-comment-face ((,class (:foreground ,comment_fg))))
   `(font-lock-constant-face ((,class (:foreground ,constant_fg))))
   `(font-lock-function-name-face ((,class (:foreground ,identifier_fg))))
   `(font-lock-keyword-face ((,class (:foreground ,statement_fg))))
   `(font-lock-string-face ((,class (:foreground ,constant_fg))))
   `(font-lock-type-face ((,class (:foreground "brightblue"))))
   `(font-lock-variable-name-face ((,class (:foreground ,default_fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,preproc_fg))))
   `(font-lock-number-face ((,class (:foreground ,number_fg))))
   `(hl-line ((,class (:background ,cursor_line_bg))))
   `(linum-highlight-face ((,class (:foreground "brightyellow" :background ,default_bg))))
   `(show-paren-match ((,class (:foreground ,visual_fg :background ,visual_bg))))
   )

)

(add-hook 'prog-mode-hook 'add-font-lock-numbers)

(provide-theme 'xoria)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; xoria-theme.el ends here
