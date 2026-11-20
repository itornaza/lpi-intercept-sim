%***********************************************************************
%						parameters_1_control.m
%
% Purpose:			Gets the input options for the parameters_1
% Data in:			a, b
% Data out:			none
% Data returned:	LPI, interceptor
% **********************************************************************
function [LPI, interceptor] = parameters_1_control(a, b)
	while (a ~= 1 && a ~= 2 && a ~=3)
		fprintf('\nEnter LPI (1-3): ');
		a = input('');
		if (a ~= 1 && a ~= 2 && a ~=3)
			fprintf('\nError! Invalid LPI input\n\n');
		end % End if
	end % End while
	while (b ~= 1 && b ~= 2 && b ~=3)
		fprintf('Enter interceptor (1-3): ');
		b = input('');
		if (b ~= 1 && b ~= 2 && b ~=3)
			fprintf('\nError! Invalid interceptor input\n\n');
		end % End if
	end % End while
	% Return the values
	LPI = a;
	interceptor = b;
% End parameters_1_control