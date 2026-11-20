%***********************************************************************
%							print_menu.m
%
% Purpose:			Prints the menu and accepts the users choices
% Data in:			none
% Data out:			none
% Data returned:	choice
% **********************************************************************
function choice = print_menu()
	fprintf('Select input function:\n');
	fprintf('----------------------\n');
	fprintf('1. parameter_1 (3 predefined cases)\n');
	fprintf('2. parameter_2 (All random)\n');
	fprintf('3. parameter_3 (Probability against PGi)\n');
	fprintf('? ');
	choice = input('');
% End print_menu.m