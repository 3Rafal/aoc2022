;; Part 1
(let* ((split-by-calories
        (mapcar
         (lambda (x) (split-string x "\n"))
         (split-string
          (with-temp-buffer
            (insert-file-contents-literally "01.txt")
            (buffer-substring-no-properties (point-min) (point-max))) "\n\n")))
       (sum-calories (lambda (cal-list)
                       (apply '+ (mapcar (lambda (x) (string-to-number x)) cal-list))))
       (sorted (sort
                (mapcar sum-calories split-by-calories)
                '>))
       )
  (car sorted))

;; Part 2
(let* ((split-by-calories
        (mapcar
         (lambda (x) (split-string x "\n"))
         (split-string
          (with-temp-buffer
            (insert-file-contents-literally "01.txt")
            (buffer-substring-no-properties (point-min) (point-max))) "\n\n")))
       (sum-calories (lambda (cal-list)
                       (apply '+ (mapcar (lambda (x) (string-to-number x)) cal-list))))
       (sorted (sort
                (mapcar sum-calories split-by-calories)
                '>))
       )
  (apply '+ (seq-take sorted 3)))



