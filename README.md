# Optimal-ML1-criteria
License: MIT License

Instructions:
- Run the numbered files in the ascending order
- Files with the same number can run simultaneously
- The unnumbered files do not need to be started by the user 
(they are triggered by the numbered files automatically)

Description of Octave codes:
- 01.Ev_L1_IRLS.m: compute the covariance matrix of residuals for all combinations with IRLS method of solution.
- 01.Ev_L1_simplex.m: compute the covariance matrix of residuals for all combinations with simplex method of solution.
- 01.save_outs_positions.m: save a matrix with the position of the outliers for each scenario simulated
- 02.v_L1_IRLS.m: compute the residuals vector for each scenario simulated (combinations with IRLS method of solution).
- 02.v_L1_simplex.m: compute the residuals vector for each scenario simulated (combinations with simplex method of solution). 
- 03.w_CV_ML1_IRLS.m: compute the critical value for outlier identification (combinations with IRLS method of solution).
- 03.w_CV_ML1_simplex.m: compute the critical value for outlier identification (combinations with simplex method of solution).
- 04.ML1_IRLS.m: compute the accuracy in outlier identification (combinations with IRLS method of solution).
- 04.ML1_simplex.m: compute the accuracy in outlier identification (combinations with simplex method of solution).
- get_network.m: function that returns all information needed about each geodetic network analyzed
- gera_smc.m: generates Monte Carlo simulations (with outliers)
- gera_smc_0outdif.m: generates Monte Carlo simulations (without outliers)
- acc_score.m: function to compute accuracy in outlier identification
