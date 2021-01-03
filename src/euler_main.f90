program main
    use iso_fortran_env, only: compiler_version
    use euler_prob_api_m
    implicit none

    integer :: index_
    character(len=100) :: arg_val(1:2)

    if (command_argument_count() > 2) then
        print "(a)", "SYNTAX ERROR: -h or --help for further information."
        stop
    end if

    index_ = 1
    read_argument_loop: do
        if (len_trim(arg_val(index_)) == 0 .or. index_ >= 2) then
            exit read_argument_loop
        end if

        call get_command_argument(index_, arg_val(index_))
        index_ = index_ + 1
    end do read_argument_loop

    select case (trim(arg_val(1)))
    case ("-h", "--help")
        call get_help()
        stop
    case ("-ca", "--compute-all")
        call compute_all("ANSWER.md")
    case default
        print "(a)", "SYNTAX ERROR: -h or --help for further information."
        stop
    end select

contains

    subroutine get_help()
        character(len=3) :: a

        a = "(a)"
        print a, "Project Euler with Modern Fortran"
        print a, "Syntax:"
        print a, "./pe-fortran -h/--help"
        print a, "./pe-fortran -ca/--compute-all"
    end subroutine get_help

    subroutine compute_all(filename)
        character(len=*), intent(in) :: filename
        character(len=20) :: ans(nop)
        character(len=1), parameter :: space = " ", dash = "-"
        character(len=20), parameter :: failed = repeat(space, 19)//"x"
        character(len=7), parameter :: c_aligned = "|:"//repeat(dash, 4)//":"
        real :: t_f, t_i, tspan(nop), tsum = 0., nslv = 0.

        type(euler_probs_t) :: probs(nop)
        integer :: i

        call euler_init(probs)

        open (1, file=filename)
        write (1, "(a)") "# Project Euler with Modern Fortran"//new_line("a")
        write (1, "(a)") "## Compilers"//new_line("a")
        write (1, "(a)") compiler_version()//new_line("a")
        write (1, "(a)") "## Answers and Benchmarks"//new_line("a")
        write (1, "(a)") "|Prob|Answer|Tspan(s)|T/Ttot(%)|"
        write (1, "(a)") repeat(c_aligned, 4)//"|"

        do i = 1, nop
            call cpu_time(t_i)
            ans(i) = probs(i)%ans()
            call cpu_time(t_f)
            tspan(i) = t_f - t_i
        end do

        tsum = sum(tspan, dim=1)
        nslv = real(count(ans /= failed, dim=1))

        do i = 1, nop
            write (1, 1120) i, ans(i), tspan(i), tspan(i)/tsum*100.
        end do

        write (1, "(a)") new_line("a")//"## Summary"//new_line("a")
        write (1, "(a)") "|Benchmarks|Results|"
        write (1, "(a)") repeat(c_aligned, 2)//"|"
        write (1, 1121) int(nslv)
        write (1, 1122) "|Total time spent|", tsum, "(s)|"
        write (1, 1122) "|Average time spent per problem|", tsum/nslv, "(s)|"

        write (*, *)
        write (*, "(a)") "Quick results:"
        write (*, "(a20, i10)") "Problems solved:    ", int(nslv)
        write (*, "(a20, f10.6, a)") "Total time spent:   ", tsum, "(s)"
        write (*, "(a20, f10.6, a)") "Time spent/problem: ", tsum/nslv, "(s)"

1120    format("|", i6, "|", a20, "|", f10.6, "|", f9.4, "%|")
1121    format("|Problems solved|", i4, "|")
1122    format(a, f10.6, a)

        close (1)
    end subroutine compute_all
end program main