/* This file is part of the 'stringi' library.
 *
 * Copyright 2013-2014 Marek Gagolewski, Bartek Tartanus
 *
 * 'stringi' is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * 'stringi' is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with 'stringi'. If not, see <http://www.gnu.org/licenses/>.
 */


#include "stri_stringi.h"




/**
 * Convert case (TitleCase, lowercase, UPPERCASE, etc.)
 *
 *
 *  @param str character vector
 *  @param type internal code of case conversion type
 *  @param locale single string identifying the locale ("" or NULL for default locale)
 *  @return character vector
 *
 *
 * @version 0.1 (Marek Gagolewski)
 * @version 0.2 (Marek Gagolewski) - use StriContainerUTF16
 * @version 0.3 (Marek Gagolewski, 2013-06-16) make StriException-friendly
 * @version 0.4 (Marek Gagolewski, 2013-11-19) use UCaseMap + StriContainerUTF8 **THIS DOES NOT WORK WITH ICU 4.8**
*/
SEXP stri_trans_case(SEXP str, SEXP type, SEXP locale)
{
   str = stri_prepare_arg_string(str, "str"); // prepare string argument
   const char* qloc = stri__prepare_arg_locale(locale, "locale", true);

// version 0.4 - Does not work with ICU 4.8 :(
//   UCaseMap* ucasemap = NULL;
//
//   STRI__ERROR_HANDLER_BEGIN
//
//   if (!Rf_isInteger(type) || LENGTH(type) != 1)
//      throw StriException(MSG__INCORRECT_INTERNAL_ARG); // this is an internal arg, check manually
//   int _type = INTEGER(type)[0];
//   if (_type < 1 || _type > 3)
//      throw StriException(MSG__INTERNAL_ERROR);
//
//   UErrorCode status = U_ZERO_ERROR;
//   ucasemap = ucasemap_open(qloc, U_FOLD_CASE_DEFAULT, &status);
//   if (U_FAILURE(status)) throw StriException(status);
//
//   R_len_t str_n = LENGTH(str);
//   StriContainerUTF8 str_cont(str, str_n);
//   SEXP ret;
//   PROTECT(ret = Rf_allocVector(STRSXP, str_n));
//
//   String8 buf(0); // @TODO: calculate buf len a priori?
//
//   for (R_len_t i = str_cont.vectorize_init();
//         i != str_cont.vectorize_end();
//         i = str_cont.vectorize_next(i))
//   {
//      if (str_cont.isNA(i)) {
//         SET_STRING_ELT(ret, i, NA_STRING);
//         continue;
//      }
//
//      R_len_t str_cur_n     = str_cont.get(i).length();
//      const char* str_cur_s = str_cont.get(i).c_str();
//      status = U_ZERO_ERROR;
//      int buf_need;
//      if (_type == 1)
//         buf_need = ucasemap_utf8ToLower(ucasemap, buf.data(), buf.size(),
//            (const char*)str_cur_s, str_cur_n, &status);
//      else if (_type == 2)
//         buf_need = ucasemap_utf8ToUpper(ucasemap, buf.data(), buf.size(),
//            (const char*)str_cur_s, str_cur_n, &status);
//      else
//         buf_need = ucasemap_utf8ToTitle(ucasemap, buf.data(), buf.size(),
//            (const char*)str_cur_s, str_cur_n, &status);
//
//      if (U_FAILURE(status)) {
//         buf.resize(buf_need+1);
//         status = U_ZERO_ERROR;
//         if (_type == 1)
//            buf_need = ucasemap_utf8ToLower(ucasemap, buf.data(), buf.size(),
//               (const char*)str_cur_s, str_cur_n, &status);
//         else if (_type == 2)
//            buf_need = ucasemap_utf8ToUpper(ucasemap, buf.data(), buf.size(),
//               (const char*)str_cur_s, str_cur_n, &status);
//         else
//            buf_need = ucasemap_utf8ToTitle(ucasemap, buf.data(), buf.size(),
//               (const char*)str_cur_s, str_cur_n, &status);
//      }
//      if (U_FAILURE(status))
//         throw StriException(status);
//
//      SET_STRING_ELT(ret, i, Rf_mkCharLenCE(buf.data(), buf_need, CE_UTF8));
//   }
//
//   if (ucasemap) { ucasemap_close(ucasemap); ucasemap = NULL; }
//   UNPROTECT(1);
//   return ret;
//   STRI__ERROR_HANDLER_END(
//      if (ucasemap) { ucasemap_close(ucasemap); ucasemap = NULL; }
//   )

   // v0.3 - UTF-16 - WORKS WITH ICU 4.8
//    BreakIterator* briter = NULL;

   STRI__ERROR_HANDLER_BEGIN

   if (!Rf_isInteger(type) || LENGTH(type) != 1)
      throw StriException(MSG__INCORRECT_INTERNAL_ARG); // this is an internal arg, check manually
   int _type = INTEGER(type)[0];


   Locale loc = Locale::createFromName(qloc); // this will be freed automatically
   StriContainerUTF16 str_cont(str, LENGTH(str), false); // writable, no recycle

//    if (_type == 6) {
//       UErrorCode status = U_ZERO_ERROR;
//       briter = BreakIterator::createWordInstance(loc, status);
//       if (U_FAILURE(status)) throw StriException(status);
//    }

   for (R_len_t i = str_cont.vectorize_init();
         i != str_cont.vectorize_end();
         i = str_cont.vectorize_next(i))
   {
      if (!str_cont.isNA(i)) {
         switch (_type) {
            case 1:
               str_cont.getWritable(i).toLower(loc);
               break;
            case 2:
               str_cont.getWritable(i).toUpper(loc);
               break;
            case 3:
               str_cont.getWritable(i).toTitle(NULL, loc); // use default ICU's BreakIterator
               break;
            case 4:
               str_cont.getWritable(i).foldCase(U_FOLD_CASE_DEFAULT);
               break;
            case 5:
               str_cont.getWritable(i).foldCase(U_FOLD_CASE_EXCLUDE_SPECIAL_I);
               break;
//             case 6:
//                str_cont.getWritable(i).toTitle(briter, loc); // how to get it working properly with English text???
//                break;
            default:
               throw StriException("stri_trans_case: incorrect case conversion type");
         }
      }
   }

//    if (briter) { delete briter; briter = NULL; }
   SEXP ret;
   PROTECT(ret = str_cont.toR());
   UNPROTECT(1);
   return ret;
   STRI__ERROR_HANDLER_END(/*noop*/;
//       if (briter) delete briter;
   )
}
