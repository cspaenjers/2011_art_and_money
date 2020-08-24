
cap log close
set more off
clear all

cd "/Users/spaenjers/Dropbox (HEC PARIS-)/Varia/Data for other researchers/GRS_AER_PP"

log using ArtMoney.smcl, replace

******

* FIGURE 1
use Series1830.dta, clear
twoway(line lnart year)

* TABLE 1
* Column 1
use Series1830.dta, clear
regress d1.lnart d1.lneqcg l1.d1.lneqcg d1.lneqdiv
newey d1.lnart d1.lneqcg l1.d1.lneqcg d1.lneqdiv, lag(1)
* Column 2
use Series1908.dta, clear
regress d1.lnart d1.lninc d1.ineq
newey d1.lnart d1.lninc d1.ineq, lag(1)
* Column 3
regress d1.lnart d1.lneqcg l1.d1.lneqcg d1.lninc d1.ineq
newey  d1.lnart d1.lneqcg l1.d1.lneqcg d1.lninc d1.ineq, lag(1)

* TABLE 2
use Series1908.dta, clear
vecrank lnart lneq, lags(2) trend(constant) max 
vecrank lnart lneqcg, lags(2) trend(constant) max
vecrank lnart lngdp, lags(2) trend(constant) max
vecrank lnart lninc, lags(2) trend(constant) max
vecrank lnart lntop, lags(2) trend(constant) max

******

log close
