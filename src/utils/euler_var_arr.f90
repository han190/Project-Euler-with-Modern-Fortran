module euler_var_arr_m 
    implicit none  

    type :: var_arr_t 
        integer, allocatable, dimension(:) :: arr
    end type var_arr_t 
    
end module euler_var_arr_m