%***********************************************************************
%							   scan_menu.m
%
% Purpose:			Prints the scanning menu and accepts user selection
%					cariables that are specific to the scanning are
%					assigned values in this function. Input validation
%					is implemented for all the variables
% Data in:			none
% Data out:			none
% Data returned:	selection, HPBW, SLL_reduction
% **********************************************************************
function [selection, HPBW, SLL_reduction] = scan_menu()
	a = -1;	% temporary hold the HPBW value
	b = -1;	% temporary hold the SLL_reduction value
	
	% Display the menu
	fprintf('\n');
	fprintf('Scanning menu\n');
	fprintf('-------------\n');
	fprintf('1. Scanning pattern considered\n');
	fprintf('2. Scanning pattern NOT considered\n');
	fprintf('? ');
	selection = input('');
	fprintf('\n');
	
	if (selection == 1)
		while (a < 0 || a > 360)
			fprintf('HPBW (deg): ');
			a = input('');
			if(a < 0 || a > 360)
				fprintf('\nError! Invalid HPBW input (0-360)\n');
			end % End if
		end % End 1st while
		while (b < 0 || b > 100)
			fprintf('Side Lobe Level reduction (0-100): ');
			b = input('');
			if (b < 0 || b > 100)
				fprintf('\nError! Invalid SLL_reduction input\n');
			end % End if
		end % End 2nd while
		
	end % End if
	% Return values to the caller
	HPBW = a;
	SLL_reduction = b;
% End scan_menu.m