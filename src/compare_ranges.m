%***********************************************************************
%							compare_ranges.m
%
% Purpose:			Compares the Rrmax and the Rimax and prints results.
%					By default the result printing is off. If needed
%					uncomment the lines for verbose operation. note that
%					depending on the NUMBMBER_OF_COMPARISSONS found in 
%					main, the verbosity may saturate the user
% Data in:			Rrmax, Rimax, verbose
% Data out:			none
% Data returned:	LPI_won_once, verbose
% **********************************************************************
function LPI_won_once = compare_ranges(Rrmax, Rimax, verbose)
	LPI_won_once = 0;	% Track if LPI won
	if (verbose) fprintf('Rrmax=%e, Rimax=%e, ', Rrmax, Rimax); end
	if (Rrmax > Rimax)
		if (verbose) fprintf('LPI wins by %e m\n', Rrmax - Rimax); end
		LPI_won_once = 1;
	elseif (Rrmax < Rimax)
		if (verbose) 
			fprintf('Interceptor wins by %e m\n', Rimax - Rrmax);
		end
	else
		if (verbose) fprintf('Duce\n'); end
	end	% End if-else
% End compare_ranges.m