(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-save-query nil)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Skim" "open %o"))))
 '(TeX-view-program-selection
   (quote
	((output-pdf "Skim")
	 (output-dvi "xdvi")
	 (output-pdf "Evince")
	 (output-html "xdg-open"))))
 '(ac-delay 0.3)
 '(ac-ignore-case nil)
 '(ac-show-menu-immediately-on-auto-complete nil)
 '(ac-stop-words (quote ("/" ";")))
 '(ack-and-a-half-executable "/usr/local/bin/ack")
 '(ack-and-a-half-mode-extension-alist
   (quote
	((js2-mode "js" "json" "rb")
	 (js-mode "js" "json" "rb"))))
 '(ack-executable "/usr/local/bin/ack")
 '(ansi-color-names-vector
   ["#3C3836" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#8EC07C" "#EBDBB2"])
 '(appmenu-mode nil)
 '(auth-sources (quote ("~/.authinfo" "~/.authinfo.gpg")))
 '(bell-volume 0)
 '(block-comment-end nil t)
 '(bm-buffer-persistence t)
 '(bm-electric-show t)
 '(bm-recenter t)
 '(bmkp-auto-light-when-set (quote autonamed-bookmark))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-basic-offset 4)
 '(c-comment-continuation-stars "* ")
 '(c-comment-only-line-offset 0)
 '(canlock-password "1085e8558dcb0236dbd9c1926f175176486526c1")
 '(case-fold-search t)
 '(cider-default-repl-command "boot")
 '(cider-repl-display-in-current-window t)
 '(cider-repl-history-file nil)
 '(cider-repl-pop-to-buffer-on-connect nil)
 '(cider-repl-use-pretty-printing t)
 '(cljr-suppress-middleware-warnings t)
 '(column-number-mode t)
 '(comment-line-break-function (quote indent-new-comment-line) t)
 '(comment-multi-line t)
 '(comment-start "/** " t)
 '(comment-start-skip "/\\*\\*" t)
 '(company-auto-complete t)
 '(company-auto-complete-chars (quote (41 46)))
 '(company-idle-delay 0.4)
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
	("3fd36152f5be7e701856c3d817356f78a4b1f4aefbbe8bbdd1ecbfa557b50006" "8cf56691a70156f611ac86d0bbcbc7dee7673df195de5918f34bfdc6814ffd39" "3164a65923ef23e0f3dff9f9607b4da1e07ef1c3888d0f6878feef6c28357732" "4530ef4d9cf54740fffb6ce25b393122158057d213a2b812f04930fcadf89d62" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "f9e975bdf5843982f4860b39b2409d7fa66afab3deb2616c41a403d788749628" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" "e292ec749f785d348969926448e25790356a7ce1a8fda6e695f5e8b70bed786b" "a5beb9b1d6dc23dd8a3c204c159c9a5f1e0115ff14b5b8579d6f3ede4f3b3aee" "6c9ddb5e2ac58afb32358def7c68b6211f30dec8a92e44d2b9552141f76891b3" "0795e2c85394140788d72d34969be4acb305e4a54149e7237787d9df27832fbb" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "eea517c5cc867585ba1318d5bb9357b8a5b586e9220f32f35b15124b06d36029" "c63bee436bd8a67f6d9cd96acd5720c4a949c169f09c6850c439751f14fd923e" "1af9aa2eaaaf6cfa7d3b3d0c6d653a9e05b28f11681fbf4efb75812f4a2a310a" "89586444c668bae9ec7e594bc38b3a956f31dc6cb7c851ed40411cc4ff770708" "3103287c8d39800d6b41f8664b223f8ecdd8c6cc0b073441e174b61afdb4ce02" "c87cc60d01cf755375759d165c1d60d9586c6a31f0b5437a0378c2a93cfc8407" "70cf411fbf9512a4da81aa1e87b064d3a3f0a47b19d7a4850578c8d64cac2353" "1cd9defef2a98138c732728568b04043afd321eb802d25a254777de9b2463768" "96efbabfb6516f7375cdf85e7781fe7b7249b6e8114676d65337a1ffe78b78d9" "a655f17225ad0a7190c79602593563191b7640ddebbb8c8fbd80c9d82faff1c6" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "b458d10c9ea0c8c465635b7b13e1bd23f04e6b696b1ca96cb2c4eca35a31641e" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "56cb99174fad69feba8edd6663c592e77d77332fb4c4bb5be058ef459a426463" "c3e567dedaa800e869d879c4df8478237d6ea31fd04464086fd674c864fe4d71" "18e89f93cbaaac214202142d910582354d36639f21f32b04718ca6425dbc82a2" "96b023d1a6e796bab61b472f4379656bcac67b3af4e565d9fb1b6b7989356610" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "3d003561784526d83d1dd187aecf4799c72af27046bc3aa2f6d95c64e5ee4746" "d809ca3cef02087b48f3f94279b86feca896f544ae4a82b523fba823206b6040" "2affb26fb9a1b9325f05f4233d08ccbba7ec6e0c99c64681895219f964aac7af" "fa942713c74b5ad27893e72ed8dccf791c9d39e5e7336e52d76e7125bfa51d4c" "456ac8176c7c01680384356cbdc568a7683d1bada9c83ae3d7294809ddda4014" "569dc84822fc0ac6025f50df56eeee0843bffdeceff2c1f1d3b87d4f7d9fa661" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" "2a12e95e9ee6ed57592e7df12f3f028205575e9b3affdb5e6fa589421c618136" "72407995e2f9932fda3347e44e8c3f29879c5ed88da71f06ba4887b0596959a4" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" default)))
 '(cycbuf-attributes-list
   (quote
	(("M" 1 left cycbuf-get-modified-string)
	 ("R" 2 left cycbuf-get-readonly-string)
	 ("Mode" 12 left cycbuf-get-mode-name)
	 ("" 2 left "  ")
	 ("" 1 left " ")
	 ("Buffer" cycbuf-get-name-length left cycbuf-get-name)
	 ("" 2 left "  "))))
 '(cycbuf-buffer-sort-function (quote cycbuf-sort-by-recency))
 '(cycbuf-clear-delay 1.2)
 '(cycbuf-dont-show-regexp (quote ("^ " "^\\*cycbuf\\*$" "^\\*")))
 '(cycbuf-max-window-height 4)
 '(default-frame-alist
	(quote
	 ((top . 50)
	  (left . 50)
	  (width . 100)
	  (height . 40))))
 '(default-indicate-buffer-boundaries (quote left) t)
 '(default-input-method "latin-2-prefix")
 '(default-justification (quote left))
 '(desktop-base-file-name ".emacs.desktop")
 '(desktop-buffers-not-to-save "")
 '(desktop-file-name-format (quote absolute))
 '(desktop-files-not-to-save "^$")
 '(desktop-path (quote ("." "~/.emacs.d/" "~" "~/.notes")))
 '(desktop-save nil)
 '(desktop-save-mode nil)
 '(dired-listing-switches "-alo")
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
 '(gh-api-v3-authenticator (quote gh-password-authenticator))
 '(global-ace-isearch-mode t)
 '(global-flycheck-mode nil nil (flycheck))
 '(global-font-lock-mode t nil (font-lock))
 '(global-visual-line-mode nil)
 '(gnus-asynchronous nil)
 '(gnus-make-format-preserve-properties nil)
 '(gnus-parameter-large-newsgroup-initial 700)
 '(gnus-use-correct-string-widths t)
 '(golden-ratio-exclude-buffer-names
   (quote
	("*helm imenu*" "*helm etags*" "*Ediff Control Panel*" "*undo-tree*" "*Helm Swoop*")))
 '(golden-ratio-exclude-modes
   (quote
	("helm-mode" "gnus-summary-mode" "gnus-group-mode" "gnus-article-mode")))
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
 '(helm-display-header-line nil)
 '(helm-swoop-split-direction (quote split-window-horizontally))
 '(helm-truncate-lines t t)
 '(history-mode t)
 '(history-window-local-history t)
 '(hscroll-step 1)
 '(ibuffer-display-summary nil)
 '(ibuffer-never-show-predicates
   (quote
	(".*indent-buffer" ".*nxhtml-mode.*" ".newsrc*" "*nnimap*" "*gnus trace*" "*fsm-debug*" "*tramp/")) nil (ibuf-ext))
 '(imenu-case-fold-search t t)
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(indent-tabs-mode t)
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
 '(lazy-lock-defer-time 0.1)
 '(ls-lisp-dirs-first t)
 '(ls-lisp-ignore-case t)
 '(ls-lisp-use-insert-directory-program nil)
 '(magit-diff-auto-show (quote (stage-all log-oneline log-select blame-follow)))
 '(magit-process-connection-type nil)
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
 '(paren-dont-touch-blink t)
 '(popcmp-completion-style (quote anything))
 '(popcmp-group-alternatives nil)
 '(popcmp-short-help-beside-alts t)
 '(prelude-theme (quote wombat))
 '(projectile-enable-idle-timer t)
 '(projectile-indexing-method (quote alien))
 '(rebind-keys-mode nil)
 '(ring-bell-function (quote ignore) t)
 '(same-window-regexps (quote ("\\*magit.*")))
 '(scss-compile-at-save nil t)
 '(show-smartparens-global-mode t)
 '(size-indication-mode t)
 '(smartparens-global-strict-mode t)
 '(sp-autoescape-string-quote nil)
 '(sp-base-key-bindings (quote sp))
 '(sp-navigate-close-if-unbalanced t)
 '(speedbar-tag-group-name-minimum-length 2)
 '(speedbar-use-images nil)
 '(speedbar-use-imenu-flag t)
 '(swbuff-clear-delay 0.5)
 '(tab-width 4)
 '(tabkey2-choose-next-on-error nil)
 '(tabkey2-mode nil)
 '(tool-bar-mode nil)
 '(undo-tree-auto-save-history nil)
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
	((20 . "#dd5542")
	 (40 . "#CC5542")
	 (60 . "#fb8512")
	 (80 . "#baba36")
	 (100 . "#bdbc61")
	 (120 . "#7d7c61")
	 (140 . "#6abd50")
	 (160 . "#6aaf50")
	 (180 . "#6aa350")
	 (200 . "#6a9550")
	 (220 . "#6a8550")
	 (240 . "#6a7550")
	 (260 . "#9b55c3")
	 (280 . "#6CA0A3")
	 (300 . "#528fd1")
	 (320 . "#5180b3")
	 (340 . "#6380b3")
	 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visible-bell nil)
 '(web-mode-auto-close-style 2)
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
 '(default ((t (:family "DejaVu Sans Mono" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(bmkp-desktop ((t (:foreground "orange" :background "#2d2d2d"))))
 '(comint-highlight-input ((t (:underline nil :weight bold))))
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt :underline nil))))
 '(compilation-column-number ((t (:inherit font-lock-doc-face :underline nil))))
 '(compilation-error ((t (:inherit error :underline nil :slant italic))))
 '(compilation-warning ((t (:inherit warning :underline nil))))
 '(cperl-array-face ((t (:background "gray30" :foreground "orange"))))
 '(cperl-hash-face ((t (:background "gray30" :foreground "yellow3"))))
 '(cycbuf-current-face ((t (:background "gray" :foreground "black" :weight bold))))
 '(diff-hunk-header ((t (:background "#111"))))
 '(diff-indicator-added ((t (:foreground "DarkGreen"))))
 '(diff-indicator-removed ((t (:foreground "DarkRed"))))
 '(dired-marked ((t (:foreground "Yellow"))))
 '(diredp-file-name ((t (:foreground "#eee"))) t)
 '(diredp-file-suffix ((t (:foreground "#ddd"))) t)
 '(diredp-number ((t (:foreground "#eee"))) t)
 '(diredp-read-priv ((t nil)) t)
 '(diredp-write-priv ((t nil)) t)
 '(face-1 ((t (:foreground "grey30"))))
 '(face-2 ((t (:foreground "white" :weight bold :font "Ubuntu Mono" :height 140))))
 '(face-3 ((t (:weight normal))))
 '(face-4 ((t (:foreground "orange" :font "Ubuntu Mono" :height 140))))
 '(face-5 ((t (:foreground "grey40"))))
 '(face-6 ((t (:foreground "red"))))
 '(gnus-group-news-1 ((t (:foreground "gray90"))))
 '(gnus-group-news-2 ((t (:foreground "gray70"))))
 '(gnus-group-news-3 ((t (:foreground "gray70"))))
 '(gnus-group-news-3-empty ((t (:foreground "gray50"))))
 '(gnus-signature ((t (:foreground "#777"))))
 '(gnus-summary-cancelled ((t (:foreground "purple" :background "#2d2d2d" :weight normal))))
 '(gnus-summary-high-ancient ((t (:foreground "LightSalmon" :weight bold))))
 '(gnus-summary-high-read ((t (:foreground "LightBlue" :weight normal))))
 '(gnus-summary-high-unread ((t (:foreground "cyan" :weight normal))))
 '(gnus-summary-normal-ancient ((t (:foreground "LightGreen"))))
 '(gnus-summary-normal-read ((t (:foreground "Green"))))
 '(gnus-summary-normal-ticked ((t (:foreground "pink" :weight normal))))
 '(gnus-summary-normal-unread ((t (:foreground "LightGreen"))))
 '(helm-candidate-number ((t (:foreground "#888" :underline nil :weight normal))))
 '(helm-ff-directory ((t (:foreground "LightSalmon" :underline nil :weight bold))))
 '(helm-ff-file ((t (:foreground "CadetBlue" :underline nil :weight normal))))
 '(helm-ff-prefix ((t (:foreground "#888" :background "#333"))))
 '(helm-selection ((t (:background "#333" :foreground "#aaa"))))
 '(helm-source-header ((t (:background "#1d1d1d" :foreground "#888" :underline t :weight normal))))
 '(highline-face ((t (:background "#666"))) t)
 '(magit-blame-culprit ((t (:foreground "LightGoldenrod2" :background "#333" :box (:line-width -1 :style released-button)))) t)
 '(magit-blame-header ((t (:background "#333" :box (:line-width -1 :style released-button)))) t)
 '(magit-blame-sha1 ((t (:foreground "cyan" :background "#333" :box (:line-width -1 :style released-button)))) t)
 '(magit-blame-subject ((t (:foreground "DarkGoldenrod2" :background "#333" :box (:line-width -1 :style released-button)))) t)
 '(magit-blame-time ((t (:foreground "DarkGoldenrod" :background "#333" :box (:line-width -1 :style released-button)))) t)
 '(magit-diff-add ((t (:foreground "green"))))
 '(magit-diff-del ((t (:foreground "red"))))
 '(magit-diff-hunk-header ((t (:background "#333" :foreground "cyan"))))
 '(org-document-info ((t (:height 0.9 :family "Tahoma" :weight bold))))
 '(org-document-title ((t (:height 0.9 :family "Tahoma" :weight bold))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(twittering-uri-face ((t (:foreground "gray70" :underline nil))) t)
 '(twittering-username-face ((t (:foreground "LightSalmon" :underline nil :weight bold))) t))
