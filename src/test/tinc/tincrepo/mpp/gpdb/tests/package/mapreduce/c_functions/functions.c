#include "postgres.h"
#include "fmgr.h"
#include "funcapi.h"
#include "catalog/pg_type.h"      /* oids of known types */
#include <math.h>
#include <stdlib.h>
#include <stdio.h>

/* Do the module magic dance */
#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif
int tran(PG_FUNCTION_ARGS);
int final(PG_FUNCTION_ARGS);
Datum make_array(PG_FUNCTION_ARGS);
Datum retcomposite(PG_FUNCTION_ARGS);
int cons(PG_FUNCTION_ARGS);
Datum ret_bool(PG_FUNCTION_ARGS);

PG_FUNCTION_INFO_V1(tran);
PG_FUNCTION_INFO_V1(final);
PG_FUNCTION_INFO_V1(retcomposite);
PG_FUNCTION_INFO_V1(cons);
PG_FUNCTION_INFO_V1(make_array);
PG_FUNCTION_INFO_V1(ret_bool);


int tran(PG_FUNCTION_ARGS)
{
    int state = PG_GETARG_INT32(0);
    int arg2 = PG_GETARG_INT32(1);

    if (state > 0)
    {
        arg2 = state + arg2;
    }
    return arg2;
}


int cons(PG_FUNCTION_ARGS)
{
    
    int state = PG_GETARG_INT32(0);
    int arg2 = PG_GETARG_INT32(1);

    return arg2 + state;
}

int final(PG_FUNCTION_ARGS)
{
    int a = PG_GETARG_INT32(0);
    
    PG_RETURN_INT32(a*2);
}

Datum make_array(PG_FUNCTION_ARGS)
{
    PG_RETURN_NULL();
}

Datum ret_bool(PG_FUNCTION_ARGS)
{
    PG_RETURN_BOOL(false);


}



Datum retcomposite(PG_FUNCTION_ARGS)
{
    FuncCallContext     *funcctx;
    int                  call_cntr;
    int                  max_calls;
    TupleDesc            tupdesc;
    AttInMetadata       *attinmeta;

     /* stuff done only on the first call of the function */
     if (SRF_IS_FIRSTCALL())
     {
        MemoryContext   oldcontext;

        /* create a function context for cross-call persistence */
        funcctx = SRF_FIRSTCALL_INIT();

        /* switch to memory context appropriate for multiple function calls */
        oldcontext = MemoryContextSwitchTo(funcctx->multi_call_memory_ctx);

        /* total number of tuples to be returned */
        //funcctx->max_calls = PG_GETARG_UINT32(0);
        funcctx->max_calls = 1;

        /* Build a tuple descriptor for our result type */
        if (get_call_result_type(fcinfo, NULL, &tupdesc) != TYPEFUNC_COMPOSITE)
            ereport(ERROR,
                    (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
                     errmsg("function returning record called in context "
                            "that cannot accept type record")));

        /*
         * generate attribute metadata needed later to produce tuples from raw
         * C strings
         */
        attinmeta = TupleDescGetAttInMetadata(tupdesc);
        funcctx->attinmeta = attinmeta;

        MemoryContextSwitchTo(oldcontext);
    }

    /* stuff done on every call of the function */
    funcctx = SRF_PERCALL_SETUP();

    call_cntr = funcctx->call_cntr;
    //max_calls = funcctx->max_calls;
    max_calls = 1;
    attinmeta = funcctx->attinmeta;
 
    if (call_cntr < max_calls)    /* do when there is more left to send */
    {
        char       **values;
        HeapTuple    tuple;
        Datum        result;

        /*
         * Prepare a values array for building the returned tuple.
         * This should be an array of C strings which will
         * be processed later by the type input functions.
         */
        values = (char **) palloc(3 * sizeof(char *));
        values[0] = (char *) palloc(16 * sizeof(char));
        values[1] = (char *) palloc(16 * sizeof(char));
        values[2] = (char *) palloc(16 * sizeof(char));

        snprintf(values[0], 16, "%d", 1*  PG_GETARG_INT32(0));
        snprintf(values[1], 16, "%d", 2*  PG_GETARG_INT32(0));
        snprintf(values[2], 16, "%d", 3*  PG_GETARG_INT32(0));

        /* build a tuple */
        tuple = BuildTupleFromCStrings(attinmeta, values);

        /* make the tuple into a datum */
        result = HeapTupleGetDatum(tuple);

        SRF_RETURN_NEXT(funcctx, result);
    }
    else    /* do when there is no more left */
    {
        SRF_RETURN_DONE(funcctx);
    }
}

