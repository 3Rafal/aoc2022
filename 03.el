(defvar input
  (split-string
   (with-temp-buffer
     (insert-file-contents-literally "03.txt")
     (buffer-substring-no-properties (point-min) (point-max))) "\n"))

(defun split-by-half (lst)
  (let* ((len (/ (length lst) 2))
         (fst (seq-take lst len))
         (snd (seq-drop lst len)))
    (list fst snd)))

(defun common-element (lsts)
  (car (cl-intersection (string-to-list (car lsts)) (string-to-list (cadr lsts)))))

(defun priority (chr)
  (cond ((equal chr nil) 0)
        ((> chr 96) (- chr 96))
        (t (- chr 38))))


(defvar part-1
  ( apply '+
    (mapcar
     (lambda (x) (priority (common-element (split-by-half x))))
     input)))

(defvar test-input-1
  ( list
    "vJrwpWtwJgWrhcsFMMfFFhFp"
    "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
    "PmmdzqPrVvPwwTWBwg"
    "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn"
    "ttgJtRGJQctTZtZT"
    "CrZsJsPPZsGzwwsLwLmpwMDw"))

(defun common-element-2 (lsts)
  (car (cl-intersection
        (cl-intersection (string-to-list (car lsts)) (string-to-list (cadr lsts)))
        (string-to-list (caddr lsts)))))

(defun group-by-3 (lst)
  (cond (lst (cons (list (car lst) (cadr lst) (caddr lst))
                   (group-by-3 (cdddr lst))))
        (t '())))
  
(defvar test-input-2
  (list
   "vJrwpWtwJgWrhcsFMMfFFhFp"
   "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
   "PmmdzqPrVvPwwTWBwg"))

(defvar part-1
  ( apply '+
    (mapcar
     (lambda (x) (priority (common-element-2 x)))
     (group-by-3 input))))
