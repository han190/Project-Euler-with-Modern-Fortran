# Yet another Project Euler solutions...

[Project Euler](https://projecteuler.net/about) is a problem set. I solve PE problems to polish my Fortran skills, expand my math knowledge base and most importantly FOR FUN. If you are looking for the same things, check it out!

## Getting Started

### Prerequistes

You will a Fortran compiler ([gfortran](https://gcc.gnu.org/wiki/GFortran) or [ifort](https://software.intel.com/content/www/us/en/develop/documentation/fortran-compiler-oneapi-dev-guide-and-reference/top.html)) and the [Fortran Package Manager (fpm)](https://github.com/fortran-lang/fpm) to compile and execute this project. To install them (assuming you are on Ubuntu and have [conda](https://docs.conda.io/en/latest/) installed)

```bash
sudo apt install gfortran
conda create -n fpm fpm
conda activate fpm
```

For a minimum installation of the Intel Fortran compiler, take a look at [this discussion](https://fortran-lang.discourse.group/t/intel-releases-oneapi-toolkit-free-fortran-2018/471/35?u=han190)!

### Build with fpm

To build this project with fpm, navigate to the root directory of this repo and

```bash
fpm build --profile release
```

and run the project with

```bash
fpm run --profile release PE-Fortran -- -a 50 -d $(realpath ./data/)
```

You could also install it by (the default `PREFIX` is `$HOME/.local/bin`)

```bash
fpm install --profile release
```

## Usage

```
$ PE-Fortran --help
PE Fortran Solution
Arguments:
   -v, or --version                    Version.
   -a N, or --all N                    Compute problem 1 to N.
   -n N, or --problem-number N         Compute problem N.
   -d /path/to/data/, or 
    --data-directory /path/to/data/    Path to data.
   -h, --help                          Pop up this message.

Usage:
(1) Compute problem 1 to 50:
   ./PE-Fortran -a 50 -d /path/to/data/
(2) Compute problem 50:
   ./PE-Fortran -n 50 -d /path/to/data/

Tips:
*  All the data required are stored in the directory:

   /path/to/the/project/PE-Fortran/data/

   The argument '--data-directory' requires an absolute
   path but you can use
   ./PE-Fortran -n 50 -d $(realpath /relative/data/path/)

```

For example, to calculate the first 50 problems

```bash
./PE-Fortran --all 50 --data-directory $(realpath .)
# ./PE-Fortran -a 50 -d $(realpath .) # The short way
# .\PE-Fortran.exe --all 50 --data-directory $(Resolve-Path .) # Powershell
```

The generated `answer.md` will look something like [this](https://github.com/han190/PE-Fortran/tree/master/answer/answer.md).

## A todo list

Here is what I plan to do in the future. (Not likely to be done recently cuz I am kinda busy...)

- [x] Organize folders, use Shell scripts to compile codes.
- [x] Use a build tool, for example Meson to wrap all the codes. 
  - PS: Crappy but I did it with Meson.
- [x] Use a Fortran preprocessor to simplify my code.
- [ ] Write a documentation to clearly explain the algorithms, Fortran features, or anything that is interesting for each question.
- [x] Add version control.
- [ ] When I finish 75 problems, write a command line interface. When I finish 100 problems (if that is possible), write a GUI.
