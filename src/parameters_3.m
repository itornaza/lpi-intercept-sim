%***********************************************************************
% File:     parameters_3.m
% Name:     ion-
% Project:  How low is low?
% Date:     24 Apr 2008
% 
% Description:
%	- Provide a database of LPI radars and interceptor receivers to be
% called from the main program. 
%	- Test against PGi. All others will be constant
%
% Warnings: None
% **********************************************************************
function [Pcw, Gt, Gr, rcs, L2, PGr, fc, Fr, Bri, SNRro, Lrt, Lrr,...
		Gt_prime, Gi, L1, PGi, Lir, Fi, Bi, SNRio]...
		= parameters(...
		NUMBER_OF_COMPARISSONS, ix, selection, HPBW, SLL_reduction)

% Assign defaults		
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

Gt_prime = scanning_antenna(Gt, selection, HPBW, SLL_reduction);
Gi = 10^3;
L1 = 1;
Lir = 1;
Fi = 10^0.5;
Bi = 55e6;
SNRio = 10^0.6;

% Assign incrementally the value for the PGi
PGi_array = linspace(10^-9, 10^-2, NUMBER_OF_COMPARISSONS);
PGi = PGi_array(ix);

% End parameters_3.m
