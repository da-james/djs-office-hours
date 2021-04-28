program main

  use iso_fortran_env

    use mod_learn, only : basics

    implicit none

    logical :: flag
    integer(int64), parameter :: N = 3
    integer(int64) :: ipiv, info
    complex(real64) :: M(N, N)

    flag = basics()
    print *, flag

    M(:,:) = 0
    M(1,1) = 1
    M(2,2) = 1
    M(3,3) = 1
    print *,"1", M
    call ZGETRF(N, N, M, N, ipiv, info)
    print *,"2", M

end program
