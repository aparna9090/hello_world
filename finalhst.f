      program final_hst
      real::xI(2837),xV(2837),yI(2837),yV(2837)
      real::mI(2837),mV(2837),count1=0.0,sub
      open(unit=3, file="MATCHUP.XYMEEE.F814W")
      do i = 1, 1658
       read(3,*), xI(i),yI(i),mI(i)
       end do
       close(3)
        open(unit=4, file="MATCHUP.XYMEEE.F555W")
        do i = 1, 1658
       read(4,*), xV(i),yV(i),mV(i)
       end do
       close(4)
      open(unit=5,file="finalhst.txt")
      open(unit=6,file="list.txt")
      do i=1,1658
      sub = (mV(i)-mI(i))
      if (abs(xI(i)-xV(i)).le. 3) then
      if (abs(yI(i)-yV(i)).le. 3) then
      if (abs(mI(i)-mV(i)).le. 5) then
       count1 = count1+1.0
      write(5,*),i,xI(i),xV(i),yI(i),yV(i),mI(i),mV(i),sub
      else
      write(6,*),i,xI(i),xV(i),yI(i),yV(i),mI(i),mV(i),sub
      endif
      else
      write(6,*),i,xI(i),xV(i),yI(i),yV(i),mI(i),mV(i),sub
      endif
      else
      write(6,*),i,xI(i),xV(i),yI(i),yV(i),mI(i),mV(i),sub
      endif
      end do
      close(5)
      close(6)
      write(*,*),count1
      end program
