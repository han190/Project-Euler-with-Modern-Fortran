submodule(euler_interface_m) euler_prob_0008_m
    implicit none

contains

    module character(len=20) function euler0008()
        write (euler0008, "(i20)") ans()
    end function euler0008

    integer(int64) function ans()
        use euler_data_m, only: get_euler_data_0008
        implicit none

        integer(int64) :: long_int(1000), i, s, tmp
        character(len=:), allocatable :: euler_data(:)

        call get_euler_data_0008(euler_data)
        do i = 1, 20
            s = (i - 1)*50 + 1
            read (euler_data(i), "(50(i1))") long_int(s:s + 49)
        end do

        tmp = 0
        do i = 1, 988
            if (product(long_int(i:i + 12)) > tmp) then
                tmp = product(long_int(i:i + 12))
            end if
        end do
        ans = tmp
    end function ans

end submodule euler_prob_0008_m
