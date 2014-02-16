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

#ifndef __stri_macros_h
#define __stri_macros_h



// undef R's length macro (conflicts with std::string.length())
// use LENGTH instead
#undef length


#define STRI__CONTINUE_ON_EMPTY_OR_NA_STR_PATTERN(str_cont, pattern_cont, naset, zeroset)        \
      if ((str_cont).isNA(i) || (pattern_cont).isNA(i) || (pattern_cont).get(i).length() <= 0) { \
         if (!(pattern_cont).isNA(i) && (pattern_cont).get(i).length() <= 0)                     \
            Rf_warning(MSG__EMPTY_SEARCH_PATTERN_UNSUPPORTED);                                   \
         naset;                                                                                  \
         continue;                                                                               \
      }                                                                                          \
      else if ((str_cont).get(i).length() <= 0) {                                                \
         zeroset;                                                                                \
         continue;                                                                               \
      }                                                                                          \


#define STRI__GET_INT32_BE(input, index) \
   uint32_t(((uint8_t*)input)[index+0] << 24 | ((uint8_t*)input)[index+1] << 16 | ((uint8_t*)input)[index+2] << 8 | ((uint8_t*)input)[index+3])

#define STRI__GET_INT32_LE(input, index) \
   uint32_t(((uint8_t*)input)[index+3] << 24 | ((uint8_t*)input)[index+2] << 16 | ((uint8_t*)input)[index+1] << 8 | ((uint8_t*)input)[index+0])

#define STRI__GET_INT16_BE(input, index) \
   uint16_t(((uint8_t*)input)[index+0] << 8 | ((uint8_t*)input)[index+1])

#define STRI__GET_INT16_LE(input, index) \
   uint16_t(((uint8_t*)input)[index+1] << 8 | ((uint8_t*)input)[index+0])


#define STRI__ENC_HAS_BOM_UTF8(s, n)   \
   bool(n >= 3 &&                      \
   (uint8_t)(s[0]) == (uint8_t)0xEF && \
   (uint8_t)(s[1]) == (uint8_t)0xBB && \
   (uint8_t)(s[2]) == (uint8_t)0xBF)


#define STRI__ENC_HAS_BOM_UTF16LE(s, n)           \
   bool(n >= 2 &&                                 \
   (uint8_t)(s[0]) == (uint8_t)0xFF &&            \
   (uint8_t)(s[1]) == (uint8_t)0xFE &&            \
   (n < 4 || ((uint8_t)(s[2]) != (uint8_t)0x00 || \
              (uint8_t)(s[3]) != (uint8_t)0x00)))


#define STRI__ENC_HAS_BOM_UTF16BE(s, n) \
   bool(n >= 2 &&                       \
   (uint8_t)(s[0]) == (uint8_t)0xFE &&  \
   (uint8_t)(s[1]) == (uint8_t)0xFF)


#define STRI__ENC_HAS_BOM_UTF32BE(s, n) \
   bool(n >= 4 &&                       \
   (STRI__GET_INT32_BE(str_cur_s, 0) == 0x0000FEFFUL))


#define STRI__ENC_HAS_BOM_UTF32LE(s, n) \
   bool(n >= 4 &&                       \
   (STRI__GET_INT32_LE(str_cur_s, 0) == 0x0000FEFFUL))


// taken from R's Defn.h - sorry, this is needed
// CHARSXP charset bits
#define BYTES_MASK (1<<1)
#define LATIN1_MASK (1<<2)
#define UTF8_MASK (1<<3)
#define ASCII_MASK (1<<6)
#define IS_BYTES(x) ((x)->sxpinfo.gp & BYTES_MASK)
#define IS_LATIN1(x) ((x)->sxpinfo.gp & LATIN1_MASK)
#define IS_ASCII(x) ((x)->sxpinfo.gp & ASCII_MASK)
#define IS_UTF8(x) ((x)->sxpinfo.gp & UTF8_MASK)
#define ENC_KNOWN(x) ((x)->sxpinfo.gp & (LATIN1_MASK | UTF8_MASK | ASCII_MASK))

#define isRaw(x) (TYPEOF(x) == RAWSXP)

/**
 * ...
 */
enum StriEnc {
   STRI_ENC_UNDEFINED=0,
   STRI_ENC_ASCII,
   STRI_ENC_LATIN1,
   STRI_ENC_UTF8,
   STRI_ENC_NATIVE,
   STRI_ENC_BYTES,
   STRI_NA
};


/**
 * ...
 */
enum StriNormalizationForm {
   STRI_NFC = 10,
   STRI_NFD = 20,
   STRI_NFKC = 11,
   STRI_NFKD = 21,
   STRI_NFKC_CASEFOLD = 12
};



/// Unicode replacement character
#define UCHAR_REPLACEMENT 0xFFFD
#define ASCII_SUBSTITUTE  0x1A
#define ASCII_MAXCHARCODE 127
#define UCHAR_REPLACEMENT_UTF8_BYTE1 0xef
#define UCHAR_REPLACEMENT_UTF8_BYTE2 0xbf
#define UCHAR_REPLACEMENT_UTF8_BYTE3 0xbd
#define ASCII_CR 0x0D
#define ASCII_LF 0x0A
#define ASCII_FF 0x0C
#define ASCII_VT 0x0B
#define UCHAR_NEL 0x0085
#define UCHAR_LS  0x2028
#define UCHAR_PS  0x2029

#endif
