.data 
count DWORD 0
total DWORD 0

.code 
  sum: 
		push ebp 
		mov ebp, esp 
		mov ebx, [ebp + 8]
		mov ecx, [ebp + 12]

		startLoop: 
			cmp eax, count
			je finish
 
			mov eax, 4
			mul count
			add eax, ecx
			mov eax, [eax]
			add total, eax
			inc count
			jmp startLoop

		finish: 
			mov eax, total 
			pop ebp 
			ret 8
  end
