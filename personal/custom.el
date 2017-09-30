(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ack-and-a-half-executable "/usr/local/bin/ack")
 '(ack-and-a-half-mode-extension-alist
   (quote
    ((js2-mode "js" "json" "rb")
     (js-mode "js" "json" "rb"))))
 '(ack-executable "/usr/local/bin/ack")
 '(appmenu-mode nil)
 '(auth-sources (quote ("~/.authinfo" "~/.authinfo.gpg")))
 '(auto-dim-other-buffers-mode t)
 '(bell-volume 0)
 '(block-comment-end nil t)
 '(bm-buffer-persistence t)
 '(bm-electric-show t)
 '(bm-recenter t)
 '(bmkp-auto-light-when-set (quote autonamed-bookmark))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(canlock-password "1085e8558dcb0236dbd9c1926f175176486526c1")
 '(case-fold-search t)
 '(cider-default-repl-command "boot")
 '(cider-repl-display-in-current-window t)
 '(cider-repl-history-file ".cider_history")
 '(cider-repl-pop-to-buffer-on-connect nil)
 '(cider-repl-use-pretty-printing t)
 '(cljr-auto-clean-ns t)
 '(cljr-suppress-middleware-warnings t)
 '(cljr-warn-on-eval nil)
 '(column-number-mode t)
 '(comment-line-break-function (quote indent-new-comment-line) t)
 '(comment-multi-line t)
 '(comment-start "/** " t)
 '(comment-start-skip "/\\*\\*" t)
 '(company-auto-complete t)
 '(company-auto-complete-chars nil)
 '(company-backends
   (quote
    (company-nxml company-css company-capf company-files
                  (company-dabbrev-code company-etags company-keywords)
                  company-semantic company-dabbrev)))
 '(company-idle-delay 0.2)
 '(company-occurrence-weight-function (quote company-occurrence-prefer-closest-above))
 '(company-search-regexp-function (quote company-search-words-regexp))
 '(company-tooltip-flip-when-above nil)
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-process-setup-function nil t)
 '(compilation-scroll-output t)
 '(compilation-skip-to-next-location nil t)
 '(compilation-window-height 12)
 '(compile-auto-highlight t)
 '(create-lockfiles nil)
 '(cua-delete-selection t)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "Latin-2")
 '(cursor-in-non-selected-windows nil)
 '(custom-safe-themes
   (quote
    ("ea4ae3c179b4fd23f50b50062ca0312f7bf0151aa4ba8c10088bba87943d8b93" default)))
 '(default-indicate-buffer-boundaries (Quote left) t)
 '(default-input-method "latin-2-prefix")
 '(default-justification (quote left))
 '(dired-listing-switches "-alo")
 '(dired-use-ls-dired nil)
 '(epg-debug t)
 '(epg-gpg-program "/usr/local/MacGPG2/bin/gpg2")
 '(epg-gpgsm-program "/usr/local/MacGPG2/bin/gpgsm")
 '(erc-nick "grabarz")
 '(fci-rule-color "#2e2e2e")
 '(feature-cucumber-command "cucumber --format pretty -s {options} {feature}")
 '(feature-use-rvm t)
 '(file-cache-filter-regexps
   (quote
    ("~$" "\\.o$" "\\.exe$" "\\.a$" "\\.elc$" ",v$" "\\.output$" "\\.$" "#$" "\\.class$" "tmp/")))
 '(focus-follows-mouse nil)
 '(font-lock-beginning-of-syntax-function nil t)
 '(font-lock-keywords-case-fold-search nil t)
 '(font-lock-keywords-only nil t)
 '(font-lock-mark-block-function nil t)
 '(font-lock-maximum-decoration t)
 '(gh-api-v3-authenticator (quote gh-oauth-authenticator))
 '(global-ace-isearch-mode t)
 '(global-flycheck-mode nil)
 '(global-font-lock-mode t nil (font-lock))
 '(global-git-gutter+-mode t)
 '(global-visual-line-mode nil)
 '(gnus-asynchronous nil)
 '(gnus-make-format-preserve-properties nil)
 '(gnus-parameter-large-newsgroup-initial 700)
 '(gnus-use-correct-string-widths t)
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "~/.emacs.d/ca-bundle.crt")))
 '(golden-ratio-exclude-buffer-names
   (quote
    ("*helm imenu*" "*helm etags*" "*Ediff Control Panel*" "*Helm Swoop*" "*fzf*")))
 '(golden-ratio-exclude-buffer-regexp (quote ("undo")))
 '(golden-ratio-exclude-modes
   (quote
    ("helm-mode" "gnus-summary-mode" "gnus-group-mode" "gnus-article-mode" minimap-mode TERM)))
 '(helm-boring-buffer-regexp-list
   (quote
    ("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "TAGS" "\\*magit-*" "\\*edn\\*" "\\*nrepl-messages *" "\\*cider-repl *" "\\*cider-error\\*")))
 '(helm-candidate-separator "")
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (ffap-alternate-file)
     (tmm-menubar)
     (cycbuf-switch-to-next-buffer))))
 '(helm-dash-docsets-path "/Users/michal/.docsets")
 '(helm-dictionary-browser-function (quote browse-url-mozilla))
 '(helm-display-header-line nil)
 '(helm-net-prefer-curl t)
 '(helm-truncate-lines t t)
 '(hscroll-step 1)
 '(ibuffer-display-summary nil)
 '(ibuffer-never-show-predicates
   (quote
    (".*indent-buffer" ".*nxhtml-mode.*" ".newsrc*" "*nnimap*" "*gnus trace*" "*fsm-debug*" "*tramp/")) nil (ibuf-ext))
 '(imenu-case-fold-search t t)
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js2-auto-indent-p t)
 '(js2-cleanup-whitespace t)
 '(js2-enter-indents-newline t)
 '(js2-global-externs
   (quote
    ("$" "Ext"
     (\, "describe")
     (\, "it")
     (\, "require"))))
 '(js2-include-browser-externs t)
 '(js2-include-node-externs t)
 '(js2-mirror-mode nil)
 '(js2-missing-semi-one-line-override t)
 '(lazy-lock-defer-time 0.1)
 '(ls-lisp-dirs-first t)
 '(ls-lisp-ignore-case t)
 '(ls-lisp-use-insert-directory-program nil)
 '(magit-commit-show-diff nil)
 '(magit-diff-auto-show (quote (stage-all log-oneline log-select blame-follow)))
 '(magit-process-connection-type nil)
 '(magit-wip-after-save-mode t)
 '(makefile-electric-keys t)
 '(menu-bar-mode nil)
 '(minibuffer-max-depth nil)
 '(mouse-drag-copy-region nil)
 '(mouse-yank-at-point nil)
 '(normal-erase-is-backspace t)
 '(org-agenda-current-time-string #("<- [ NOW ]" 0 2 (org-heading t)))
 '(org-agenda-tags-column -80)
 '(org-email-link-description-format "Email %c: %s")
 '(org-tags-column -90)
 '(package-selected-packages
   (quote
    (magithub helm-ag helpful helm-open-github dired-collapse zerodark-theme helm geben-helm-projectile cljr-helm clj-refactor restclient-helm restclient smartparens darktooth-theme spaceline helm-git-grep elscreen ws-butler hl-todo webpaste csv-mode pomidor highlight-indent-guides web-mode yaml-mode emmet-mode helm-emmet helm-css-scss origami expand-region zop-to-char window-numbering w3m volatile-highlights vkill vdiff undo-tree toggle-quotes smex smartrep smart-mode-line slime-company shorten shell-pop scss-mode sass-mode rvm rainbow-mode rainbow-delimiters paxedit ov operate-on-number markdown-mode magit-gitflow less-css-mode lcs key-chord json-mode js2-mode ivy imenu-anywhere highlight-symbol highlight-indentation helm-projectile-all helm-projectile helm-hunks helm-git-files helm-dictionary helm-dash helm-clojuredocs helm-cider-history helm-cider helm-chrome helm-c-moccur helm-bm helm-bind-key guru-mode golden-ratio god-mode gitignore-mode github-search gitconfig-mode git-timemachine git-gutter-fringe+ git-blame gist flycheck flx-ido exec-path-from-shell dockerfile-mode discover-my-major diminish diff-hl dash-at-point crux company-web color-theme browse-kill-ring browse-at-remote beacon atom-one-dark-theme ag ace-window ace-jump-mode ace-jump-buffer)))
 '(paren-dont-touch-blink t)
 '(popcmp-completion-style (quote anything))
 '(popcmp-group-alternatives nil)
 '(popcmp-short-help-beside-alts t)
 '(powerline-default-separator (quote butt))
 '(projectile-enable-idle-timer t)
 '(projectile-globally-ignored-file-suffixes (quote ("groovy" "java" "gz" "png")))
 '(projectile-globally-ignored-files (quote ("TAGS")))
 '(projectile-indexing-method (quote alien))
 '(rebind-keys-mode nil)
 '(recentf-exclude
   (quote
    ("/\\(\\(\\(COMMIT\\|NOTES\\|PULLREQ\\|TAG\\)_EDIT\\|MERGE_\\|\\)MSG\\|BRANCH_DESCRIPTION\\)\\'" prelude-recentf-exclude-p ".*TAGS")))
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((eval when
           (require
            (quote projectile))
           (setq cider-repl-history-file
                 (concat
                  (projectile-project-root)
                  ".nrepl-history"))))))
 '(same-window-regexps (quote ("\\*magit.*")))
 '(scss-compile-at-save nil t)
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-t")
 '(show-smartparens-global-mode t)
 '(size-indication-mode t)
 '(smiley-style (quote medium))
 '(sp-autoescape-string-quote nil)
 '(sp-base-key-bindings (quote sp))
 '(sp-navigate-close-if-unbalanced nil)
 '(sp-override-key-bindings
   (quote
    (("M-<right>" . sp-forward-sexp)
     ("M-<left>" . sp-backward-sexp)
     ("M-<up>" . sp-backward-up-sexp)
     ("M-<down>" . sp-down-sexp)
     ("M-r" . cider-switch-repl)
     ("M-s" . projectile-find-file)
     ("M-x" . kill-region)
     ("C-|" . paxedit-sexp-raise)
     ("M-C-<backspace>" . paxedit-delete)
     ("M-C-<down>" . paxedit-transpose-forward)
     ("M-C-<up>" . paxedit-transpose-backward)
     ("C-<right>" . sp-next-sexp)
     ("C-<left>" . sp-previous-sexp))))
 '(speedbar-tag-group-name-minimum-length 2)
 '(speedbar-use-images nil)
 '(speedbar-use-imenu-flag t)
 '(swbuff-clear-delay 0.5)
 '(tab-width 4)
 '(tabkey2-choose-next-on-error nil)
 '(tabkey2-mode nil)
 '(tags-add-tables nil)
 '(tool-bar-mode nil)
 '(undo-tree-auto-save-history nil)
 '(undo-tree-visualizer-timestamps t)
 '(visible-bell nil)
 '(web-mode-auto-close-style 2)
 '(web-mode-code-indent-offset 4)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-script-padding 0)
 '(ws-butler-global-mode t)
 '(yas-prompt-functions
   (quote
    (yas-completing-prompt yas-ido-prompt yas-no-prompt)))
 '(yas-wrap-around-region t)
 '(zencoding-preview-default nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Input Mono Condensed" :foundry "nil" :slant normal :weight normal :height 130 :width condensed))))
 '(auto-dim-other-buffers-face ((t (:background "#21252c"))))
 '(comint-highlight-input ((t (:underline nil :weight bold))))
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt :underline nil))))
 '(company-tooltip-annotation-selection ((t (:foreground "white"))))
 '(gnus-summary-low-read ((t (:foreground "DimGrey" :strike-through t)))))
