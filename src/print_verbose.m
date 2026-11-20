%***********************************************************************
%							print_verbose.m
%
% Purpose:			Option for verbose output of the simulation
% Data in:			none
% Data out:			none
% Data returned:	verbose
% **********************************************************************
function verbose = print_verbose()
	fprintf('verbose bit (0 if not sure) = ');
	verbose = input('');
	if (verbose ~= 0 && verbose ~= 1)
		fprintf('\nError! invalid binary input\n');
	end
% End print_verbose.m