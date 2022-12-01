(defvar split-by-calories
  (mapcar
   (lambda (x) (split-string x "\n"))
   (split-string
    (with-temp-buffer
      (insert-file-contents-literally "01.txt")
      (buffer-substring-no-properties (point-min) (point-max))) "\n\n")))

(defun sum-calories (cal-list)
  (apply '+ (mapcar (lambda (x) (string-to-number x)) cal-list)))

(defvar sorted (sort
                (mapcar 'sum-calories split-by-calories)
                '>))

(defvar part-1 (car sorted))
(defvar part-2 (apply '+ (seq-take sorted 3)))
