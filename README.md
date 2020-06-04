# FilteringNormNESTA
Matlab implementation of Filtering norm with NESTA
Implementation of the **Isotropic and Anisotropic Filtering Norm minimization**, from the paper: https://www.researchgate.net/profile/Mylene_Farias/publication/340769023_Isotropic_and_anisotropic_filtering_norm-minimization_A_generalization_of_the_TV_and_TGV_minimizations_using_NESTA/links/5ea703c345851553fab34738/Isotropic-and-anisotropic-filtering-norm-minimization-A-generalization-of-the-TV-and-TGV-minimizations-using-NESTA.pdf

Based on the Matlab code of NESTA: 
https://statweb.stanford.edu/~candes/software/nesta/
If the use of this code generate paper, please, cite both papers:

@article{lima2020isotropic,
  title={Isotropic and anisotropic filtering norm-minimization: A generalization of the TV and TGV minimizations using NESTA},
  author={Lima, Jonathan A and da Silva, Felipe B and von Borries, Ricardo and Miosso, Cristiano J and Farias, Myl{\`e}ne CQ},
  journal={Signal Processing: Image Communication},
  pages={115856},
  year={2020},
  publisher={Elsevier}
}

@article{becker2011nesta,
  title={NESTA: A fast and accurate first-order method for sparse recovery},
  author={Becker, Stephen and Bobin, J{\'e}r{\^o}me and Cand{\`e}s, Emmanuel J},
  journal={SIAM Journal on Imaging Sciences},
  volume={4},
  number={1},
  pages={1--39},
  year={2011},
  publisher={SIAM}
}


We build this version over the NESTA_v1.1 implementation (https://statweb.stanford.edu/~candes/software/nesta/NESTA_v1.1.zip)
Refered as NESTA_v2.0.

## The NESTA.m:
Solves the filtering norm L1 and/or L2 minimization problem under a quadratic constraint using the Nesterov algorithm, with continuation:

     min_x iaFN(x) s.t. ||y - Ax||_2 <= delta
 
 Continuation is performed by sequentially applying Nesterov's algorithm with a decreasing sequence of values of  mu0 >= mu >= muf.
This version adds the following features:
*Isotropic and anisotropic norms
*Filtering norms
*A demo for isotropic and anisotropic filtering norms for MRI radial reconstruction. 

For more details, see the NESTA.m, Core_Nesterov.m, and DemoFilteringNormMRI.m files.


## The NESTA_UP.m:
Solves the unconstrained isotropic filtering norm minimization problem under a quadratic constraint using the Nesterov algorithm, with continuation:

     min_x lambda iFN(x) + 1/2 ||y - Ax||_2
 
 Continuation is performed by sequentially applying Nesterov's algorithm with a decreasing sequence of values of  mu0 >= mu >= muf.
This version adds the following features:
*Filtering norms
*A demo for isotropic and anisotropic filtering norms for MRI radial reconstruction. 

For more details, see the NESTA_UP.m, Core_Nesterov_UP.m, and DemoFilteringNormMRIUP.m files.

%----------------------------------------------------------------------------------------
 Created: February 2009
 Modified (version 1.0): May 2009, Jerome Bobin and Stephen Becker, Caltech
 Modified (version 1.1): Nov 2009, Stephen Becker, Caltech
 Modified (version 2.0): Oct 2018--May 2020, Jonathan Lima, UnB/UTEP
 











