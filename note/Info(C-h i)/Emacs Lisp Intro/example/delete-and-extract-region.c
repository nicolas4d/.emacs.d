DEFUN ("delete-and-extract-region", Fdelete_and_extract_region,
       Sdelete_and_extract_region, 2, 2, 0,
       doc: /* Delete the text between START and END and return it.  */)
  (Lisp_Object start, Lisp_Object end)
{
  validate_region (&start, &end);
  if (XINT (start) == XINT (end))
    return empty_unibyte_string;
  return del_range_1 (XINT (start), XINT (end), 1, 1);
}
