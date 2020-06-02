build-yaFyaml-stack
===================

Overview
--------

This CMake project aims to build and test the following dependency tree:

```
yaFyaml
|-- gFTL-shared
    |-- gFTL
```
where

* [yaFyaml] is a modern Fortran YAML API,
* [gFTL-shared] contains common gFTL containers of Fortran intrinsic types.
* [gFTL] is the Goddard Fortran Template Library, and

This is a first experiment with CMake superbuilds. The idea is
to use the [Developer Build] pattern so that the superbuild is
useful to the upstream projects.  As such, the packages are all
git submodules so obtaining a useful copy of the current project
requires a recursive clone using the `git` command below.

Downloading, Building, and Testing
----------------------------------
```bash
git clone --recursive git@github.com:sourceryinstitute/build-yaFyaml-stack
mkdir -p build-yaFyaml-stack/build
cd build-yaFyaml-stack/build
export FC=gfortran
cmake ..
make -j -8
ctest
```

[yaFyaml]: https://github.com:Goddard-Fortran-Ecosystem/yaFyaml
[gFTL]: https://github.com:Goddard-Fortran-Ecosystem/gFTL
[gFTL-shared]: https://github.com:Goddard-Fortran-Ecosystem/gFTL-shared
[Developer Build]: https://blog.kitware.com/cmake-superbuilds-git-submodules
