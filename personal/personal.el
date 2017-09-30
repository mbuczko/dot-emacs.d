(require 'highlight-indentation)
(require 'highlight-symbol)
(require 'golden-ratio)
(require 'helm-dash)
(require 'helm-clojuredocs)
(require 'diminish)
(require 'clj-refactor)
(require 'magit)
(require 'magit-gitflow)
(require 'magithub)
(require 'key-chord)
(require 'spaceline-config)

(scroll-bar-mode      -1)
(tool-bar-mode        -1)
(menu-bar-mode        -1)
(global-hl-line-mode   1)
(global-origami-mode   1)
(window-numbering-mode 1)
(blink-cursor-mode     1)
(golden-ratio-mode     1)
(helm-mode             1)
(paxedit-mode          1)
(key-chord-mode        1)
(yas/global-mode       1)

(spaceline-emacs-theme)
(spaceline-helm-mode)
(spaceline-toggle-anzu-off)
(spaceline-toggle-minor-modes-off)
(zerodark-setup-modeline-format)

(avy-setup-default)

;; UTF-8 preferred by default
(prefer-coding-system 'utf-8)

;; hydra config
(defhydra hydra-todo (:pre
                      (hl-todo-mode 1)
                      :post
                      (hl-todo-mode -1))
  "Todo"
  ("n" hl-todo-next "Next")
  ("p" hl-todo-previous "Previous")
  ("o" hl-todo-occur "Occur")
  ("q" nil "Quit" :color blue :exit t))


(setq prelude-guru nil
      prelude-whitespace nil
      prelude-flyspell nil

      mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier nil

      confirm-nonexistent-file-or-buffer nil
      tags-revert-without-query 1
      use-dialog-box nil

      ;; keep window splitting at sane proportions
      ;; with golden-ratio switched on

      split-width-threshold 0
      split-height-threshold nil
      window-min-width 30

      ibuffer-expert t
      ibuffer-show-empty-filter-groups nil
      ibuffer-saved-filter-groups
      '(("home"
         ("emacs-config" (or (filename . ".emacs") (filename . ".gnus")))
         ("Dired" (mode . dired-mode))
         ("Ruby" (mode . ruby-mode))
         ("CSS" (or (mode . scss-mode) (mode . css-mode)))
         ("JS" (mode . js2-mode))
         ("Clojure" (mode . clojure-mode))
         ("EShell" (mode . eshell-mode))
         ("Org" (or (mode . org-mode)))
         ("Gnus" (or (mode . message-mode)
                     (mode . bbdb-mode)
                     (mode . mail-mode)
                     (mode . gnus-group-mode)
                     (mode . gnus-summary-mode)
                     (mode . gnus-article-mode)))
         ("REPL" (name . "*cider-repl*"))
         ("ERB" (name ."*.erb*"))
         ("Magit" (name . "\*magit"))
         ("ERC" (mode . erc-mode))
         ("Help" (or (name . "\*Help\*")
                     (name . "\*Apropos\*")
                     (name . "\*info\*")))))

      ;; helm config

      ;; helm-split-window-in-side-p t
      ;; helm-split-window-default-side 'other
      helm-dash-common-docsets '("Clojure/Clojure"
                                 "Java_SE8/Java"
                                 "jQuery/jQuery"
                                 "Lo-Dash/Lo-Dash"
                                 "D3JS/D3JS"
                                 "JavaScript/JavaScript"))

(setq-default
 truncate-lines t
 delete-selection-mode t)

;; projectile setup
(projectile-global-mode)
(setq projectile-completion-system 'helm)

;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

;; magit gitflow enabler
(magithub-feature-autoinject t)

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; Switching to ibuffer puts the cursor on the most recent buffer
(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
           "Open ibuffer with cursor pointed to most recent buffer name"
           (let ((recent-buffer-name (buffer-name)))
             ad-do-it
             (ibuffer-jump-to-buffer recent-buffer-name)))

(ad-activate 'ibuffer)

;; (add-hook 'ibuffer-mode-hook
;;           '(lambda ()
;;              (ibuffer-auto-mode 1)
;;              (ibuffer-switch-to-saved-filter-groups "home")))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map [M-up]
              (lambda () (interactive) (find-alternate-file "..")))))

;; no trailing whitespaces, please!
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; helm fixed layout
(add-to-list 'display-buffer-alist
             `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.4)))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; magit UTF-8 setting
(add-to-list 'process-coding-system-alist '("git" utf-8 . utf-8))
(add-hook 'git-commit-mode-hook
          '(lambda ()
             (set-buffer-file-coding-system 'utf-8)))

;; magit toggle whitespaces
(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-arguments)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-arguments "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-arguments (remove "-w" magit-diff-arguments))
  (magit-refresh))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun find-tag-without-ns (next-p)
  (interactive "P")
  (find-tag (first (last (split-string (symbol-name (symbol-at-point)) "/")))
            next-p))

(defun whack-whitespace ()
  "Delete all white space from point to the next word.  With prefix ARG
    delete across newlines as well.  The only danger in this is that you
    don't have to actually be at the end of a word to make it work.  It
    skips over to the next whitespace and then whacks it all to the next
    word."
  (interactive)
  (re-search-forward "[ \t\n]+" nil t)
  (replace-match "" nil nil))

(defun cider-switch-repl ()
  "Switches between cider-repl and last active buffer"
  (interactive)
  (if (string-match "cider-repl" (buffer-name) 1)
      (cider-switch-to-last-clojure-buffer)
    (cider-switch-to-repl-buffer)))

;; javascript mode for all *.js and *.vue files
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

;; escape from helm easily
(add-hook 'helm-after-initialize-hook
          (lambda()
            (define-key helm-buffer-map (kbd "ESC") 'helm-keyboard-quit)
            (define-key helm-map (kbd "ESC") 'helm-keyboard-quit)))

;; js2-mode
(add-hook 'js2-mode-hook
          (lambda ()
            (turn-on-smartparens-strict-mode)))

;; css-less mode
(add-hook 'less-css-mode-hook
           (lambda ()
             (define-key less-css-mode-map (kbd "C-o") 'helm-css-scss)))

(add-hook 'css-mode-hook
           (lambda ()
             (define-key css-mode-map (kbd "C-o") 'helm-css-scss)))

;; clojure mode
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode)
            (cljr-add-keybindings-with-prefix "M-l")
            (turn-on-smartparens-strict-mode)
            (define-key clojure-mode-map (kbd "C-x C-d") 'helm-clojuredocs-at-point)))

;; cider-repl mode
(add-hook 'cider-repl-mode-hook
          (lambda ()
            (turn-on-smartparens-strict-mode)
            (define-key cider-repl-mode-map (kbd "C-x C-d") 'helm-clojuredocs-at-point)
            (define-key cider-repl-mode-map (kbd "M-r") 'cider-switch-repl)
            (define-key cider-repl-mode-map (kbd "M-[") 'cider-repl-previous-matching-input)))

;; treat some-symbol as a single word for editing
(dolist (c (string-to-list ":_-?!#*"))
  (modify-syntax-entry c "w" clojure-mode-syntax-table ))

;; Add custom magic requires to clj-refactor
(dolist (mapping '(("time" . "clj-time.core")
                  ("try"  . "clj-try.core")
                  ("rf"   . "re-frame.core")
                  ("log"  . "clojure.tools.logging")
                  ("str"  . "clojure.string")
                  ("json" . "cheshire.core")
                  ("csrf" . "ring.util.anti-forgery")
                  ("selmer"    . "selmer.parser")
                  ("response"  . "ring.util.response")
                  ("component" . "com.stuartsierra.component")
                  ("compojure" . "compojure.core")
                  ("liberator" . "liberator.core")))

(add-to-list 'cljr-magic-require-namespaces mapping t))

;; handy function used to reset clojure app via boot/reset task
(defun repl-reset ()
  "Sends (reset) to currently running repl"
  (interactive)
  (save-buffer)
  (sleep-for 1)
  (cider-interactive-eval "(boot.user/reset)"))

;; company mode FTW
(define-key company-active-map "\e" 'company-abort)
(setq company-transformers '(company-sort-by-occurrence)
      company-dabbrev-downcase nil)

;; yasnippet additional snippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets/web-mode"
                         "~/.emacs.d/snippets/clojure-mode"
                         "~/.emacs.d/snippets/js2-mode"))

;; global keybindings
(global-set-key (kbd "M-w")       nil)
(global-set-key (kbd "M-c")       'kill-ring-save)
(global-set-key (kbd "M-x")       'kill-region)
(global-set-key (kbd "M-v")       'yank)
(global-set-key (kbd "M-z")       'zop-to-char)
(global-set-key (kbd "M-e")       'helm-M-x)
(global-set-key (kbd "M-s")       'projectile-find-file)
(global-set-key (kbd "M-a")       'find-tag-without-ns)
(global-set-key (kbd "M-q")       'kill-buffer-and-window)
(global-set-key (kbd "M-t")       'projectile-toggle-between-implementation-and-test)
(global-set-key (kbd "M-;")       'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-p")       'crux-cleanup-buffer-or-region)
(global-set-key (kbd "M-[")       'paredit-wrap-square)
(global-set-key (kbd "M-{")       'paredit-wrap-curly)
(global-set-key (kbd "C-o")       'helm-imenu)
(global-set-key (kbd "C-b")       'helm-buffers-list)
(global-set-key (kbd "C-z")       'undo)
(global-set-key (kbd "C->")       'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-<")       'mc/mark-all-like-this-dwim)
(global-set-key (kbd "M-w q")     'er/mark-inside-quotes)
(global-set-key (kbd "M-w b")     'er/mark-inside-pairs)
(global-set-key (kbd "M-w w")     'er/mark-word)
(global-set-key (kbd "M-w c")     'er/mark-comment)
(global-set-key (kbd "M-w d")     'er/mark-defun)
(global-set-key (kbd "M-w i")     'er/mark-inner-tag)
(global-set-key (kbd "M-w o")     'er/mark-outer-tag)
(global-set-key (kbd "C-c d")     'duplicate-line)
(global-set-key (kbd "C-c m")     'magit-status)
(global-set-key (kbd "C-x x")     'repl-reset)
(global-set-key (kbd "C-x f")     'projectile-find-file)
(global-set-key (kbd "C-x C-o")   'avy-goto-char-timer)
(global-set-key (kbd "C-x C-i")   'helm-etags-select)
(global-set-key (kbd "C-x a")     'helm-grep-do-git-grep)
(global-set-key (kbd "C-x s")     'helm-projectile-grep)
(global-set-key (kbd "C-x o")     'helm-occur)
(global-set-key (kbd "C-x i")     'cider-browse-ns)
(global-set-key (kbd "C-x d")     'helm-dash-at-point)
(global-set-key (kbd "C-x C-r")   'helm-mini)
(global-set-key (kbd "C-x C-m")   'bm-toggle)
(global-set-key (kbd "C-x C-l")   'bm-show-all)
(global-set-key (kbd "C-h r")     'cljr-helm)
(global-set-key (kbd "C-S-h")     'highlight-symbol-at-point)
(global-set-key [C-S-down]        'highlight-symbol-next)
(global-set-key [C-S-up]          'highlight-symbol-prev)
(global-set-key [(C-backspace)]   'backward-kill-word)
(global-set-key [(C-S-return)]    'er/expand-region)
(global-set-key [(C-tab)]         'ace-window)

;; key chords
(key-chord-define-global "xx" 'whack-whitespace)

;; fight modeline clutter by removing or abbreviating minor mode indicators
(diminish 'projectile-mode)
(diminish 'golden-ratio-mode)
(diminish 'helm-mode)
(diminish 'yas-minor-mode)
(diminish 'visual-line-mode)
(diminish 'smartparens-mode)
(diminish 'paxedit-mode)
(diminish 'prelude-mode)
(diminish 'flycheck-mode)
(diminish 'company-mode)
(diminish 'abbrev-mode)
(diminish 'git-gutter+-mode)
(diminish 'clj-refactor-mode)
(diminish 'editorconfig-mode)
(diminish 'which-key-mode)
(diminish 'd)
;; (diminish 'magit-wip-after-save-mode)
;; (diminish 'magit-wip-after-save-local-mode)

(defun golden-size ()
  (golden-ratio)
  (if (not (string= major-mode "cider-repl-mode"))
      (move-to-left-margin)))

(defadvice select-window-by-number (after select-window activate)
  (golden-size))

(defadvice ace-select-window (after select-window activate)
  (golden-size))


;; SBCL
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "sbcl")
;; (slime-setup '(slime-company helm-slime))
