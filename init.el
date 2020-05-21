(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'org)

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c b" . org-iswitchb)
   ("C-c c" . org-capture))
  :bind
  (:map org-mode-map
        ("M-n" . outline-next-visible-heading)
        ("M-p" . outline-previous-visible-heading))
  :custom
  (org-src-window-setup 'current-window)
  (org-return-follows-link t)
  (org-use-speed-commands t)
  (org-catch-invisible-edits 'show)
  (org-preview-latex-image-directory "/tmp/ltximg/")
  :custom-face
  (variable-pitch ((t (:family "Libre Baskerville"))))
  (org-document-title ((t (:weight bold :height 1.5))))
  (org-done ((t (:strike-through t :weight bold))))
  (org-headline-done ((t (:strike-through t))))
  (org-level-1 ((t (:height 1.3 :weight bold))))
  (org-level-2 ((t (:height 1.2 :weight bold))))
  (org-level-3 ((t (:height 1.1 :weight bold))))
  (org-image-actual-width (/ (display-pixel-width) 2)))


(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.org\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package org-roam
      :load-path "~/.emacs.d/elisp/"
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "/home/sarai/github-projects/second-brain/brain")
      :custom-face
      (org-roam-link ((t (:inherit org-link :foreground "#C991E1"))))
      :straight (:host github :repo "jethrokuan/org-roam" :branch "master")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph)
               ("C-c n i" . org-roam-insert))))

(setq org-roam-filename-noconfirm nil)

(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "/home/sarai/github-projects/second-brain/brain"))

(use-package org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  :custom
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-file-format "private%Y-%m-%d.org")
  (org-journal-dir "/home/sarai/github-projects/second-brain/brain")
  (org-journal-date-format "%B %d, %Y")
  :init (setq org-log-done 'time))

(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

(use-package mathpix.el
  :straight (:host github :repo "jethrokuan/mathpix.el")
  :custom ((mathpix-app-id "app-id")
           (mathpix-app-key "app-key"))
  :bind
  ("C-x m" . mathpix-screenshot))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(deft-default-extension "org" t)
 '(deft-directory "/home/sarai/github-projects/second-brain/brain")
 '(deft-recursive t)
 '(deft-use-filter-string-for-filename t)
 '(mathpix-app-id "app-id" t)
 '(mathpix-app-key "app-key" t)
 '(org-catch-invisible-edits (quote show))
 '(org-journal-date-format "%B %d, %Y")
 '(org-journal-date-prefix "#+TITLE: ")
 '(org-journal-dir "/home/sarai/github-projects/second-brain/brain")
 '(org-journal-file-format "private%Y-%m-%d.org")
 '(org-preview-latex-image-directory "/tmp/ltximg/")
 '(org-return-follows-link t)
 '(org-roam-directory "/home/sarai/github-projects/second-brain/brain")
 '(org-src-window-setup (quote current-window))
 '(org-use-speed-commands t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:weight bold :height 1.5))))
 '(org-done ((t (:strike-through t :weight bold))))
 '(org-headline-done ((t (:strike-through t))))
 '(org-image-actual-width (/ (display-pixel-width) 2))
 '(org-level-1 ((t (:height 1.3 :weight bold))))
 '(org-level-2 ((t (:height 1.2 :weight bold))))
 '(org-level-3 ((t (:height 1.1 :weight bold))))
 '(org-roam-link ((t (:inherit org-link :foreground "#C991E1"))))
 '(variable-pitch ((t (:family "Libre Baskerville")))))
