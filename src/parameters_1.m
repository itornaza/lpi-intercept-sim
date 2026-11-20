%***********************************************************************
% File:     parameters_1.m
% Name:     ion-
% Project:  How low is low?
% Date:     24 Apr 2008
% 
% Description:
%	Provide a database of LPI radars and interceptor receivers to be
% called from the main program
%
% Warnings: None
% **********************************************************************
function [Pcw, Gt, Gr, rcs, L2, PGr, fc, Fr, Bri, SNRro, Lrt, Lrr,...
		Gt_prime, Gi, L1, PGi, Lir, Fi, Bi, SNRio]...
		= parameters(LPI, interceptor, selection, HPBW, SLL_reduction)

exit_switch = 0;
while(~exit_switch)
	switch(LPI)
		case 1	% LPI radar 1
			Pcw = 1;
			Gt = 10^3;
			Gr = 10^3;
			rcs = 10;
			L2 = 1;
			PGr = 0.1 * 1e9;
			fc = 10e9;
			Fr = 10^0.5;
			Bri = 55e6;
			SNRro = 10^0.6;
			Lrt = 1;
			Lrr = 1;
			exit_switch = 1;
		case 2	% LPI radar 2
			Pcw = 1;
			Gt = 1;
			Gr = 1;
			rcs = 1;
			L2 = 1;
			PGr = 1;
			fc = 1;
			Fr = 1;
			Bri = 1;
			SNRro = 1;
			Lrt = 1;
			Lrr = 1;
			exit_switch = 1;
		case 3	% LPI radar 3
			Pcw = 1;
			Gt = 1;
			Gr = 1;
			rcs = 1;
			L2 = 1;
			PGr = 1;
			fc = 1;
			Fr = 1;
			Bri = 1;
			SNRro = 1;
			Lrt = 1;
			Lrr = 1;
			exit_switch = 1;
		otherwise
			fprintf('Invalid choice. Enter 1-3\n');
			exit_switch = 0;
	end	% End switch
end	% End while

exit_switch = 0;
while(~exit_switch)
	switch(interceptor)
		case 1	% Intercept receiver 1
			Gt_prime = scanning_antenna(...
						Gt, selection, HPBW, SLL_reduction);
			Gi = 10^3;
			L1 = 1;
			PGi = 1e-3;
			Lir = 1;
			Fi = 10^0.5;
			Bi = 55e6;
			SNRio = 10^0.6;
			exit_switch = 1;
		case 2	% Intercept receiver 2
			Gt_prime = scanning_antenna(...
						Gt, selection, HPBW, SLL_reduction);
			Gi = 1;
			L1 = 1;
			PGi = 1;
			Lir = 1;
			Fi = 1;
			Bi = 1;
			SNRio = 1;
			exit_switch = 1;
		case 3	% Intercept receiver 3
			Gt_prime = scanning_antenna(...
						Gt, selection, HPBW, SLL_reduction);
			Gi = 1;
			L1 = 1;
			PGi = 1;
			Lir = 1;
			Fi = 1;
			Bi = 1;
			SNRio = 1;
			exit_switch = 1;
		otherwise
			fprintf('Invalid choice. Enter 1-3\n');
			exit_switch = 0;
	end	% End switch
end	% End while

% End parameters_1.m
