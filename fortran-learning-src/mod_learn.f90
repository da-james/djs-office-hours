module mod_learn

    use iso_fortran_env

    implicit none

    contains

    function data_types()
        integer(int64) :: i, k
        real(real64) :: a, b
        complex :: c
        character(len=12) :: phrase
        character :: letter

        i = 1
        k = 4

        a = 3
        b = -4.

        c = (1, 5)

        phrase = "hello world!"
        letter = "h"

        print *, i, k
        print *, a, b
        print *, c
        print *, phrase
        print *, letter

    end function

end module


program main

    use mod_learn, only : data_types

    implicit none

    print *, data_types()

end program