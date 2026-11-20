%***********************************************************************
% File:     parameters_2.m
% Name:     ion-
% Project:  How low is low?
% Date:     24 Apr 2008
% 
% Description:
%	Provide a database of LPI radar and interceptor receiver to be
% called from the main program. The parameters of the range equations
% are randomly assigned from a predefined bank of possible values.
%
% Warnings: None
% **********************************************************************
function [Pcw, Gt, Gr, rcs, L2, PGr, fc, Fr, Bri, SNRro, Lrt, Lrr,...
			Gt_prime, Gi, L1, PGi, Lir, Fi, Bi, SNRio] = ...
			parameters_2(selection, HPBW, SLL_reduction);

%-------------------
% Local constants
%-------------------
SPACING = 10;
PCW_MAX = 10;
GT_MAX = 10^4;
GR_MAX = 10^4;
RCS_MAX = 100;
L2_MAX = 1;
PGR_MAX = 1e9;
FC_MAX = 10e9;
FR_MAX = 10^1.2;
BRI_MAX = 1e9;
SNRRO_MAX = 10^1.2;
LRT_MAX = 1;
LRR_MAX = 1;

GT_PRIME_MAX = 10^4;
GI_MAX = 10^4;
L1_MAX = 1;
PGI_MAX = 1e3;
LIR_MAX = 1;
FI_MAX = 10^1.2;
BI_MAX = 1e9;
SNRIO_MAX = 10^1.2;

%-------------------
% Local variables
%-------------------

% LPI parameters
Pcw_vtr = linspace(1, PCW_MAX, SPACING);
Gt_vtr  = linspace(10^3, GT_MAX, SPACING);
Gr_vtr  = linspace(10^3, GR_MAX, SPACING);
rcs_vtr = linspace(5, RCS_MAX, SPACING);
L2_vtr  = linspace(0.2, L2_MAX, SPACING);
PGr_vtr = linspace(1e3, PGR_MAX, SPACING);
fc_vtr  = linspace(2e9, FC_MAX, SPACING);
Fr_vtr  = linspace(10^0.3, FR_MAX, SPACING);
Bri_vtr = linspace(1e6, BRI_MAX, SPACING);
SNRro_vtr = linspace(10^0.2, SNRRO_MAX, SPACING);
Lrt_vtr = linspace(0.8, LRT_MAX, SPACING);
Lrr_vtr = linspace(0.8, LRR_MAX, SPACING);
% Intercept receiver parameters
Gi_vtr	= linspace(10^3, GI_MAX, SPACING);
L1_vtr  = linspace(0.2, L1_MAX, SPACING);
PGi_vtr = linspace(1e-3, PGI_MAX, SPACING);
Lir_vtr = linspace(0.2, LIR_MAX, SPACING);
Fi_vtr  = linspace(10^0.3, FI_MAX, SPACING);
Bi_vtr  = linspace(1e6, BI_MAX, SPACING);
SNRio_vtr = linspace(10^0.2, SNRIO_MAX, SPACING);

%-------------------
% Assignments
%-------------------
% LPI parameters
Pcw = ceil(PCW_MAX.*rand());
Gt  = ceil(GT_MAX.*rand());
Gr  = ceil(GR_MAX.*rand());
rcs = ceil(RCS_MAX.*rand());
L2  = ceil(L2_MAX.*rand());
PGr = ceil(PGR_MAX.*rand());
fc  = ceil(FC_MAX.*rand());
Fr  = ceil(FR_MAX.*rand());
Bri = ceil(BRI_MAX.*rand());
SNRro = ceil(SNRRO_MAX.*rand());
Lrt = ceil(LRT_MAX.*rand());
Lrr = ceil(LRR_MAX.*rand());
% Intercept receiver parameters
Gt_prime = scanning_antenna(Gt, selection, HPBW, SLL_reduction);
Gi = ceil(GI_MAX.*rand());
L1 = ceil(L1_MAX.*rand());
PGi = ceil(PGI_MAX.*rand());
Lir = ceil(LIR_MAX.*rand());
Fi = ceil(FI_MAX.*rand());
Bi = ceil(BI_MAX.*rand());
SNRio = ceil(SNRIO_MAX.*rand());

% End parameters_2.m
			