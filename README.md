# Stochastic PDHG with Arbitrary Sampling and Imaging Applications

This package contains an [ODL](https://github.com/odlgroup/odl) compatible implementation of the <b>Stochastic Primal-Dual Hybrid Gradient algorithm (SPDHG)</b> proposed and analyzed in [1]. It is useful to solve problems of the form

<p align="center"><img src="http://latex.codecogs.com/gif.latex?%5Cmin_x%20%5Csum_%7Bi%3D1%7D%5En%20f_i(A_i%20x)%20%2B%20g(x)" border="0"/></p>

where <img src="http://latex.codecogs.com/gif.latex?f_i" border="0"/> and <img src="http://latex.codecogs.com/gif.latex?g" border="0"/> are closed, proper and convex functionals and <img src="http://latex.codecogs.com/gif.latex?A_i" border="0"/> are linear operators.

SPDHG is a direct generalization of the popular Primal-Dual Hybrid Gradient algorithm (PDHG) also known as the Chambolle-Pock algorithm [2, 3].

[1] Chambolle, A., Ehrhardt, M. J., Richtárik, P., & Schönlieb, C.-B. (2018). Stochastic Primal-Dual Hybrid Gradient Algorithm with Arbitrary Sampling and Imaging Applications. SIAM Journal on Optimization, 28(4), 2783–2808. https://doi.org/10.1007/s10851-010-0251-1 http://arxiv.org/abs/1706.04957

## Getting started

There are many ways how to run the examples of this code. Assume you have installed the dependencies as below. Then one option how you can run this code is the following based on spyder. Open a file, e.g. [example_rof.py](example_rof.py) and execute the cells one by one.

## Examples

The four numerical examples in [1] are:

* [example_pet.py](example_pet.py) PET reconstruction (from simulated data) with total variation regularization where the algorithm is proven to converge with rate <img src="http://latex.codecogs.com/gif.latex?O(1/k)" border="0"/> in the partial primal-dual gap.
* [example_rof.py](example_rof.py) Primal acceleration for ROF denoising (Gaussian noise; squared L2-norm + total variation) where the algorithm is proven to converge with rate <img src="http://latex.codecogs.com/gif.latex?O(1/k^2)" border="0"/> in squared norm to the primal solution.
* [example_deblurring.py](example_deblurring.py) Dual acceleration where the dual iterates converge in squared norm with rate <img src="http://latex.codecogs.com/gif.latex?O(1/k^2)" border="0"/> to the dual solution. The problem at hand is deblurring with total variation regularization and a Poisson noise model.
* [example_pet_strongly_convex.py](example_pet_strongly_convex.py) Linear convergence of SPDHG for PET reconstruction with a strongly convex total variation-type regularization.

The PET examples are based on [ASTRA](https://www.astra-toolbox.com/) to compute the line integrals in the forward operator.

A few teasers from [example_pet.py](example_pet.py). The randomized SPDHG (green) are much faster than the deterministic PDHG and another randomized algorithm [4].

<p align="center"><img src="https://github.com/mehrhardt/spdhg/blob/master/example_pet_250x250_output1.png" width="50%" border="0"/></p>

The same can be observed visually. Both images are obtained with the same number of x-ray transform evaluations: PDHG (left) and SPDHG (right).

<p align="center"><img src="https://github.com/mehrhardt/spdhg/blob/master/pdhg_5.png" width="20%" border="0"/>
<img src="https://github.com/mehrhardt/spdhg/blob/master/spdhg50_250.png" width="20%" border="0"/></p>

## Installation
### I) Installation of dependencies

1) On linux based systems all dependencies can be easily installed via [conda](https://conda.io/docs/). The following code creates a new environment `env_spdhg` with the necessary dependencies.

```	
conda create --name env_spdhg --file package-list.txt

```

Optional: You can also install more recent versions of all dependencies. The package list in the repository has been created by
```
conda create --name env_spdhg -c conda-forge -c astra-toolbox python=3.5 spyder scikit-image brewer2mpl astra-toolbox
conda install --name env_spdhg pip
conda list --explicit > package-list.txt
```

2) These packages can be activated as
```
source activate env_spdhg
```

### II) Installation of (recent) ODL

1) Clone the ODL repository. 
```
git clone https://github.com/odlgroup/odl.git path/to/odlfolder
```

2) Install (a recent version of) ODL. The code was tested with the highlighted commit. A newer version of ODL might work as well.
```
cd path/to/odlfolder
git checkout 0d85498ac1cbbfd2ca9d6a790beb0fb91e190517
conda install pip
pip install -e .
```

Most of this code will also work with other versions of ODL, e.g. version 0.6.0 which is the most recent version in conda as of July 2018. However, this version does not contain the test images used in this code.

### III) Get SPDHG

1) Clone the SPDHG repository.
```
git clone https://github.com/mehrhardt/spdhg path/to/spdhgfolder
```

2) Either add `path/to/spdhgfolder` to the Python PATH or execute the scripts from `path/to/spdhgfolder`.

## Further usage

SPDHG has been used to reconstruct real clinical PET data from the Siemens Biograph mMR in span 1 in [5, 6].

## References

[1] Chambolle, A., Ehrhardt, M. J., Richtárik, P., & Schönlieb, C.-B. (2018). Stochastic Primal-Dual Hybrid Gradient Algorithm with Arbitrary Sampling and Imaging Applications. SIAM Journal on Optimization, 28(4), 2783–2808. https://doi.org/10.1007/s10851-010-0251-1 http://arxiv.org/abs/1706.04957

[2] Chambolle, A., & Pock, T. (2011). A First-Order Primal-Dual Algorithm for Convex Problems with Applications to Imaging. Journal of Mathematical Imaging and Vision, 40(1), 120–145. http://doi.org/10.1007/s10851-010-0251-1

[3] Pock, T., & Chambolle, A. (2011). Diagonal preconditioning for first order primal-dual algorithms in convex optimization. Proceedings of the IEEE International Conference on Computer Vision, 1762–1769. http://doi.org/10.1109/ICCV.2011.6126441

[4] Pesquet, J.-C., & Repetti, A. (2015). A Class of Randomized Primal-Dual Algorithms for Distributed Optimization. Retrieved from http://arxiv.org/abs/1406.6404

[5] Ehrhardt, M. J., Markiewicz, P. J., Richtárik, P., Schott, J., Chambolle, A., & Schönlieb, C.-B. (2017). Faster PET Reconstruction with a Stochastic Primal-Dual Hybrid Gradient Method. In Proceedings of SPIE (Vol. 10394, pp. 1–12). San Diego. http://doi.org/10.1117/12.2272946

[6] Ehrhardt, M. J., Markiewicz, P., & Schönlieb, C.-B. (2018). Faster PET Reconstruction with Non-Smooth Priors by Randomization and Preconditioning. Arxiv. Retrieved from http://arxiv.org/abs/1808.07150