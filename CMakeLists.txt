cmake_minimum_required(VERSION 3.14.0)
project(PE_Fortran
        VERSION 0.0.1
        DESCRIPTION "Project Euler solutions written by modern Fortran"
        LANGUAGE Fortran)

# Set compiler and compiler flags
if(CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
    add_compile_options(-ffast-math)
    if(CMAKE_Fortran_COMPILER_VERSION VERSION_GREATER_EQUAL 8.0)
        add_compile_options(-std=f2018)
    else()
        add_compile_options(-std=f2008ts)
    endif()
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
    add_compile_options(-xHost)
    add_compile_options(-ipo)
    if(CMAKE_Fortran_COMPILER_VERSION VERSION_LESS 18.0)
        add_compile_options(-stand f15)
    else()
        add_compile_options(-stand f18)
    endif()
endif()

# Set Fortran Preprocessor
find_program(FYPP fypp)
if(NOT FYPP)
    message(FATAL_ERROR "Preprocessor fypp not found!")
endif()

# Set the number of problems to be solved
if(DEFINED NUM_PROB)
    set(NUM_PROB ${NUM_PROB})
else()
    set(NUM_PROB "60")
endif()
