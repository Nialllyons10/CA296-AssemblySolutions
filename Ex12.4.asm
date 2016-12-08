.data
debuge	DWORD	0
.code
	main:nop

		;[ebp+8] = index_2
		;[ebp+12] = index_1
		;[ebp+16] = 0
		;[ebp+20] = addr
		;[ebp-4] = 0
		;[ebp-8] = i
		;[ebp-12] = elem1
		;[ebp-16] = elem2
		;[ebp-20] = tmp

		swapIndex:
			push ebp
			mov ebp,esp
			sub esp,20
			mov ebx,0
			mov [ebp-4],ebx
			mov [ebp-8],ebx
			mov [ebp-12],ebx
			mov [ebp-16],ebx
			mov [ebp-20],ebx
			;mov ebx,[ebp+20]
			mov ecx,[ebp+12]
			mov edx,[ebp+8]

		firstInt:
			mov ebx,0
			cmp [ebp-8],ecx    ;index_1
			je intVal
			inc dword ptr [ebp-8]
			jmp firstInt

		secInt:
			cmp [ebp-8],edx    ;index2
			je intVal
			inc dword ptr [ebp-8]
			jmp secInt
			

		intVal:
			mov eax,[ebp-8]
			shl eax,2
			add eax,[ebp+20]
			mov [ebp-20],eax
			mov eax,[eax]
			cmp [ebp-12],ebx
			je moveIntoFirst
			cmp [ebp-16],ebx
			je moveIntoSecond

		moveIntoFirst:
			mov ecx,[ebp-20]
			mov [ebp-12],eax
			mov ebx,0
			mov [ebp-8],ebx
			jmp secInt

		moveIntoSecond:
			mov edx,[ebp-20]
			mov [ebp-16],eax

		swapVal:
			mov ebx,[ebp-12]
			mov eax,[ebp-16]
			cmp ebx,eax
			jg endLoop

			mov [edx],ebx
			mov [ecx],eax

		endLoop:
			mov esp,ebp
			pop ebp
			ret 16

	end
