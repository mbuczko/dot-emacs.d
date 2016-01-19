(require 'highlight-indentation)
(require 'highlight-symbol)
(require 'powerline)
(require 'golden-ratio)
(require 'helm-dash)
(require 'ace-isearch)
(require 'diminish)
(require 'clj-refactor)
(require 'magit)
(require 'magit-gitflow)
(require 'key-chord)

(scroll-bar-mode      -1)
(tool-bar-mode        -1)
(menu-bar-mode        -1)
(global-hl-line-mode   1)
(window-numbering-mode 1)
(blink-cursor-mode     1)
(golden-ratio-mode     1)
(helm-mode             1)
(paxedit-mode          1)
(key-chord-mode        1)
(yas/global-mode       1)

(powerline-default-theme)

;; Add custom magic requires to clj-refactor

(dolist (mapping '(("time" . "clj-time.core")
				   ("try"  . "clj-try.core")
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

;; UTF-8 preferred by default

(prefer-coding-system 'utf-8)

;; sane defaults

(setq-default truncate-lines t)
(setq default-process-coding-system 'utf-8)

;; git flow enabler

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; helm configuration

(setq helm-github-stars-username "mbuczko")
(setq helm-split-window-in-side-p t)

(add-to-list 'display-buffer-alist
			 `(,(rx bos "*helm" (* not-newline) "*" eos)
			   (display-buffer-in-side-window)
			   (inhibit-same-window . t)
			   (window-height . 0.4)))

(setq prelude-guru nil
	  prelude-whitespace nil
	  prelude-flyspell nil

	  mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier nil

	  tags-revert-without-query 1
	  powerline-arrow-shape 'slant-right
	  use-dialog-box nil

	  ;; keep window splitting at sane proportions
	  ;; with golden-ratio switched on

	  split-width-threshold 0
	  split-height-threshold nil
	  window-min-width 30)

;; no trailing whitespaces, please!

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; set deja-vu UTF characters
;; this is important for Gnus decorations

(set-fontset-font "-*-*-*-*-*-*-*-*-*-*-*-*-fontset-default"
                  (cons (decode-char 'ucs #x2500)
                        (decode-char 'ucs #x25ff))
                  "-apple-DejaVu_Sans_Mono-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(setq helm-split-window-default-side 'other
	  helm-dash-common-docsets '("jQuery/jQuery"
								 "JavaScript/JavaScript"
								 "NodeJS/NodeJS"
								 "Clojure/Clojure"
								 "Express/Express"
								 "Ruby_2/Ruby"
								 "Ruby_on_Rails_4/Ruby on Rails"))

;; projectile setup
;; (add-hook 'projectile-mode-hook 'projectile-rails-on)

(projectile-global-mode)

(setq projectile-completion-system 'grizzl)

(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories "bower_components")
(add-to-list 'projectile-globally-ignored-directories "dist")
(add-to-list 'projectile-globally-ignored-directories "out")
(add-to-list 'projectile-globally-ignored-directories "target")

;; ido magic

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-faces nil
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers nil
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(defun ido-disable-line-trucation ()
  (set (make-local-variable 'truncate-lines) nil))

(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

(setq ido-save-directory-list-file "~/tmp/ido.last"
      ido-ignore-buffers '( "\\` " "^\*" "^\:" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "\.bbdb" ".*nxhtml\-mode.*" "^\.newsrc*" ".*indent-buffer" "TAGS")
      ido-decorations '("  " "" " | " ", ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]")

      ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~/workspace")
      ido-case-fold  t                    ; be case-insensitive
      ido-enable-last-directory-history t ; remember last used dirs
      ido-max-work-directory-list 20      ; should be enough
      ido-max-work-file-list 50           ; remember many
      ido-use-filename-at-point nil       ; don't use filename at point (annoying)
      ido-use-url-at-point nil            ; don't use url at point (annoying)
      ido-enable-flex-matching nil        ; don't try to be too smart
      ido-max-prospects 8                 ; don't spam my minibuffer
      ido-confirm-unique-completion t     ; wait for RET, even with unique completion

      confirm-nonexistent-file-or-buffer nil) ; when using ido, the confirmation is rather annoying...


;; ibuffer setup
;; http://martinowen.net/blog/2010/02/tips-for-emacs-ibuffer.html

(setq ibuffer-expert t
	  ibuffer-show-empty-filter-groups nil
	  ibuffer-saved-filter-groups
      '(("home"
         ("emacs-config" (or (filename . ".emacs")
                             (filename . ".gnus")))
         ("Dired" (mode . dired-mode))
         ("Ruby" (mode . ruby-mode))
         ("CSS" (or (mode . scss-mode)
                    (mode . css-mode)))
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
                     (name . "\*info\*"))))))

; Switching to ibuffer puts the cursor on the most recent buffer

(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name"
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))

(ad-activate 'ibuffer)

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
         (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "home")))

;; dired configuration

(add-hook 'dired-mode-hook
		  (lambda ()
			(define-key dired-mode-map [M-up]
			  (lambda () (interactive) (find-alternate-file "..")))))

; custom commands for agenda view
(setq org-agenda-custom-commands
           '(("w" occur-tree "workshop")))

; org-capture templates go here
(setq org-capture-templates
      '(("t" "task"     entry (file+headline "/Volumes/External/Dropbox/lisp/org-mode/tasks.org" "Tasks") "* TODO %?\n  %i\n")
        ("l" "task linked" entry (file+headline "/Volumes/External/Dropbox/lisp/org-mode/tasks.org" "Tasks") "* TODO %?\n  %i\n  %a\n")
        ("c" "call"     entry (file+headline "/Volumes/External/Dropbox/lisp/org-mode/scheduled.org" "Calls") "* Call: %?\n  Scheduled on: %^T\n%i\n" "~/.notes/scheduled.org")
        ("m" "meet"     entry (file+headline "/Volumes/External/Dropbox/lisp/org-mode/scheduled.org" "Meets") "* Meeting: %?\n  Scheduled on: %^T\n%i\n" "~/.notes/scheduled.org")
        ("n" "contact"  entry (file+headline "/Volumes/External/Dropbox/lisp/org-mode/contacts.org" "Contacts") "* %^{Name}
:PROPERTIES:
:EMAIL: %^{Email}
:MOBILE: %^{Mobile}
:HOME:
:WORK:
:END:")
        ("@" "mail"  entry (file+headline "/Volumes/External/Dropbox/lisp/org-mode/contacts.org" "Contacts") "* %?%(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:"))

      appt-message-warning-time 15
      appt-display-mode-line t
      appt-display-format 'window

      org-startup-folded nil
      org-agenda-include-diary nil
      org-agenda-include-all-todo t
      org-agenda-ndays 7
      org-agenda-show-all-dates t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-start-on-weekday nil
      org-agenda-to-appt t
      org-reverse-note-order t
      org-deadline-warning-days 3
      org-use-fast-todo-selection t
      org-agenda-files (quote ("/Volumes/External/Dropbox/lisp/org-mode/tasks.org" "/Volumes/External/Dropbox/lisp/org-mode/scheduled.org" "/Volumes/External/Dropbox/lisp/org-mode/contacts.org"))
      org-contacts-files (quote ("/Volumes/External/Dropbox/lisp/org-mode/contacts.org"))
      org-log-into-drawer t
      org-log-done 'time
      org-log-note-headings
      (quote ((done . "CLOSING NOTE %t")
              (state . "State %-12s %t")
              (note . "Note taken on %t")
              (reschedule . "Rescheduled from %S on %t")
              (delschedule . "Not scheduled, was %S on %t")
              (redeadline . "New deadline from %S on %t")
              (deldeadline . "Removed deadline, was %S on %t")
              (refile . "Refiled on %t") (clock-out . "")))


      org-tag-alist '( ("HOME" . ?h) ("MOBI" . ?m))
      org-todo-keywords (quote ((sequence "TODO(t!)" "STARTED(s!)" "|" "DONE(d!/!)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)")
                                (sequence "OPEN(O!)" "|" "CLOSED(C!)")))

      org-todo-keyword-faces
      (quote (("TODO"        :foreground "red"          :weight bold)
              ("STARTED"     :foreground "green"        :weight bold)
              ("DONE"        :foreground "forest green" :weight bold)
              ("WAITING"     :foreground "yellow"       :weight bold)
              ("SOMEDAY"     :foreground "goldenrod"    :weight bold)
              ("CANCELLED"   :foreground "orangered"    :weight bold)
              ("OPEN"        :foreground "magenta"      :weight bold)
              ("CLOSED"      :foreground "forest green" :weight bold)))

      org-todo-state-tags-triggers
      (quote (("CANCELLED"
               ("CANCELLED" . t))
              ("WAITING"
               ("WAITING" . t))
              ("SOMEDAY"
               ("WAITING" . t))
              (done
               ("WAITING"))
              ("TODO"
               ("WAITING")
               ("CANCELLED"))
              ("STARTED"
               ("WAITING"))
              ("DONE"
               ("WAITING")
               ("CANCELLED")))))

;; Strike through headlines for DONE
;; http://sachachua.com/blog/2012/12/emacs-strike-through-headlines-for-done-tasks-in-org/

(setq org-fontify-done-headline t)

;; resolving issue that org-mode has with yasnippets (tab completion)
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
	  (lambda ()
        (visual-line-mode)
        (org-defkey org-mode-map [(meta e)] 'helm-M-x)

        ;; The way Org mode binds the TAB key (binding to [tab] instead of "\t") overrules YASnippet's access to this key.
        ;; The following code fixed this problem:

        (make-variable-buffer-local 'yas/trigger-key)
        (setq yas/trigger-key [tab])
        (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
        (define-key yas/keymap [tab] 'yas/next-field)))

;; full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

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

(defun eshell/clear ()
  "Hi, you will clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (message "erase eshell buffer")))

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


;; javascript mode

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

;; clojure mode

(add-hook 'clojure-mode-hook
		  (lambda ()
			(clj-refactor-mode 1)
			(cljr-add-keybindings-with-prefix "M-l")))

;; company mode FTW

(define-key company-active-map "\e" 'company-abort)
(setq company-transformers '(company-sort-by-occurrence))


;; global keybindings

(global-set-key (kbd "M-w")       nil)
(global-set-key (kbd "M-c")       'kill-ring-save)
(global-set-key (kbd "M-x")       'kill-region)
(global-set-key (kbd "M-v")       'yank)
(global-set-key (kbd "M-z")       'zop-to-char)
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
(global-set-key (kbd "C-x a")     'helm-git-grep-at-point)
(global-set-key (kbd "C-x f")     'projectile-find-file)
(global-set-key (kbd "C-x C-i")   'projectile-find-tag)
(global-set-key (kbd "C-x s")     'helm-git-grep)
(global-set-key (kbd "C-x a")     'helm-git-grep-at-point)
(global-set-key (kbd "C-x o")     'helm-occur)
(global-set-key (kbd "C-x C-r")   'helm-mini)
(global-set-key (kbd "C-x C-d")   'dash-at-point)
(global-set-key (kbd "C-x C-b")   'projectile-ibuffer)
(global-set-key (kbd "C-x C-m")   'bm-toggle)
(global-set-key (kbd "C-x C-l")   'bm-show-all)
(global-set-key (kbd "C-S-h")     'highlight-symbol-at-point)
(global-set-key [C-S-down]        'highlight-symbol-next)
(global-set-key [C-S-up]          'highlight-symbol-prev)
(global-set-key [(C-backspace)]   'backward-kill-word)
(global-set-key [(C-S-return)]    'er/expand-region)
(global-set-key [(C-tab)]         'helm-buffers-list)
(global-set-key [?\C-b]           'ido-switch-buffer)
(global-set-key [?\C-o]           'helm-imenu)
(global-set-key [?\C-p]           'helm-projectile)
(global-set-key [?\C-z]           'undo)
(global-set-key [?\M-e]           'helm-M-x)
(global-set-key [?\M-a]           'find-tag-without-ns)
(global-set-key [?\M-q]           'kill-buffer-and-window)
(global-set-key [?\M-t]           'projectile-toggle-between-implementation-and-test)
(global-set-key [?\M-\;]          'comment-or-uncomment-region-or-line)
(global-set-key [?\M-p]           '(lambda () (interactive) (save-excursion (mark-whole-buffer) (indent-for-tab-command))))
(global-set-key [?\M-i]           '(lambda () (interactive) (save-buffer) (sleep-for 1.3) (cider-interactive-eval "(boot.user/reset)")))
(global-set-key [?\M-[]           '(lambda () (interactive) (sp-wrap-with-pair "[")))

;; key chords

(key-chord-define-global "ff" "FORTYTWO-")
(key-chord-define-global "xx" 'whack-whitespace)

;; custom colors

(set-face-background 'highlight "gray20")
(set-face-background 'region "DodgerBlue4")

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
(diminish 'magit-wip-after-save-mode)
(diminish 'magit-wip-after-save-local-mode)


;; (setq cider-repl-history-file ".cider_history")
