;; Strike through headlines for DONE
;; http://sachachua.com/blog/2012/12/emacs-strike-through-headlines-for-done-tasks-in-org/
(setq org-fontify-done-headline t)

(setq org-agenda-custom-commands '(("w" occur-tree "workshop"))
      org-capture-templates
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
      org-tag-alist '(("HOME" . ?h) ("MOBI" . ?m))
      org-todo-keywords '((sequence "TODO(t!)" "STARTED(s!)" "|" "DONE(d!/!)")
                          (sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)")
                          (sequence "OPEN(O!)" "|" "CLOSED(C!)"))
      org-log-note-headings '((done . "CLOSING NOTE %t")
                              (state . "State %-12s %t")
                              (note . "Note taken on %t")
                              (reschedule . "Rescheduled from %S on %t")
                              (delschedule . "Not scheduled, was %S on %t")
                              (redeadline . "New deadline from %S on %t")
                              (deldeadline . "Removed deadline, was %S on %t")
                              (refile . "Refiled on %t") (clock-out . ""))
      org-todo-keyword-faces '(("TODO"        :foreground "red"          :weight bold)
                               ("STARTED"     :foreground "green"        :weight bold)
                               ("DONE"        :foreground "forest green" :weight bold)
                               ("WAITING"     :foreground "yellow"       :weight bold)
                               ("SOMEDAY"     :foreground "goldenrod"    :weight bold)
                               ("CANCELLED"   :foreground "orangered"    :weight bold)
                               ("OPEN"        :foreground "magenta"      :weight bold)
                               ("CLOSED"      :foreground "forest green" :weight bold))
      org-todo-state-tags-triggers '(("CANCELLED" ("CANCELLED" . t))
                                     ("WAITING"   ("WAITING" . t))
                                     ("SOMEDAY"   ("WAITING" . t))
                                     (done        ("WAITING"))
                                     ("TODO"      ("WAITING") ("CANCELLED"))
                                     ("STARTED"   ("WAITING"))
                                     ("DONE"      ("WAITING") ("CANCELLED"))))

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
