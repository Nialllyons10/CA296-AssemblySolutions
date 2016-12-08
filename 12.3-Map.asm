EXTERNDEF sumArray:near
Comment @
	int sumArray(Int[] array, int size)
	{
		int sum = 0
		for(int i = 0, i < size, i++)
		{
			
			sum =+ map(array[i]);
		}
		return sum;
	}

@

;
; Data & Code
;
.data
total DWORD 0


.code
	main:nop
      sumArray:
          push ebp
          mov ebp, esp
          mov ecx, 0
      start:
          cmp ecx, [ebp+12]
          jae finish		

          mov eax, ecx
          sal eax, 2
          add eax, [ebp+8]
          mov ebx, [eax]
          invoke map, ebx
          add total, eax
          inc ecx
          jmp start

      finish: 
          mov eax, total
          pop ebp
          ret 8

		
   end 
