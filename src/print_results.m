%***********************************************************************
%							print_results.m
%
% Purpose:			Prints the results of the probabilistic analysis
% Data in:			LPI_wins, NUMBER_OF_COMPARISSONS
% Data out:			none
% Data returned:	none
% **********************************************************************
function print_results(LPI_wins, NUMBER_OF_COMPARISSONS)
	fprintf('\nProbabilistic analysis yields:\n');
	fprintf('------------------------------\n');
	fprintf('The LPI wins %f%%\n', ...
			LPI_wins*100/(NUMBER_OF_COMPARISSONS));
	fprintf('The Interceptor wins %f%%\n\n', ...
			100 - LPI_wins*100/(NUMBER_OF_COMPARISSONS));
% End print_results.m