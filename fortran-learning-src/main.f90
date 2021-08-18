program main

  ! call sendrecv()
  ! call sumvec()
  call integrate()

end program







subroutine sendrecv()

  use mpi

  implicit none

  integer process_rank, size_of_cluster, ierr, message

  ! initialize MPI
  call mpi_init(ierr)
  call mpi_comm_size(mpi_comm_world, size_of_cluster, ierr)
  call mpi_comm_rank(mpi_comm_world, process_rank, ierr)

  message = 0

  ! send a message
  if(process_rank == 0) then

     message = 42
     call mpi_send(message, 1, mpi_int, 1, 1, mpi_comm_world, ierr)
     print *, "process:", process_rank, "sent message:", message

  else if(process_rank == 1) then
     ! receive a message

     call mpi_recv(message, 1, mpi_int, 0, 1, mpi_comm_world, mpi_status_ignore, ierr)
     print *, "process:", process_rank, "received message:", message

  else

     print *, "process:", process_rank, "received message:", message

  endif

  call mpi_finalize(ierr)

end subroutine sendrecv














subroutine sumvec()

  use mpi

  implicit none

  integer, parameter :: max_rows = 10000000
  integer, parameter :: send_data_tag = 2001
  integer, parameter :: return_data_tag = 2002

  integer :: my_id, root_process, ierr, status(mpi_status_size), sender
  integer :: num_procs, an_id, num_rows_to_receive, num_rows_received, i
  integer :: start_row, end_row
  integer :: avg_rows_per_process, num_rows, num_rows_to_send

  real vector(max_rows), vector2(max_rows), partial_sum, sum

  root_process = 0

  call mpi_init(ierr)

  call mpi_comm_size(mpi_comm_world, num_procs, ierr)
  call mpi_comm_rank(mpi_comm_world, my_id, ierr)

  if(my_id == root_process) then

     print *, "please enter the number of numbers to sum:"
     read *, num_rows

     if(num_rows > max_rows) stop "too many numbers"

     avg_rows_per_process = num_rows / num_procs

     do i = 1, num_rows
        vector(i) = float(i)
     enddo

     do an_id = 1, num_procs-1

        start_row = an_id*avg_rows_per_process + 1
        end_row = start_row + avg_rows_per_process - 1

        if(an_id == (num_procs - 1)) end_row = num_rows
        num_rows_to_send = end_row - start_row + 1

        call mpi_send(num_rows_to_send, 1, mpi_int, an_id, &
             send_data_tag, mpi_comm_world, ierr)
        call mpi_send(vector(start_row), num_rows_to_send, mpi_real, an_id, &
             send_data_tag, mpi_comm_world, ierr)

     end do

     sum = 0
     do i = 1, avg_rows_per_process
        sum = sum + vector(i)
     end do

     print *, "sum", sum, "calculated by root process"

     do an_id = 1, num_procs - 1

        call mpi_recv(partial_sum, 1, mpi_real, mpi_any_source, mpi_any_tag, &
             mpi_comm_world, status, ierr)

        sender = status(mpi_source)
        print *, "partial sum", partial_sum, "returned from process", sender

        sum = sum + partial_sum

     enddo

     print *, "grand total:", sum

  else

     call mpi_recv(num_rows_to_receive, 1, mpi_int, root_process, mpi_any_tag, &
          mpi_comm_world, status, ierr)
     call mpi_recv(vector2, num_rows_to_receive, mpi_real, root_process, mpi_any_tag, &
          mpi_comm_world, status, ierr)

     num_rows_received = num_rows_to_receive

     partial_sum = 0
     do i = 1, num_rows_received
        partial_sum = partial_sum + vector2(i)
     enddo

     call mpi_send(partial_sum, 1, mpi_real, root_process, &
          return_data_tag, mpi_comm_world, ierr)

  endif

  call mpi_finalize(ierr)
  stop

end subroutine sumvec

subroutine integrate()

  use mpi

  implicit none

  real, parameter :: pi = 3.141592654
  integer :: my_id, root_process, num_procs, ierr, num_intervals, i
  double precision :: rect_width, area, sum, x_middle, partial_sum
  integer :: status(mpi_status_size)

  root_process = 0

  call mpi_init(ierr)

  call mpi_comm_rank(mpi_comm_world, my_id, ierr)
  call mpi_comm_size(mpi_comm_world, num_procs, ierr)

  if(my_id == root_process) then

     print *, "please enter number of intervals to interpolate:"
     read *, num_intervals

  endif

  call mpi_bcast(num_intervals, 1, mpi_integer, root_process, &
       mpi_comm_world, ierr)

  rect_width = pi / num_intervals

  partial_sum = 0.0
  do i = (my_id + 1), num_intervals, num_procs

     x_middle = (i - 0.5) * rect_width
     area = dsin(x_middle) * rect_width
     partial_sum = partial_sum + area

  enddo
  print *, "proc", my_id, "computes:", partial_sum

  call mpi_reduce(partial_sum, sum, 1, mpi_double_precision, &
       mpi_sum, root_process, mpi_comm_world, ierr)

  if(my_id == root_process) then
     print *, "the integral is", sum
  endif

  call mpi_finalize(ierr)
  stop

end subroutine integrate
