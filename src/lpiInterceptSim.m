%***********************************************************************
% File:     lpiInterceptSim.m
% Name:     ion-
% Project:  How low is low?
% Date:     24 Apr 2008
% 
% Description:
%	Compare the LPI and Interceptor maximum ranges that are given in the
% parameters_X.m database of LPIs and interceptor receivers. Then 
% perform a probabilistic analysis on the resulting data.
%
% Warnings: None
% **********************************************************************
% Preliminary clean-up operations
close all;
clear;
clc;

%----------------------
% Simulation precision
%----------------------
format long;
NUMBER_OF_COMPARISSONS = 10000;
MAX_TIME = 10000;	% Time interval to look into

%-------------------------
% Flow control variables
%-------------------------
ix = 1;			% loop counter
LPI_wins = 0;	% Keep track of how many times LPI wins
choice = 0;		% Select input function to execute
selection = 0;	% Select scanning options
LPI = 0;		% Parameter return from parameter_1
a = 0;			% Parameter passing to parameter_1
interceptor = 0;% Parameter return from parameter_1
b = 0;			% Parameter passing to parameter_1
verbose = -1;	% Control the output of the compare_ranges function

%-----------------------
% Scientific Constants
%-----------------------
C = 3e8;	% Speed of light in vacuum (m/s)
K = 1.380658e-23;	% Boltzmans constant (J*s)
T0 = 290;	% Standard ambient temperature (K)

%----------------
% Variables
%----------------
% LPI radar variables
Rrmax = 0;	% maximum range
Pcw = 0;	% average power emitted
Gt = 0;		% gain of the transmitting antenna
Gr = 0;		% gain of the receiving antenna
rcs = 0;	% radar cross section of the target
L2 = 0;		% two way free space path loss
PGr = 0;	% radar processing gain
fc = 0;		% carrier frequency
Fr = 0;		% receiver noise factor
Bri = 0;	% receiver input bandwidth
SNRro = 0;	% receiver output signal to noise ratio
Lrt = 0;	% loss between the transmitting antenna and the transmitter
Lrr = 0;	% loss between the receiving antenna and the receiver
% Interceptor variables
Rimax = 0;		% maximum range
Gt_prime = 0;	% LPI radar side-lobe gain as seen from the interceptor
Gi = 0;			% receiving antenna gain
L1 = 0;			% one-way free space path loss
PGi = 0;		% interceptor processing gain
Lir = 0;		% loss between the receiving antenna and the receiver
Fi = 0;			% noise factor of the receiver
Bi = 0;			% input bandwidth of the receiver
SNRio = 0;		% receiver output signal to noise ratio
HPBW = 0;		% The half power beam width of the radar antenna
SLL_reduction = 0;	% Precentage that the side lobes are reduced from
					% the main lobe
probability_main_lobe = 0;	% The probability for the interceptor to 
							% intercept the radars main lobe
P_vector = 1: 1: MAX_TIME;
t_vector = 1: 1: MAX_TIME;
% Plots
plot_on = 0;	% Control which parameters_X will plot
dependent_variable = 1: 1: NUMBER_OF_COMPARISSONS;
independent_variable = 1: 1: NUMBER_OF_COMPARISSONS;
x_string = 'null';	% Control the string to be outputted for the xlabel

%-------------------
% User input
%-------------------
print_banner();

while (verbose ~= 0 && verbose ~= 1)
	verbose = print_verbose();
end % End While
fprintf('\n');

while (choice ~= 1 && choice ~= 2 && choice ~= 3)
	choice = print_menu();
end % End while

%-------------------
% Calculations
%-------------------
for ix = 1: 1: NUMBER_OF_COMPARISSONS
	% Call the corresponding parameters function
	if (choice == 1)
		[LPI, interceptor] = parameters_1_control(a, b);
		[Pcw, Gt, Gr, rcs, L2, PGr, fc, Fr, Bri, SNRro, Lrt, Lrr,...
			Gt_prime, Gi, L1, PGi, Lir, Fi, Bi, SNRio] = ...
			parameters_1(LPI, interceptor, ...
			selection, HPBW, SLL_reduction);
		plot_on = 1;
		break; % Run only once, no looping needed for this one
	elseif (choice == 2)
		[Pcw, Gt, Gr, rcs, L2, PGr, fc, Fr, Bri, SNRro, Lrt, Lrr,...
			Gt_prime, Gi, L1, PGi, Lir, Fi, Bi, SNRio] = ...
			parameters_2(selection, HPBW, SLL_reduction);
		plot_on = 1;
	elseif (choice == 3)
		[Pcw, Gt, Gr, rcs, L2, PGr, fc, Fr, Bri, SNRro, Lrt, Lrr,...
			Gt_prime, Gi, L1, PGi, Lir, Fi, Bi, SNRio] = ...
			parameters_3(NUMBER_OF_COMPARISSONS, ix, ...
			selection, HPBW, SLL_reduction);
		independent_variable(ix) = PGi;
		x_string = 'PGi';
		plot_on = 1;
	end
	% Calculate the LPI radars maximum range
	Rrmax = ((Pcw * Gt * Gr * C^2 * rcs * L2 * PGr)/...
		(fc^2 * (4*pi)^3 * K * T0 * Fr * Bri * SNRro * Lrt * Lrr)...
			)^(1/4);
	% Calculate the interceptors maximum range
	Rimax = ((Pcw * Gt_prime * Gi * L1 * C^2 * PGi)/...
			(fc^2 * (4*pi)^2 * Lrt * Lir * K * T0 * Fi * Bi * SNRio)...
			)^(1/2);
	% Compare the maximum ranges
	LPI_won_once = compare_ranges(Rrmax, Rimax, verbose);
	LPI_wins = LPI_wins + LPI_won_once;
	dependent_variable(ix) = Rrmax/Rimax;
end	% End for

print_results(LPI_wins, NUMBER_OF_COMPARISSONS);
P_vector = windowing(MAX_TIME);

%------------------
% Plot results
%------------------
if (plot_on)
	plot_results(dependent_variable, independent_variable, x_string,...
				t_vector, P_vector, LPI_wins, NUMBER_OF_COMPARISSONS);
end % End if

% End lpiInterceptSim.m
