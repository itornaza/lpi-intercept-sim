%***********************************************************************
%							windowing.m
%
% Purpose:			Given the scanning parameters for both an LPI radar
%					and an interceptor, this function calculates the 
%					probability of intercept.  
% Data in:			MAX_TIME
% Data out:			none
% Data returned:	Probability of intercept (P)
% **********************************************************************
function P_vector = windowing(MAX_TIME)
%--------------------
% Local variables
%--------------------
tau_1 = 0;		% Pulse width for window function 1
tau_2 = 0;		% Pulse width for window function 2
T_1 = 0;		% Period of window function 1
T_2 = 0;		% Period of window function 2
T_code = 0;		% Subcode period of the LPI waveform
omega_1 = 0;	% Rotational speed for LPI
omega_2 = 0;	% Rotational speed for interceptor
HPBW_1 = 0;		% Half power beam width of the LPI main lobe
HPBW_2 = 0;		% Half power beam width of the interceptor main lobe
To = 0;			% Average time between window matches
Po = 0;			% Probability of intercept at time 0
flag = 1;		% Program while wrapper control variable

% Vectors
t = 1: 1: MAX_TIME;
P = 1: 1: MAX_TIME;

while (flag)
	% User Input
	fprintf('Windowing menu\n');
	fprintf('--------------\n');
	fprintf('LPI rotational speed (deg/s):\t\t');
	omega_1= input('');
	fprintf('LPI HPBW (deg):\t\t\t\t');
	HPBW_1 = input('');
	fprintf('Interceptor rotational speed (deg/s):\t');
	omega_2= input('');
	fprintf('Interceptor HPBW (deg):\t\t\t');
	HPBW_2 = input('');
	fprintf('Code period (sec):\t\t\t');
	T_code = input('');
	% Caculations
	tau_1 = HPBW_1/omega_1;
	tau_2 = HPBW_2/omega_2;
	T_1 = 360/omega_1;
	T_2 = 360/omega_2;
	tau_2 = tau_2-4*T_code;
	if (tau_2 > 0)
		To = (T_1*T_2)/(tau_1+tau_2);
		Po = (tau_1*tau_2)/(T_1*T_2);
		kapa = 1-Po;
		P = 1-kapa*exp(-t/To);
		flag = 0;
	else
		fprintf('\nError in windowing function: ');
		fprintf('It should be (tau_2 > 4*T_code)\n');
		fprintf('Enter values again\n\n');
		flag = 1;
	end % End if-else
end % End while
fprintf('\n\n');
P_vector = P;

% End windowing.m
