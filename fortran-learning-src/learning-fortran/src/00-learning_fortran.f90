module learning_fortran_objs

  use iso_fortran_env

  implicit none

  real(real64), parameter :: pi = 3.14159
  real(real64), parameter :: e0 = 8.854188e-12

  type, public :: Particle
     real(real64) :: radius
     real(real64) :: mass
   contains
     procedure :: cross_area => ca
  end type Particle

  type, extends(Particle) :: Electron
     real(real64) :: charge
   contains
     procedure :: electric_potential => ep
  end type Electron

contains

  subroutine ca(this)
    ! arguments
    class(Particle), intent(in) :: this

    print *, pi * (this%radius + this%radius)**2

  end subroutine ca

  real(real64) function ep(this, radius) &
       result(V)
    ! arguments
    class(Electron), intent(in) :: this
    real(real64), intent(in) :: radius

    V = 1./(4.*pi*e0) * this%charge / radius

  end function ep

end module learning_fortran_objs
