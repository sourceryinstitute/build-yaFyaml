build-yaFyaml-stack
===================

This CMake project aims to build the following dependency tree:

[yaFyaml] 
|
|__ [gftl]
    |
    |__ [gftl-shared]


This is a first experiment with CMAke superbuilds. The initial
thought is to use the [Developer Build] pattern so that the
superbuild is useful to the upstream projects.  As such, the
packages built are all submodules and obtaining a useful copy
of the current project requires a recursive clone.

Downloading
-----------
```bash
git clone --recursive git@github.com:sourceryinstitute/build-yaFyaml-stack
```

[yaFyaml]: https://github.com:Goddard-Fortran-Ecosystem/yaFyaml
[gftl]: https://github.com:Goddard-Fortran-Ecosystem/gftl
[gftl-shared]: https://github.com:Goddard-Fortran-Ecosystem/gftl-shared
[Developer Build]: https://blog.kitware.com/cmake-superbuilds-git-submodules
