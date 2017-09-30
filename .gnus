(setq
 user-full-name "Janko Muzykant"
 user-mail-address "umrzyk@gmail.com"

 gnus-select-method '(nntp "europe.newsdemon.com")
 gnus-dribble-directory "~/tmp"
 gnus-always-read-dribble-file t
 gnus-always-save-dribble-file t
 gnus-save-newsrc-file t
 gnus-read-newsrc-file t
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
 gnus-use-sendmail nil
 gnus-signature-limit 500
 gnus-large-newsgroup 2000
 gnus-activate-level 3
 gnus-save-all-headers t
 gnus-check-new-newsgroups nil
 gnus-read-active-file 'ask-server
 gnus-nov-is-evil nil
 gnus-novice-user nil

 ;; scoring
 gnus-use-scoring t
 gnus-global-score-files '("~/News/all.SCORE")
 gnus-score-interactive-default-score 3

 ;; charsets
 gnus-default-charset (quote iso-8859-2)
 gnus-default-posting-charset (quote iso-8859-2)

 ;; Make Gnus NOT ignore [Gmail] mailboxes
 gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"
 gnus-ignored-from-addresses t

 ;; agent configuration
 gnus-agent t
 gnus-agent-enable-expiration t
 gnus-agent-expire-days 30
 gnus-agent-long-article 1000

 gnus-button-url 'browse-url-generic
 gnus-buttonized-mime-types '("multipart/encrypted" "multipart/signed")
 gnus-article-emulate-mime t

 ;; headers setup
 gnus-visible-headers "^From:\\|^To:\\|^Subject:\\|^Newsgroups:\\|^Date:\\|^Organization:\\|^X-Newsreader:\\|^User-Agent:"
 gnus-extra-headers '(To Newsgroups Content-Type)

 ;; define external browser
 browse-url-browser-function 'browse-url-default-macosx-browser

 nnmail-extra-headers '(To X-Label Newsgroups Content-Type)
 nnmail-treat-duplicates 'delete
 nnmail-keep-last-article nil

 ;; signature
 gnus-signature-separator
 '("^-- $"         ; The standard
   "^-- *$"        ; A common mangling
   "^-------*$"    ; Many people just use a looong line of dashes.  Shame!
   "^ *--------*$" ; Double-shame!
   "^________*$"   ; Underscores are also popular
   "^========*$")  ; Pervert!

 ;; ~/Mail folders are annoying
 message-auto-save-directory "~/.archive"
 nndraft-directory "~/.archive"

 ;; mails archiving setup
 gnus-message-archive-group '((if (message-news-p) "sent-news" "sent-mail"))
 gnus-message-archive-method '(nnfolder "archive"
                                        (nnfolder-inhibit-expiry t)
                                        (nnfolder-active-file "~/.archive/active")
                                        (nnfolder-directory "~/.archive"))
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
 w3m-display-inline-image t
 mm-text-html-renderer 'w3m
 mm-inline-text-html-with-images t
 mm-inline-text-html-renderer 'mm-inline-text-html-render-with-w3m
 mm-w3m-safe-url-regexp nil

 ;; Emacs PGG customizaiton
 mm-verify-option 'known
 mm-decrypt-option 'known)

(defvar *mb-mails* "umrzykus@gazeta\\.pl")

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

(when window-system
  (setq
   gnus-sum-thread-tree-root "● "
   gnus-sum-thread-tree-false-root "○ "
   gnus-sum-thread-tree-single-indent ""
   gnus-sum-thread-tree-leaf-with-other "├─▻ "
   gnus-sum-thread-tree-vertical "│ "
   gnus-sum-thread-tree-single-leaf "└─▻ "))

(setq
 gnus-group-line-format   "%5{%M%}%S%3{%5y%} ▪ %(%4{%g%}%) %5{(%R)%}\n"
 gnus-summary-line-format "%1{%U%R%z: %}%2{%d%}%5{ %[%4i%]%}%um%4{%-30,30n%}%1{│%}%1{ %B%}%(%s%)\n"
 gnus-server-line-format  "   {%(%h:%w%)} %s - %n\n"

 gnus-summary-make-false-root 'adopt
 gnus-summary-same-subject ""
 gnus-summary-exit-hook 'gnus-summary-bubble-group)

;; put groups into topics
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; increase score of own articles and follow-ups
(add-hook 'message-sent-hook 'gnus-score-followup-thread) ;;'gnus-score-followup-article

(defconst w3m-meta-content-type-charset-regexp
  "<meta[ \t\n]+http-equiv=\"?Content-type\"?[ \t\n]+\content=\"?\\([^;]+\\);[ \t\n]*charset=\\([^\"]+\\)\"?[ \t\n]*/?>")
(defconst w3m-meta-charset-content-type-regexp
  "<meta[ \t\n]+content=\"?\\([^;]+\\);[ \t\n]*charset\=\\([^\"]+\\)\"?[ \t\n]+http-equiv=\"?Content-type\"?[ \t\n]*/?>")

(defface face-1 '((default (:foreground "grey30"))) "gnus face 1")
(defface face-2 '((default (:foreground "white")))  "gnus face 2")
(defface face-3 '((default (:weight normal)))       "gnus face 3")
(defface face-4 '((default (:foreground "orange"))) "gnus face 4")
(defface face-5 '((default (:foreground "grey40"))) "gnus face 5")
(defface face-6 '((default (:foreground "red")))    "gnus face 6")

;; Keep track of own postings
(defface gnus-own-posting-face nil
  "Use this face to display own postings in Summary Buffer")

(copy-face 'gnus-summary-high-unread-face 'gnus-own-posting-face)
(set-face-foreground 'gnus-own-posting-face "red")

;; (pushnew '((= score 90) . gnus-own-posting-face) gnus-summary-highlight)

(setq gnus-face-1 'face-1
      gnus-face-2 'face-2
      gnus-face-3 'face-3
      gnus-face-4 'face-4
      gnus-face-5 'face-5
      gnus-face-6 'face-6)

(define-key gnus-article-mode-map (kbd "o") 'w3m-view-url-with-browse-url)
