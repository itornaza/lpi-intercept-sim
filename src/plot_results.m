%***********************************************************************
%							plot_results.m
%
% Purpose:			Plot the ratio of the Rrmax over the Rimax to visual
%					support the copmarisson of the LPI and the intercept
%					receiver. Using different plotting techniques for 
%					more insights!
% Data in:			dependent_variable, independent_variable, x_string,
%					t_vector, P_vector, LPI_wins, NUMBER_OF_COMPARISSONS
% Data out:			none
% Data returned:	none
% **********************************************************************
function plot_results(dependent_variable, independent_variable, ... 
x_string, t_vector, P_vector, LPI_wins, NUMBER_OF_COMPARISSONS)
	figure(1);
		loglog(independent_variable, dependent_variable, 'm-');
		title('Log-Log plot')
		ylabel('R_{rmax}/R_{imax}');
		xlabel(strcat(x_string, ' (linear scale)'));
		grid;
	figure(2);
		plot(t_vector, P_vector, 'm-');
		title('Probability of mainlobe interception');
		xlabel('Time (sec)');
		ylabel('Probability');
		grid;
	figure(3);
		plot(t_vector, ...
			P_vector.*(1-LPI_wins/(NUMBER_OF_COMPARISSONS)), 'r-');
		xlabel('Time (sec)');
		ylabel('Probability of intercept');
		grid;
% End plot_results.m