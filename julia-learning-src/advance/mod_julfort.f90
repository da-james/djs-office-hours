module mod_julfort

    use iso_fortran_env

    implicit none

contains

    function dot(n, arrx, arry)
        ! arguments
        integer(int64), intent(in) :: n
        real(real64), intent(in) :: arrx(n), arry(n)

        ! returns
        real(real64) :: arrz(n), dot

        arrz(:) = arrx(:)*arry(:)
        dot = sum(arrz)

    end function dot

    subroutine mult_arr(n, arr, x)
        ! arguments
        integer(int64), intent(in) :: n
        real(real64), intent(in out) :: arr(n)
        real(real64), intent(in) :: x

        arr(:) = arr(:) * x + x

    end subroutine mult_arr

end module

module mod_julfort_wrapper

    use iso_c_binding

    use :: mod_julfort

    implicit none

contains

    subroutine mult_arr_wrapper(n, arr, x) bind(C, name="mult_arr")
        ! arguments
        integer(c_long), intent(in) :: n
        real(c_double), intent(in out) :: arr(n)
        real(c_double), intent(in) :: x

        call mult_arr(n, arr, x)

    end subroutine mult_arr_wrapper

end module
