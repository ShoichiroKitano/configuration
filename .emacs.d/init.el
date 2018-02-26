;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; 行番号を表示
(global-linum-mode t)
(set-face-attribute 'linum nil :foreground "#FF0")
(setq linum-format "%3d  ")
