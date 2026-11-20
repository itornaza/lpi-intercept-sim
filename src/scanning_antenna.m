%***********************************************************************
%							scanning_antenna.m
%
% Purpose:			Every time this function is called, it wil return a
%					side lobe gain value depending on the probability
%					to intercept a side lobe versus a main lobe.
% Data in:			Gt, selection, HPBW, SLL_reduction
% Data out:			none
% Data returned:	Gt_prime
% **********************************************************************
function Gt_prime = scanning_antenna(Gt, selection, HPBW, SLL_reduction)
	if (selection == 1)
		probability_main_lobe = (HPBW/360)*100;
		number = ceil(100.*rand());
		if number < (probability_main_lobe)
			Gt_prime = Gt;
		else
			Gt_prime = Gt * (1-SLL_reduction);
		end	% End if-else
	else
		Gt_prime = Gt;
	end	% End if-else
% End scanning_antenna.m
