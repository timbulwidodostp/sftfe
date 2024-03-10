{smcl}
{* *! version 1.1.2  25nov2011}{...}
{cmd:help sfcross}{right: ({browse "http://www.stata-journal.com/article.html?article=up0049":SJ15-4: st0315_2})}
{hline}

{title:Title}

{p2colset 5 16 18 2}{...}
{p2col :{hi:sfcross} {hline 2}}Stochastic frontier models for cross-sectional data{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 17 2}
{cmd:sfcross}
{depvar}
[{indepvars}]
{ifin}
{weight}
[{cmd:,} {it:options}]

{synoptset 33 tabbed}{...}
{synopthdr}
{synoptline}
{syntab :Frontier}
{synopt :{opt nocons:tant}}suppress constant term{p_end}
{synopt :{cmdab:d:istribution(}{opt e:xponential)}}exponential distribution for the inefficiency term, the default{p_end}
{synopt :{cmdab:d:istribution(}{opt h:normal)}}half-normal distribution for the
inefficiency term{p_end}
{synopt :{cmdab:d:istribution(}{opt t:normal)}}truncated normal distribution for the inefficiency term{p_end}
{synopt :{cmdab:d:istribution(}{opt g:amma)}}gamma distribution for the inefficiency term{p_end}

{syntab :Ancillary equations}
{synopt :{cmdab:e:mean(}{it:{help varlist:varlist_m}} [{cmd:,} {opt nocons:tant}]{cmd:)}}fit
conditional mean model; only with {cmd:distribution(tnormal)}; use {opt noconstant} to
suppress constant term{p_end}
{synopt :{cmdab:u:sigma(}{it:{help varlist:varlist_u}} [{cmd:,} {opt nocons:tant}]{cmd:)}}specify explanatory
variables for the inefficiency variance function; use {opt noconstant}
to suppress constant term{p_end}
{synopt :{cmdab:v:sigma(}{it:{help varlist:varlist_v}} [{cmd:,} {opt nocons:tant}]{cmd:)}}specify explanatory
variables for the idiosyncratic error variance function; use {opt noconstant}
to suppress constant term{p_end}

{syntab :{help sfcross##sv_remarks:Starting values}}
{synopt:{opt svfront:ier(listname)}}specify a 1 x k vector of initial values for the coefficients of the frontier{p_end}
{synopt:{opt sve:mean(listname)}}specify a 1 x k_m vector of initial values for the coefficients of the conditional mean model; only with {cmd:distribution(tnormal)}{p_end}
{synopt:{opt svu:sigma(listname)}}specify a 1 x k_u vector of initial values for the coefficients of the inefficiency variance function{p_end}
{synopt:{opt svv:sigma(listname)}}specify a 1 x k_v vector of initial values for the coefficients of the idiosyncratic error variance function{p_end}
{synopt :{opt nosearch}}no attempt is made to improve on the initial values{p_end}
{synopt :{opt restart}}select the random method to improve initial values{p_end}
{synopt :{opt repeat(#)}}# of times the random values are tried; the default is 10{p_end}
{synopt :{opt resc:ale}}determine rescaling of initial values{p_end}

{syntab :Other options}
{synopt :{opt cost}}fit cost frontier model; default is production frontier
model{p_end}
{synopt :{cmdab:const:raints(}{it:{help estimation options##constraints():constraints}}{cmd:)}}apply specified linear constraints{p_end}
{synopt :{cmdab:simtype(}{it:{help sfcross##simtype:simtype}}{cmd:)}}method to produce random draws for simulation; only with {cmd:distribution(gamma)}{p_end}
{synopt :{opt nsim:ulations(#)}}# of draws; only with {cmd:distribution(gamma)}{p_end}
{synopt :{opt base(#)}}prime number used as a base for generation of Halton sequences; only with {cmd:distribution(gamma)} and {cmd:simtype(halton)} or {cmd:simtype(genhalton)}{p_end}

{syntab :SE}
{synopt :{opth vce(vcetype)}}{it:vcetype} may be {opt oim}, {opt opg}, {opt r:obust}, {opt cl:uster} {it:clustvar}, {opt boot:strap}, or {opt jack:knife}{p_end}
{synopt :{opt r:obust}}synonym for {cmd:vce(robust)}{p_end}{synopt :{opt cl:uster(clustvar)}}synonym for {cmd:vce(cluster}{it:clustvar}{cmd:)}{p_end} 
{syntab :Reporting}
{synopt :{opt l:evel(#)}}set confidence level; default is
{cmd:level(95)}{p_end}
{synopt :{opt nocnsr:eport}}do not display constraints{p_end}
{synopt :{opt nowarn:ing}}do not display warning message "convergence not achieved"{p_end}
{synopt :{opt postscore}}save observation-by-observation scores in the estimation results' list{p_end} 
{synopt :{opt posthess:ian}}save the Hessian corresponding to the full set of coefficients in the estimation results' list{p_end}
{synopt :{it:{help sfcross##display_options:display_options}}}control spacing
           and display of omitted variables and base and empty cells{p_end}

{syntab :Maximization}
{synopt :{it:{help sfcross##maximize_options:maximize_options}}}control the maximization process; seldom used{p_end}

{p2coldent:{opt coefl:egend}}display coefficients' legend instead of coefficient table{p_end}
{synoptline}

{synoptset 20}{...}
{marker simtype}{...}
{synopthdr :simtype}
{synoptline}
{synopt :{opt ru:niform}}uniformly distributed random variates{p_end}
{synopt :{opt ha:lton}}Halton sequence with {opt base(#)}{p_end}
{synopt :{opt genha:lton}}generalized Halton sequence with {opt base(#)}{p_end}
{synoptline}
{p2colreset}{...}

{p2colreset}{...}
{p 4 6 2}
{it:indepvars} may contain factor variables; see {help fvvarlist}.{p_end}
{p 4 6 2}
{opt bootstrap}, {opt by}, {opt jackknife}, and {opt svy}
are allowed; see {help prefix}.{p_end}
{p 4 6 2}Weights are not allowed with the {helpb bootstrap} prefix.{p_end}
{p 4 6 2}{opt pweight}s, {opt aweight}s, {opt fweight}s, and {opt iweight}s are allowed;
see {help weight}.{p_end}
{p 4 6 2}


{title:Description}

{pstd}{cmd:sfcross} fits stochastic production or cost frontier models;
the default is a production frontier model.  It provides estimators for
the parameters of a linear model with a disturbance that is assumed to
be a mixture of two components that have a strictly nonnegative and
symmetric distribution, respectively.  {cmd:sfcross} can fit models in
which the nonnegative distribution component (a measurement of
inefficiency) is assumed to be from a half-normal, exponential,
truncated normal, or gamma distribution.  In the last case,
maximization is performed through maximum simulated likelihood.


{title:Options}

{dlgtab:Frontier}

{phang}{cmd:noconstant}; see
{helpb estimation options##noconstant:[R] estimation options}.

{phang}{opt distribution(distname)} specifies the distribution for the
inefficiency term as half-normal ({cmd:hnormal}), truncated normal
({cmd:tnormal}), exponential ({cmd:exponential}), or gamma
({cmd:gamma}).  The default is {cmd:distribution(exponential)}.

{dlgtab:Ancillary equations}

{phang}{cmd:emean(}{it:varlist_m}[{cmd:,} {cmd:noconstant}]{cmd:)}
may be used only with {cmd:distribution(tnormal)}.  With this option,
{cmd:sfcross} specifies the mean of the truncated normal distribution in
terms of a linear function of the covariates defined in {it:varlist_m}.
Specifying {cmd:noconstant} suppresses the constant in this function.

{phang}{cmd:usigma(}{it:varlist_u}[{cmd:,} {cmd:noconstant}]{cmd:)}
specifies that the technical inefficiency component is heteroskedastic, with the
variance expressed as a function of the covariates defined in
{it:varlist_u}.  Specifying {cmd:noconstant} suppresses the constant in
this function.

{phang}{cmd:vsigma(}{it:varlist_v}[{cmd:,} {cmd:noconstant}]{cmd:)}
specifies that the idiosyncratic error component is heteroskedastic,
with the variance expressed as a function of the covariates defined in
{it:varlist_v}.  Specifying {cmd:noconstant} suppresses the constant in
this function.

{dlgtab:Starting values}

{phang}{opt svfrontier(listname)} specifies a 1 x k vector of initial values for
the coefficients of the frontier.  The vector must have the same length
of the parameter vector to be estimated.

{phang}{opt svemean(listname)} specifies a 1 x k_m vector of initial
values for the coefficients of the conditional mean model.  This option
can be specified only with {cmd:distribution(tnormal)}.

{phang}{opt svusigma(listname)} specifies a 1 x k_u vector of initial
values for the coefficients of the technical inefficiency variance
function.

{phang}{opt svvsigma(listname)} specifies a 1 x k_v vector of
initial values for the coefficients of the idiosyncratic error variance
function.

{phang}{opt nosearch} determines that no attempts be made to improve on
the initial values via a search technique.  In this case, the initial
values become the starting values.

{phang}{opt restart} determines that the random method of improving
initial values be attempted.  See also 
{helpb mf_moptimize##init_search:mata moptimize()}.

{phang}{opt repeat(#)} controls how many times random values are tried
if the random method is turned on.  The default is {cmd:repeat(10)}.

{phang}{opt rescale} determines whether rescaling be attempted.
Rescaling is a deterministic method.  It also usually improves initial
values and usually reduces the number of subsequent iterations required
by the optimization technique.

{dlgtab:Other options}

{phang}{opt cost} specifies that {cmd:sfcross} fit a cost frontier
model.

{phang}{opt constraints}({it:{help estimation options##constraints():constraints}}) applies specified linear constraints.

{phang}{opt simtype(simtype)} specifies the method to generate random
draws when {cmd:distribution(gamma)} is specified.  {cmd:runiform} generates
uniformly distributed random variates; {cmd:halton} and {cmd:genhalton}
create, respectively, Halton sequences and generalized Halton sequences
where the base is expressed by the prime number in {opt base(#)}.  The
default is {cmd:simtype(runiform)}.  See also {helpb mata halton()} for more
details on generating Halton sequences.

{phang}{opt nsimulations(#)} specifies the number of draws used when
{cmd:distribution(gamma)} is specified.  The default is
{cmd:nsimulations(250)}.

{phang}{opt base(#)} specifies the number, preferably a prime, used as a
base for the generation of Halton sequences and generalized Halton
sequences when {cmd:distribution(gamma)} is specified.  The default is
{cmd:base(7)}.  Note that Halton sequences based on large primes (#>10)
can be highly correlated, and their coverage can be worse than that of
pseudorandom uniform sequences.

{dlgtab:SE}

{phang}{opt vce(vcetype)} specifies the type of standard error reported,
which includes types that are derived from asymptotic theory and
that use bootstrap or jackknife methods; see 
{helpb vce_option:[R] {it:vce_option}}.

{dlgtab:Reporting}

{phang}{opt level(#)}; see
{helpb estimation options##level():[R] estimation options}.

{phang}{opt nocnsreport}; see
     {helpb estimation options##nocnsreport:[R] estimation options}.

{phang}{opt nowarning} specifies whether the warning message
"convergence not achieved" should be displayed when this stopping
rule is invoked.  By default the message is displayed.

{phang}{opt postscore} saves an observation-by-observation matrix of
scores in the estimation results' list.  Scores are defined as the
derivative of the objective function with respect to the 
{help mf_moptimize##def_parameter:parameters}.  This option is not allowed
when the size of the scores' matrix is greater than the Stata matrix
limit; see {helpb limits:[R] limits}.

{phang}{opt posthessian} saves the Hessian matrix corresponding to the
full set of coefficients in the estimation results' list.

{marker display_options}{...}
{phang}{it:display_options}:  {opt noomit:ted}, {opt vsquish}, 
{opt noempty:cells}, {opt base:levels}, {opt allbase:levels}; see 
{helpb estimation options##display_options:[R] estimation options}.

{marker maximize_options}{...}
{dlgtab:Maximization}

{phang}{it:maximize_options}:  {opt dif:ficult}, 
{opt tech:nique(algorithm_spec)}, {opt iter:ate(#)}, 
[{cmdab:no:}]{opt lo:g}, {opt tr:ace}, {opt grad:ient}, {opt showstep},
{opt hess:ian}, {opt showtol:erance}, {opt tol:erance(#)}, 
{opt ltol:erance(#)}, {opt nrtol:erance(#)}, {opt nonrtol:erance}; see
{manhelp maximize R}.  These options are seldom used.

{phang}{opt coeflegend}; see
     {helpb estimation options##coeflegend:[R] estimation options}.

	 
{marker sv_remarks}{...}
{title:Remarks}

{pstd}{cmd:sv}{it:eqname}{cmd:()} specifies initial values for the
coefficients of {it:eqname}.  You can specify the initial values in one
of three ways:  1) by specifying the name of a vector containing the
initial values (for example, {cmd:sv}{it:frontier}{cmd:(b0)}, where {cmd:b0}
is a conformable vector); 2) by specifying coefficient names with the
values in the same order as they appear in the command syntax (for
example, {cmd:sv}{it:frontier}{cmd:(x1=.5 x2=.3 _cons=1)}, if 
{cmd:sfcross y x1 x2}); or 3) by specifying a list of values (for
example, {cmd:sv}{it:frontier}{cmd:(.5 .3 1)}).


{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse frontier1}{p_end}

{pstd}Cobb-Douglas production function with exponential distribution for
inefficiency term{p_end}
{phang2}{cmd:. sfcross lnoutput lnlabor lncapital}{p_end}

{pstd}Cobb-Douglas production function with half-normal distribution for
inefficiency term{p_end}
{phang2}{cmd:. sfcross lnoutput lnlabor lncapital, distribution(hnormal)}{p_end}

{pstd}Cobb-Douglas production function with quartiles of {cmd:size} as
explanatory variables in variance function for idiosyncratic error{p_end}
{phang2}{cmd:. xtile qsize = size , nq(4)}{p_end}
{phang2}{cmd:. sfcross lnoutput lnlabor lncapital, vsigma(i.qsize)}{p_end}

{pstd}Cobb-Douglas production function with gamma distribution for
inefficiency term{p_end}
{phang2}{cmd:. sfcross lnoutput lncapital lnlabor, distribution(gamma) rescale simtype(genha) nsim(100)}{p_end}

{pstd}Cobb-Douglas production function with {cmd:lnlabor},
{cmd:lncapital}, and quartiles of {cmd:size} as explanatory variables of,
respectively, the variance of the inefficiency term, the variance of the
idiosyncratic error, and the truncated mean{p_end}
{phang2}{cmd:. sfcross lnoutput lnlabor lncapital, distribution(tnormal) emean(i.qsize) usigma(lnlabor) vsigma(lncapital)}{p_end}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse frontier2, clear}{p_end}

{pstd}Cost frontier model with exponential distribution for inefficiency
term with constraints on prices{p_end}
{phang2}{cmd:. constraint def 1 lnp_l+ lnp_k=1}{p_end}
{phang2}{cmd:. sfcross lncost lnout lnp_l lnp_k, cost constr(1)}{p_end}


{title:Stored results}

{pstd}{cmd:sfcross} stores the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(N)}}number of observations{p_end}
{synopt:{cmd:e(k)}}number of parameters{p_end}
{synopt:{cmd:e(k_eq)}}number of equations in {cmd:e(b)}{p_end}
{synopt:{cmd:e(k_dv)}}number of dependent variables{p_end}
{synopt:{cmd:e(df_m)}}model degrees of freedom{p_end}
{synopt:{cmd:e(ll)}}log likelihood{p_end}
{synopt:{cmd:e(ll_c)}}log likelihood for H_0: sigma_u=0{p_end}
{synopt:{cmd:e(converged)}}{cmd:1} if converged, {cmd:0} otherwise{p_end}
{synopt:{cmd:e(rank)}}rank of {cmd:e(V)}{p_end}
{synopt:{cmd:e(ic)}}number of iterations{p_end}
{synopt:{cmd:e(iterations)}}number of iterations, including initial step{p_end}
{synopt:{cmd:e(rc)}}return code{p_end}
{synopt:{cmd:e(chi2)}}chi-squared{p_end}
{synopt:{cmd:e(p)}}significance{p_end}
{synopt:{cmd:e(chi2_c)}}LR test statistic{p_end}
{synopt:{cmd:e(z)}}test for negative skewness of OLS residuals{p_end}
{synopt:{cmd:e(p_z)}}p-value for z{p_end}
{synopt:{cmd:e(k_autoCns)}}number of base, empty, and omitted constraints{p_end}
{synopt:{cmd:e(sigma_u)}}standard deviation of technical inefficiency{p_end}
{synopt:{cmd:e(sigma_v)}}standard deviation of V_i{p_end}
{synopt:{cmd:e(g_shape)}}shape parameter of the Gamma distributed inefficiency{p_end}
{synopt:{cmd:e(avg_sigmau)}}average standard deviation of technical inefficiency{p_end}
{synopt:{cmd:e(avg_sigmav)}}average standard deviation of V_i{p_end}
{synopt:{cmd:e(lambda)}}signal to noise ratio{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:sfcross}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}
{synopt:{cmd:e(depvar)}}name of dependent variable{p_end}
{synopt:{cmd:e(wtype)}}weight type{p_end}
{synopt:{cmd:e(wexp)}}weight expression{p_end}
{synopt:{cmd:e(title)}}title in estimation output{p_end}
{synopt:{cmd:e(chi2type)}}{cmd:Wald}; type of model chi-squared test{p_end}
{synopt:{cmd:e(vce)}}{it:vcetype} specified in {cmd:vce()}{p_end}
{synopt:{cmd:e(vcetype)}}title used to label Std. Err.{p_end}
{synopt:{cmd:e(opt)}}type of optimization{p_end}
{synopt:{cmd:e(which)}}{cmd:max} or {cmd:min}; whether optimizer is to perform maximization or minimization{p_end}
{synopt:{cmd:e(ml_method)}}type of {cmd:ml} method{p_end}
{synopt:{cmd:e(user)}}name of likelihood-evaluator program{p_end}
{synopt:{cmd:e(technique)}}maximization technique{p_end}
{synopt:{cmd:e(singularHmethod)}}{cmd:m-marquardt} or {cmd:hybrid}; method used when Hessian is singular{p_end}
{synopt:{cmd:e(crittype)}}optimization criterion{p_end}
{synopt:{cmd:e(properties)}}{cmd:b V}{p_end}
{synopt:{cmd:e(function)}}{cmd:production} or {cmd:cost}{p_end}
{synopt:{cmd:e(covariates)}}name of independent variables{p_end}
{synopt:{cmd:e(dist)}}distribution assumption for U_i{p_end}
{synopt:{cmd:e(het)}}heteroskedastic components{p_end}
{synopt:{cmd:e(Emean)}}{it:varlist} in {cmd:emean()}{p_end}
{synopt:{cmd:e(Usigma)}}{it:varlist} in {cmd:usigma()}{p_end}
{synopt:{cmd:e(Vsigma)}}{it:varlist} in {cmd:vsigma()}{p_end}
{synopt:{cmd:e(simtype)}}method to produce random draws{p_end}
{synopt:{cmd:e(base)}}base number to generate Halton sequences{p_end}
{synopt:{cmd:e(nsim)}}number of random draws{p_end}
{synopt:{cmd:e(predict)}}program used to implement {cmd:predict}{p_end}
{synopt:{cmd:e(constraints)}}list of specified constraints{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(b)}}coefficient vector{p_end}
{synopt:{cmd:e(Cns)}}constraints matrix{p_end}
{synopt:{cmd:e(ilog)}}iteration log (up to 20 iterations){p_end}
{synopt:{cmd:e(gradient)}}gradient vector{p_end}
{synopt:{cmd:e(V)}}variance-covariance matrix of the estimators{p_end}
{synopt:{cmd:e(V_modelbased)}}model-based variance{p_end}
{synopt:{cmd:e(postscore)}}observation-by-observation scores{p_end}
{synopt:{cmd:e(posthessian)}}Hessian corresponding to the full set of coefficients{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Functions}{p_end}
{synopt:{cmd:e(sample)}}marks estimation sample{p_end}
{p2colreset}{...}


{title:Authors}

{pstd}Federico Belotti{p_end}
{pstd}Centre for Economic and International Studies{p_end}
{pstd}University of Rome Tor Vergata{p_end}
{pstd}Rome, Italy{p_end}
{pstd}federico.belotti@uniroma2.it{p_end}

{pstd}Silvio Daidone{p_end}
{pstd}Centre for Health Economics{p_end}
{pstd}University of York{p_end}
{pstd}York, UK{p_end}
{pstd}silvio.daidone@york.ac.uk{p_end}

{pstd}Vincenzo Atella{p_end}
{pstd}Centre for Economic and International Studies{p_end}
{pstd}University of Rome Tor Vergata{p_end}
{pstd}Rome, Italy{p_end}
{pstd}atella@uniroma2.it{p_end}

{pstd}Giuseppe Ilardi{p_end}
{pstd}Economic and Financial Statistics Department{p_end}
{pstd}Bank of Italy{p_end}
{pstd}Rome, Italy{p_end}
{pstd}giuseppe.ilardi@bancaditalia.it{p_end}


{title:Also see}

{p 4 14 2}Article:  {it:Stata Journal}, volume 15, number 4: {browse "http://www.stata-journal.com/article.html?article=up0049":st0315_2},{break}
                    {it:Stata Journal}, volume 15, number 2: {browse "http://www.stata-journal.com/article.html?article=up0047":st0315_1},{break}
                    {it:Stata Journal}, volume 13, number 4: {browse "http://www.stata-journal.com/article.html?article=st0315":st0315}

{p 7 14 2}Help:  {help sfcross postestimation}, {helpb sfpanel}, {help sfpanel postestimation} (if installed){p_end}
