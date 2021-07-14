program main

  call learning_objs()

end program main

subroutine learning_objs

  use iso_fortran_env

  use learning_fortran_objs

  implicit none

  real(real64) :: r, m, q, x
  type(Particle) :: p
  type(Electron) :: e

  r = 2.4e-10
  m = 9.109e-31
  q = 1.602e-19

  x = 4

  p = Particle(r, m)
  e = Electron(r, m, q)

  ! print *, p%radius, p%mass
  ! print *, e%radius, e%mass, e%charge

  ! call p%cross_area()
  ! call e%cross_area()

  ! print *, p%electric_potential(x)

end subroutine learning_objs
