program main

    use mod_learn, only : basics

    implicit none

    logical :: flag

    flag = basics()

    print *, flag

end program