;; Thesis env settings

(defvar *thesis-home* "~/repos/Master/Thesis")
(cd *thesis-home*)
(create-project-cmd "thesis" *thesis-home*
                    ("data"
                     "doc"
                     "src"
                     "include"
                     "readtest"
                     "output"
                     "simulation"))

;; (setq tool-bar-mode 1)
(find-file *thesis-home*)

