/* You need to run the "Let_Go.do" file prior to running this one for some scalars */

*** MSFE, RMSFE, MAFE
	
	scalar est_length = 255
	scalar no_windows = 479000 // max lies at approx 479 currently; by choosing a number above, the max. number of iterations is performed
	scalar price = "yes" // do not change; volume-based not implemented 
	quietly do forecast_errors


*** Output 
	scalar earliest_year = 2007 // using these three scalars, you can determine for which period to display statistics after having run the estimations for all periods
	scalar latest_year = 2022
	scalar latest_date = 20220714


    ** display in Stata
	foreach y in MSFE RMSFE MAFE {
		if "`y'" == "MSFE" {
			tabstat `y'_variables `y'_variables_2  `y'_const_mean if year >= earliest_year & year <= latest_year & date <= latest_date, stat(mean sd min max skewness kurtosis) 
		}
		else {
			tabstat `y'_variables `y'_variables_2 `y'_const_mean if year >= earliest_year & year <= latest_year & date <= latest_date, stat(mean sd min max skewness kurtosis) 
		}
	}

