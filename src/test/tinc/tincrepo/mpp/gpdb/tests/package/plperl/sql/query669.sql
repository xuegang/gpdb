-- Test: plperl 32
CREATE OR REPLACE FUNCTION
								perl_out_params(f1 out integer, f2 out text, f3 out text) AS $$
								return { f2 => 'hello', f1 => 1, f3 => 'world' };
								$$ LANGUAGE plperl;
							  
SELECT perl_out_params();
							  

