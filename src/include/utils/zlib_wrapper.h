/*-------------------------------------------------------------------------
 *
 * zlib_wrapper.h
 *	 Wrapper functions for zlib to provide better integration with GPDB
 *
 * Greenplum Database
 * Copyright (C) 2016 Pivotal Software, Inc
 *
 *-------------------------------------------------------------------------
 */

#ifndef _UTILS___ZLIB_WRAPPER_H_
#define _UTILS___ZLIB_WRAPPER_H_

#include "zlib.h"

extern int gp_uncompress (Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);
extern unsigned long gp_compressBound(unsigned long sourceLen);
extern int gp_compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level);
extern int gp_compress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);

#endif /* _UTILS___ZLIB_WRAPPER_H_ */
