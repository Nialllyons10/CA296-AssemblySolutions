.data
smallest DWORD 0
biggest DWORD 0
count DWORD 0 

.code
	minmaxdiff:
		push ebp
		mov ebp,esp
		mov ebx, [ebp + 8]
		mov ecx, [ebp + 12]
		mov eax,[ecx]
		mov smallest,eax
		mov biggest, eax

		startLoop:
			cmp ebx,count
			je return
			mov eax,4
			mul count
			add eax,ecx
			mov eax, [eax]
			cmp eax,smallest
			jg skipSmall
			mov smallest,eax

		skipSmall:
			cmp eax,biggest
			jl skipBig
			mov biggest,eax
		
		skipBig:
			inc count
			jmp startLoop

		return:
			mov eax,biggest
			sub eax,smallest
			pop ebp
			ret 8

	end
