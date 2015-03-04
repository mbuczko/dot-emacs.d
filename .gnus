(require 'org-contacts)
(require 'starttls)
(require 'nnir)

(setq org-contacts-completion-ignore-case t)
(org-contacts-gnus-insinuate)

(setq
  gnus-save-newsrc-file t
  gnus-read-newsrc-file t
  gnus-always-read-dribble-file t
  gnus-always-save-dribble-file t
  gnus-dribble-directory "~/tmp"
  gnus-inhibit-startup-message t
  gnus-play-startup-jingle nil
  gnus-interactive-exit nil
  gnus-treat-body-boundary nil
  gnus-treat-buttonize t
  gnus-treat-buttonize-head 'head
  gnus-treat-date-original 'head
  gnus-treat-display-smileys t
  gnus-treat-emphasize t
  gnus-treat-fill-long-lines nil
  gnus-treat-from-picon 'head
  gnus-treat-hide-boring-headers 'head
  gnus-treat-highlight-citation t
  gnus-treat-highlight-headers 'head
  gnus-treat-highlight-signature 'last
  gnus-treat-strip-cr t
  gnus-treat-strip-leading-blank-lines t
  gnus-treat-strip-trailing-blank-lines t
  gnus-treat-strip-pem t
  gnus-treat-translate t
  gnus-auto-select-first nil
  gnus-newsgroup-maximum-articles 300

  ;; scoring

  gnus-use-scoring t
  gnus-score-interactive-default-score 3
  gnus-global-score-files '("~/News/all.SCORE")
  gnus-default-charset (quote iso-8859-2)
  gnus-default-posting-charset (quote iso-8859-2)
  gnus-signature-separator
           '("^-- $"         ; The standard
             "^-- *$"        ; A common mangling
             "^-------*$"    ; Many people just use a looong line of dashes.  Shame!
             "^ *--------*$" ; Double-shame!
             "^________*$"   ; Underscores are also popular
             "^========*$")  ; Pervert!

  gnus-ignored-from-addresses t

  ;; Make Gnus NOT ignore [Gmail] mailboxes
  gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"

  gnus-use-sendmail nil
  gnus-signature-limit 500
  gnus-large-newsgroup 2000

  gnus-activate-level 3
  gnus-save-all-headers t
  gnus-check-new-newsgroups nil
  gnus-read-active-file nil ;;'ask-server
  gnus-nov-is-evil nil
  gnus-novice-user nil

  gnus-agent t 
  gnus-agent-enable-expiration t 
  gnus-agent-expire-days 30 
  gnus-agent-long-article 1000

  gnus-button-url 'browse-url-generic
 
  ;; headers setup

  gnus-visible-headers "^From:\\|^To:\\|^Subject:\\|^Newsgroups:\\|^Date:\\|^Organization:\\|^X-Newsreader:\\|^User-Agent:"
  gnus-extra-headers '(To Newsgroups Content-Type)

  nnmail-extra-headers '(To X-Label Newsgroups Content-Type)
  nnmail-treat-duplicates 'delete
  nnmail-keep-last-article nil

  ;;gnus-select-method '(nntp "news.gmane.org")
  gnus-select-method '(nntp "news.newsdemon.com")

  ;; ~/Mail folders are annoying

  message-auto-save-directory "~/.archive"
  nndraft-directory "~/.archive"

  gnus-message-archive-method
      '(nnfolder "archive"
                 (nnfolder-inhibit-expiry t)
                 (nnfolder-active-file "~/.archive/active")
                 (nnfolder-directory "~/.archive"))

  ;; mails archiving setup

  gnus-message-archive-group '((if (message-news-p) "sent-news" "sent-mail"))

  ;; posting styles

  gnus-posting-styles '((".*" (signature "Keep flying and stay shiny"))
                        ("gmane.*" (signature "\"This is so f*cking simple that I can't go wrong\" - most popular testing strategy")))
                        

  ;; articles sorting by date (reverse)
 	
  gnus-thread-sort-functions '(lambda (t1 t2) (not (gnus-thread-sort-by-date t1 t2)))

  message-forward-as-mime t
  message-wash-forwarded-subjects t
  message-send-mail-partially-limit nil
  message-yank-cited-prefix "> "
  message-yank-prefix "> "
  message-signature t

  message-default-headers (concat
   "Content-Type: text/plain; charset=iso-8859-2\n"
   "Content-Transfer-Encoding: 8bit\n")

  ;; use w3m for html rendering
  mm-text-html-renderer 'w3m
  mm-inline-text-html-with-images t
  mm-inline-text-html-renderer 'mm-inline-text-html-render-with-w3m

  w3m-display-inline-image t

  ;; define external browser
  browse-url-browser-function 'browse-url-default-macosx-browser

  ;; Emacs PGG customizaiton
  mm-verify-option 'known
  mm-decrypt-option 'known

  gnus-buttonized-mime-types '("multipart/encrypted" "multipart/signed")
  gnus-article-emulate-mime t)

(when window-system
  (setq 
     gnus-sum-thread-tree-root "● "
     gnus-sum-thread-tree-false-root "▷ " 
     gnus-sum-thread-tree-single-indent ""
     gnus-sum-thread-tree-leaf-with-other "├─► "
     gnus-sum-thread-tree-vertical "│ "
     gnus-sum-thread-tree-single-leaf "└─► "))

(setq 
  gnus-group-line-format   "%5{%M%}%S%3{%5y%} : %(%4{%g%}%) %5{(%R)%}\n"
  gnus-summary-line-format "%1{%U%R%z: %}%2{%d%}%5{ %[%4i%] %}%um %4{%-30,30n%}%1{│%}%1{ %B%}%(%s%)\n"
  gnus-server-line-format  "   {%(%h:%w%)} %s - %n\n"

  gnus-summary-make-false-root 'adopt
  gnus-summary-same-subject ""
  gnus-summary-exit-hook 'gnus-summary-bubble-group)

(defvar *mb-mails*
  "umrzykus@gazeta\\.pl")

(defun gnus-user-format-function-m (headers)
  (let ((to (gnus-extra-header 'To headers)))
	(if (string-match *mb-mails* to)
		(if (string-match "," to) "»" " ")
	  (if (or (string-match *mb-mails*
							(gnus-extra-header 'Cc headers))
			  (string-match *mb-mails*
							(gnus-extra-header 'BCc headers)))
		  "~"
		" "))))


;; put groups into topics
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; increase score of own articles and follow-ups
(add-hook 'message-sent-hook 'gnus-score-followup-thread) ;;'gnus-score-followup-article

;; identities
;; (autoload 'gnus-alias-determine-identity "gnus-alias" "" t)
;; (add-hook 'message-setup-hook 'gnus-alias-determine-identity)

;; (setq
;;  gnus-alias-identity-alist '(("news" "" "Janko Muzykant <umrzykus@gazeta.pl>" "" nil "" ""))
;;  gnus-alias-identity-rules '(("pl.news" ("Newsgroups" "pl.*" current) "news")
;;                              ("gmane" ("Newsgroups" "gmane.*" current) "news"))
;;  gnus-alias-default-identity "news")

(setq user-full-name "Janko Muzykant"
	  user-mail-address "umrzykus@gazeta.pl")


(defconst w3m-meta-content-type-charset-regexp
  "<meta[ \t\n]+http-equiv=\"?Content-type\"?[ \t\n]+\content=\"?\\([^;]+\\);[ \t\n]*charset=\\([^\"]+\\)\"?[ \t\n]*/?>")
(defconst w3m-meta-charset-content-type-regexp
  "<meta[ \t\n]+content=\"?\\([^;]+\\);[ \t\n]*charset\=\\([^\"]+\\)\"?[ \t\n]+http-equiv=\"?Content-type\"?[ \t\n]*/?>")

(defface face-1
  '((default (:foreground "grey30"))) "a gnus face 1")

(defface face-2
  '((default (:foreground "white" :weight bold :font "Ubuntu Mono" :height 130))) "a gnus face 2")

(defface face-3
  '((default (:weight normal))) "a gnus face 3")

(defface face-4
  '((default (:foreground "orange" :font "Ubuntu Mono" :height 130))) "a gnus face 4")

(defface face-5
  '((default (:foreground "grey40"))) "a gnus face 5")

(defface face-6
  '((default (:foreground "red"))) "a gnus face 6")

(setq gnus-face-1 'face-1)
(setq gnus-face-2 'face-2)
(setq gnus-face-3 'face-3)
(setq gnus-face-4 'face-4)
(setq gnus-face-5 'face-5)
(setq gnus-face-6 'face-6)

;; Keep track of own postings

(defface gnus-own-posting-face nil
  "Use this face to display own postings in Summary Buffer")
(copy-face 'gnus-summary-high-unread-face 'gnus-own-posting-face)
(set-face-foreground 'gnus-own-posting-face "red")

(pushnew '((= score 90)
           . gnus-own-posting-face)
         gnus-summary-highlight)

(defadvice gnus-summary-save-parts-1 (around gnus-summary-save-parts-exclude-self activate)
  (let ((handle (ad-get-arg 2)))
    (unless (and (not (stringp (car handle)))
                 (not (mm-handle-filename handle)))
      ad-do-it)))

(define-key gnus-article-mode-map (kbd "C-c C-o")
  (lambda()
    (interactive)
    (w3m-external-view-this-url)))

(gnus-add-configuration
 '(article
   (horizontal 1.0
			   (vertical 0.25 (group 1.0))
			   (vertical 1.0
						 (summary 20)
						 (article 1.0)))))
(gnus-add-configuration
 '(summary
   (horizontal 1.0
			   (group 0.25 point)
			   (summary 1.0))))

(custom-set-faces
 '(gnus-group-news-1 ((t (:foreground "gray90"))))
 '(gnus-group-news-2 ((t (:foreground "gray70"))))
 '(gnus-group-news-3 ((t (:foreground "gray70"))))
 '(gnus-group-news-3-empty ((t (:foreground "gray50"))))
 '(gnus-signature ((t (:foreground "#777"))))
 '(gnus-summary-normal-read ((t (:foreground "Green"))))
 '(gnus-summary-normal-unread ((t (:foreground "LightGreen"))))
 '(gnus-summary-normal-ancient ((t (:foreground "LightGreen"))))
 '(gnus-summary-normal-ticked ((t (:foreground "pink" :weight normal))))
 '(gnus-summary-cancelled ((t (:foreground "purple" :background "#2d2d2d" :weight normal))))
 '(gnus-summary-high-read ((t (:foreground "LightBlue" :weight normal))))
 '(gnus-summary-high-unread ((t (:foreground "cyan" :weight normal))))
 '(gnus-summary-high-ancient ((t (:foreground "LightSalmon" :weight bold)))))
