;;; discovery.el --- a discovery service package

;; Author: Krzysztof Kowalski
;; Keywords: discovery
;; Version: 1.0.0

;;; Commentary:

;; Emacs integration for discovery service.

;;; Code:

(defun read-response-body (buffer)
  (let ((current (buffer-name)))
    (set-buffer buffer)
    (goto-char (point-max))
    (search-backward-regexp "\n\n")
    (let ((body (buffer-substring (point) (point-max))))
      (set-buffer current)
      body)))

(defun read-response-json (buffer)
  (let* ((body (read-response-body buffer))
         (json-object-type 'plist)
         (json (json-read-from-string body)))
    json))

(defun get-json (url)
  (let* ((response-buffer (url-retrieve-synchronously url)))
    (read-response-json response-buffer)))

(defun read-service-uris (instances-json)
  (mapcar (lambda (instance) (plist-get instance :serviceUri)) (plist-get instances-json :links)))

(defun read-service-uri (instances-json &optional prompt)
  (let ((service-uris (read-service-uris instances-json)))
    (if prompt
        (completing-read
         "Enter service uri: "
         (mapcar (lambda (uri) (list uri uri)) service-uris)
         nil t)
      (car service-uris))))

(defun read-service-names (services-json)
  (mapcar (lambda (service) (plist-get service :name)) (plist-get services-json :services)))

(defun discovery-service-url (environment)
  (cond ((equal environment "dev") "http://discovery-dev.qxlint") ((equal environment "test") "http://discovery-test.qxlint") ((equal environment "prod") "http://discovery.qxlint") (t nil)))

(defun instances-url (environment service-name)
  (let* ((discovery-service-url (discovery-service-url environment)))
    (concat discovery-service-url "/services/" service-name "/instances")))

(defun read-service-uri-from-discovery (environment service-name &optional prompt)
  (let ((json (get-json (instances-url environment service-name))))
    (read-service-uri json prompt)))

(defun read-environment ()
  (completing-read
   "Enter environemnt: "
   '(("dev" 1) ("test" 2) ("prod" 3))
   nil t nil nil "test"))

(defun read-service-name (environment)
  (let* ((discovery-service-url (discovery-service-url environment))
         (url (concat discovery-service-url "/services"))
         (json (get-json url))
         (services (sort (read-service-names json) 'string<))
         (prompt (mapcar (lambda (service-name) (list service-name service-name)) services)))
    (completing-read
     "Enter service name: "
     prompt
     nil t)))

;;;###autoload
(defun discover-service-uri (&optional environment service-name random-value)
  "Discovers service uri in discovery service."
  (interactive)
  (let* ((environment (or environment (read-environment)))
         (service-name (or service-name (read-service-name environment)))
         (prompt (if random-value nil t))
         (service-uri (read-service-uri-from-discovery environment service-name prompt)))
    (message service-uri)
    service-uri))

;;;###autoload
(defun discover-service-uri-kill-ring (&optional environment service-name random-value)
  "Discovers service uri in discovery service and make new kill ring element."
  (interactive)
  (let* ((environment (or environment (read-environment)))
         (service-name (or service-name (read-service-name environment)))
         (prompt (if random-value nil t))
         (service-uri (read-service-uri-from-discovery environment service-name prompt)))
    (message service-uri)
    (kill-new service-uri)
    service-uri))

;;; discovery.el ends here
