
main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_Z10InitParamsiPPc>:
_Z10InitParamsiPPc():
/home/omkar/courses/ece759/project/AVX/Params.h:119

void Usage(char *name);
void ParseCommandLine(int argc, char* argv[]);

void InitParams(int argc, char* argv[])
{
       0:	55                   	push   rbp
       1:	48 89 e5             	mov    rbp,rsp
       4:	48 83 ec 20          	sub    rsp,0x20
       8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
       b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
/home/omkar/courses/ece759/project/AVX/Params.h:120
    params.nWidth = 1024*8;
       f:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x2000        # 19 <_Z10InitParamsiPPc+0x19>
      16:	20 00 00 
/home/omkar/courses/ece759/project/AVX/Params.h:121
    params.nHeight = 1024*8;
      19:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x2000        # 23 <_Z10InitParamsiPPc+0x23>
      20:	20 00 00 
/home/omkar/courses/ece759/project/AVX/Params.h:122
    params.nFilterWidth = 17;
      23:	c7 05 00 00 00 00 11 	mov    DWORD PTR [rip+0x0],0x11        # 2d <_Z10InitParamsiPPc+0x2d>
      2a:	00 00 00 
/home/omkar/courses/ece759/project/AVX/Params.h:123
    params.nIterations = 3;
      2d:	c7 05 00 00 00 00 03 	mov    DWORD PTR [rip+0x0],0x3        # 37 <_Z10InitParamsiPPc+0x37>
      34:	00 00 00 
/home/omkar/courses/ece759/project/AVX/Params.h:125

    params.bCPUTiming = true;
      37:	c6 05 00 00 00 00 01 	mov    BYTE PTR [rip+0x0],0x1        # 3e <_Z10InitParamsiPPc+0x3e>
/home/omkar/courses/ece759/project/AVX/Params.h:127

    ParseCommandLine(argc, argv);
      3e:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
      42:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
      45:	48 89 d6             	mov    rsi,rdx
      48:	89 c7                	mov    edi,eax
      4a:	e8 00 00 00 00       	call   4f <_Z10InitParamsiPPc+0x4f>
/home/omkar/courses/ece759/project/AVX/Params.h:129

    params.nInWidth = params.nWidth + (params.nFilterWidth-1);
      4f:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 55 <_Z10InitParamsiPPc+0x55>
      55:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 5b <_Z10InitParamsiPPc+0x5b>
      5b:	83 ea 01             	sub    edx,0x1
      5e:	01 d0                	add    eax,edx
      60:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 66 <_Z10InitParamsiPPc+0x66>
/home/omkar/courses/ece759/project/AVX/Params.h:130
    params.nInHeight = params.nHeight + (params.nFilterWidth-1);
      66:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 6c <_Z10InitParamsiPPc+0x6c>
      6c:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 72 <_Z10InitParamsiPPc+0x72>
      72:	83 ea 01             	sub    edx,0x1
      75:	01 d0                	add    eax,edx
      77:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 7d <_Z10InitParamsiPPc+0x7d>
/home/omkar/courses/ece759/project/AVX/Params.h:132

    params.ompThreads.push_back(1);
      7d:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
      84:	48 8d 45 fc          	lea    rax,[rbp-0x4]
      88:	48 89 c6             	mov    rsi,rax
      8b:	bf 00 00 00 00       	mov    edi,0x0
      90:	e8 00 00 00 00       	call   95 <_Z10InitParamsiPPc+0x95>
/home/omkar/courses/ece759/project/AVX/Params.h:133
    params.nOmpRuns = params.ompThreads.size();
      95:	bf 00 00 00 00       	mov    edi,0x0
      9a:	e8 00 00 00 00       	call   9f <_Z10InitParamsiPPc+0x9f>
      9f:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # a5 <_Z10InitParamsiPPc+0xa5>
/home/omkar/courses/ece759/project/AVX/Params.h:134
}
      a5:	c9                   	leave  
      a6:	c3                   	ret    

00000000000000a7 <_Z16ParseCommandLineiPPc>:
_Z16ParseCommandLineiPPc():
/home/omkar/courses/ece759/project/AVX/Params.h:137

void ParseCommandLine(int argc, char* argv[])
{
      a7:	55                   	push   rbp
      a8:	48 89 e5             	mov    rbp,rsp
      ab:	41 54                	push   r12
      ad:	53                   	push   rbx
      ae:	48 83 ec 20          	sub    rsp,0x20
      b2:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
      b5:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
/home/omkar/courses/ece759/project/AVX/Params.h:138
    for (int i = 1; i < argc; ++i)
      b9:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
      c0:	e9 1f 03 00 00       	jmp    3e4 <_Z16ParseCommandLineiPPc+0x33d>
/home/omkar/courses/ece759/project/AVX/Params.h:140
    {
        switch (argv[i][1])
      c5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
      c8:	48 98                	cdqe   
      ca:	48 c1 e0 03          	shl    rax,0x3
      ce:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
      d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
      d5:	48 83 c0 01          	add    rax,0x1
      d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
      dc:	0f be c0             	movsx  eax,al
      df:	83 e8 63             	sub    eax,0x63
      e2:	83 f8 16             	cmp    eax,0x16
      e5:	0f 87 61 02 00 00    	ja     34c <_Z16ParseCommandLineiPPc+0x2a5>
      eb:	89 c0                	mov    eax,eax
      ed:	48 8b 04 c5 00 00 00 	mov    rax,QWORD PTR [rax*8+0x0]
      f4:	00 
      f5:	ff e0                	jmp    rax
/home/omkar/courses/ece759/project/AVX/Params.h:143
        {
        case 'c':
            params.bCPUTiming = false;
      f7:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # fe <_Z16ParseCommandLineiPPc+0x57>
/home/omkar/courses/ece759/project/AVX/Params.h:144
            break;
      fe:	e9 dd 02 00 00       	jmp    3e0 <_Z16ParseCommandLineiPPc+0x339>
/home/omkar/courses/ece759/project/AVX/Params.h:146
        case 'f':
            if (++i < argc)
     103:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
     107:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     10a:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
     10d:	0f 9c c0             	setl   al
     110:	84 c0                	test   al,al
     112:	74 2c                	je     140 <_Z16ParseCommandLineiPPc+0x99>
/home/omkar/courses/ece759/project/AVX/Params.h:148
            {
                sscanf(argv[i], "%u", &params.nFilterWidth);
     114:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     117:	48 98                	cdqe   
     119:	48 c1 e0 03          	shl    rax,0x3
     11d:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     121:	48 8b 00             	mov    rax,QWORD PTR [rax]
     124:	ba 00 00 00 00       	mov    edx,0x0
     129:	be 00 00 00 00       	mov    esi,0x0
     12e:	48 89 c7             	mov    rdi,rax
     131:	b8 00 00 00 00       	mov    eax,0x0
     136:	e8 00 00 00 00       	call   13b <_Z16ParseCommandLineiPPc+0x94>
/home/omkar/courses/ece759/project/AVX/Params.h:156
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     13b:	e9 a0 02 00 00       	jmp    3e0 <_Z16ParseCommandLineiPPc+0x339>
/home/omkar/courses/ece759/project/AVX/Params.h:152
            {
                sscanf(argv[i], "%u", &params.nFilterWidth);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     140:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     143:	48 98                	cdqe   
     145:	48 83 e8 01          	sub    rax,0x1
     149:	48 c1 e0 03          	shl    rax,0x3
     14d:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     151:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     154:	be 00 00 00 00       	mov    esi,0x0
     159:	bf 00 00 00 00       	mov    edi,0x0
     15e:	e8 00 00 00 00       	call   163 <_Z16ParseCommandLineiPPc+0xbc>
     163:	48 89 de             	mov    rsi,rbx
     166:	48 89 c7             	mov    rdi,rax
     169:	e8 00 00 00 00       	call   16e <_Z16ParseCommandLineiPPc+0xc7>
     16e:	be 00 00 00 00       	mov    esi,0x0
     173:	48 89 c7             	mov    rdi,rax
     176:	e8 00 00 00 00       	call   17b <_Z16ParseCommandLineiPPc+0xd4>
/home/omkar/courses/ece759/project/AVX/Params.h:153
                Usage(argv[0]);
     17b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
     17f:	48 8b 00             	mov    rax,QWORD PTR [rax]
     182:	48 89 c7             	mov    rdi,rax
     185:	e8 00 00 00 00       	call   18a <_Z16ParseCommandLineiPPc+0xe3>
/home/omkar/courses/ece759/project/AVX/Params.h:154
                throw;
     18a:	e8 00 00 00 00       	call   18f <_Z16ParseCommandLineiPPc+0xe8>
/home/omkar/courses/ece759/project/AVX/Params.h:158
            }
            break;
        case 'i':
            if (++i < argc)
     18f:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
     193:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     196:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
     199:	0f 9c c0             	setl   al
     19c:	84 c0                	test   al,al
     19e:	74 2c                	je     1cc <_Z16ParseCommandLineiPPc+0x125>
/home/omkar/courses/ece759/project/AVX/Params.h:160
            {
                sscanf(argv[i], "%u", &params.nIterations);
     1a0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     1a3:	48 98                	cdqe   
     1a5:	48 c1 e0 03          	shl    rax,0x3
     1a9:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     1ad:	48 8b 00             	mov    rax,QWORD PTR [rax]
     1b0:	ba 00 00 00 00       	mov    edx,0x0
     1b5:	be 00 00 00 00       	mov    esi,0x0
     1ba:	48 89 c7             	mov    rdi,rax
     1bd:	b8 00 00 00 00       	mov    eax,0x0
     1c2:	e8 00 00 00 00       	call   1c7 <_Z16ParseCommandLineiPPc+0x120>
/home/omkar/courses/ece759/project/AVX/Params.h:168
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     1c7:	e9 14 02 00 00       	jmp    3e0 <_Z16ParseCommandLineiPPc+0x339>
/home/omkar/courses/ece759/project/AVX/Params.h:164
            {
                sscanf(argv[i], "%u", &params.nIterations);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     1cc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     1cf:	48 98                	cdqe   
     1d1:	48 83 e8 01          	sub    rax,0x1
     1d5:	48 c1 e0 03          	shl    rax,0x3
     1d9:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     1dd:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     1e0:	be 00 00 00 00       	mov    esi,0x0
     1e5:	bf 00 00 00 00       	mov    edi,0x0
     1ea:	e8 00 00 00 00       	call   1ef <_Z16ParseCommandLineiPPc+0x148>
     1ef:	48 89 de             	mov    rsi,rbx
     1f2:	48 89 c7             	mov    rdi,rax
     1f5:	e8 00 00 00 00       	call   1fa <_Z16ParseCommandLineiPPc+0x153>
     1fa:	be 00 00 00 00       	mov    esi,0x0
     1ff:	48 89 c7             	mov    rdi,rax
     202:	e8 00 00 00 00       	call   207 <_Z16ParseCommandLineiPPc+0x160>
/home/omkar/courses/ece759/project/AVX/Params.h:165
                Usage(argv[0]);
     207:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
     20b:	48 8b 00             	mov    rax,QWORD PTR [rax]
     20e:	48 89 c7             	mov    rdi,rax
     211:	e8 00 00 00 00       	call   216 <_Z16ParseCommandLineiPPc+0x16f>
/home/omkar/courses/ece759/project/AVX/Params.h:166
                throw;
     216:	e8 00 00 00 00       	call   21b <_Z16ParseCommandLineiPPc+0x174>
/home/omkar/courses/ece759/project/AVX/Params.h:170
            }
            break;
        case 'x':
            if (++i < argc)
     21b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
     21f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     222:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
     225:	0f 9c c0             	setl   al
     228:	84 c0                	test   al,al
     22a:	74 2c                	je     258 <_Z16ParseCommandLineiPPc+0x1b1>
/home/omkar/courses/ece759/project/AVX/Params.h:172
            {
                sscanf(argv[i], "%u", &params.nWidth);
     22c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     22f:	48 98                	cdqe   
     231:	48 c1 e0 03          	shl    rax,0x3
     235:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     239:	48 8b 00             	mov    rax,QWORD PTR [rax]
     23c:	ba 00 00 00 00       	mov    edx,0x0
     241:	be 00 00 00 00       	mov    esi,0x0
     246:	48 89 c7             	mov    rdi,rax
     249:	b8 00 00 00 00       	mov    eax,0x0
     24e:	e8 00 00 00 00       	call   253 <_Z16ParseCommandLineiPPc+0x1ac>
/home/omkar/courses/ece759/project/AVX/Params.h:180
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     253:	e9 88 01 00 00       	jmp    3e0 <_Z16ParseCommandLineiPPc+0x339>
/home/omkar/courses/ece759/project/AVX/Params.h:176
            {
                sscanf(argv[i], "%u", &params.nWidth);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     258:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     25b:	48 98                	cdqe   
     25d:	48 83 e8 01          	sub    rax,0x1
     261:	48 c1 e0 03          	shl    rax,0x3
     265:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     269:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     26c:	be 00 00 00 00       	mov    esi,0x0
     271:	bf 00 00 00 00       	mov    edi,0x0
     276:	e8 00 00 00 00       	call   27b <_Z16ParseCommandLineiPPc+0x1d4>
     27b:	48 89 de             	mov    rsi,rbx
     27e:	48 89 c7             	mov    rdi,rax
     281:	e8 00 00 00 00       	call   286 <_Z16ParseCommandLineiPPc+0x1df>
     286:	be 00 00 00 00       	mov    esi,0x0
     28b:	48 89 c7             	mov    rdi,rax
     28e:	e8 00 00 00 00       	call   293 <_Z16ParseCommandLineiPPc+0x1ec>
/home/omkar/courses/ece759/project/AVX/Params.h:177
                Usage(argv[0]);
     293:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
     297:	48 8b 00             	mov    rax,QWORD PTR [rax]
     29a:	48 89 c7             	mov    rdi,rax
     29d:	e8 00 00 00 00       	call   2a2 <_Z16ParseCommandLineiPPc+0x1fb>
/home/omkar/courses/ece759/project/AVX/Params.h:178
                throw;
     2a2:	e8 00 00 00 00       	call   2a7 <_Z16ParseCommandLineiPPc+0x200>
/home/omkar/courses/ece759/project/AVX/Params.h:182
            }
            break;
        case 'y':
            if (++i < argc)
     2a7:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
     2ab:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     2ae:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
     2b1:	0f 9c c0             	setl   al
     2b4:	84 c0                	test   al,al
     2b6:	74 2c                	je     2e4 <_Z16ParseCommandLineiPPc+0x23d>
/home/omkar/courses/ece759/project/AVX/Params.h:184
            {
                sscanf(argv[i], "%u", &params.nHeight);
     2b8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     2bb:	48 98                	cdqe   
     2bd:	48 c1 e0 03          	shl    rax,0x3
     2c1:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     2c5:	48 8b 00             	mov    rax,QWORD PTR [rax]
     2c8:	ba 00 00 00 00       	mov    edx,0x0
     2cd:	be 00 00 00 00       	mov    esi,0x0
     2d2:	48 89 c7             	mov    rdi,rax
     2d5:	b8 00 00 00 00       	mov    eax,0x0
     2da:	e8 00 00 00 00       	call   2df <_Z16ParseCommandLineiPPc+0x238>
/home/omkar/courses/ece759/project/AVX/Params.h:192
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     2df:	e9 fc 00 00 00       	jmp    3e0 <_Z16ParseCommandLineiPPc+0x339>
/home/omkar/courses/ece759/project/AVX/Params.h:188
            {
                sscanf(argv[i], "%u", &params.nHeight);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     2e4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     2e7:	48 98                	cdqe   
     2e9:	48 83 e8 01          	sub    rax,0x1
     2ed:	48 c1 e0 03          	shl    rax,0x3
     2f1:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     2f5:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     2f8:	be 00 00 00 00       	mov    esi,0x0
     2fd:	bf 00 00 00 00       	mov    edi,0x0
     302:	e8 00 00 00 00       	call   307 <_Z16ParseCommandLineiPPc+0x260>
     307:	48 89 de             	mov    rsi,rbx
     30a:	48 89 c7             	mov    rdi,rax
     30d:	e8 00 00 00 00       	call   312 <_Z16ParseCommandLineiPPc+0x26b>
     312:	be 00 00 00 00       	mov    esi,0x0
     317:	48 89 c7             	mov    rdi,rax
     31a:	e8 00 00 00 00       	call   31f <_Z16ParseCommandLineiPPc+0x278>
/home/omkar/courses/ece759/project/AVX/Params.h:189
                Usage(argv[0]);
     31f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
     323:	48 8b 00             	mov    rax,QWORD PTR [rax]
     326:	48 89 c7             	mov    rdi,rax
     329:	e8 00 00 00 00       	call   32e <_Z16ParseCommandLineiPPc+0x287>
/home/omkar/courses/ece759/project/AVX/Params.h:190
                throw;
     32e:	e8 00 00 00 00       	call   333 <_Z16ParseCommandLineiPPc+0x28c>
/home/omkar/courses/ece759/project/AVX/Params.h:194
            }
            break;
        case 'h':
            Usage(argv[0]);
     333:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
     337:	48 8b 00             	mov    rax,QWORD PTR [rax]
     33a:	48 89 c7             	mov    rdi,rax
     33d:	e8 00 00 00 00       	call   342 <_Z16ParseCommandLineiPPc+0x29b>
/home/omkar/courses/ece759/project/AVX/Params.h:195
            exit(1);
     342:	bf 01 00 00 00       	mov    edi,0x1
     347:	e8 00 00 00 00       	call   34c <_Z16ParseCommandLineiPPc+0x2a5>
/home/omkar/courses/ece759/project/AVX/Params.h:197
        default:
            std::cerr << "Invalid argument " << argv[i] << std::endl;
     34c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     34f:	48 98                	cdqe   
     351:	48 c1 e0 03          	shl    rax,0x3
     355:	48 03 45 d0          	add    rax,QWORD PTR [rbp-0x30]
     359:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     35c:	be 00 00 00 00       	mov    esi,0x0
     361:	bf 00 00 00 00       	mov    edi,0x0
     366:	e8 00 00 00 00       	call   36b <_Z16ParseCommandLineiPPc+0x2c4>
     36b:	48 89 de             	mov    rsi,rbx
     36e:	48 89 c7             	mov    rdi,rax
     371:	e8 00 00 00 00       	call   376 <_Z16ParseCommandLineiPPc+0x2cf>
     376:	be 00 00 00 00       	mov    esi,0x0
     37b:	48 89 c7             	mov    rdi,rax
     37e:	e8 00 00 00 00       	call   383 <_Z16ParseCommandLineiPPc+0x2dc>
/home/omkar/courses/ece759/project/AVX/Params.h:198
            Usage(argv[0]);
     383:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
     387:	48 8b 00             	mov    rax,QWORD PTR [rax]
     38a:	48 89 c7             	mov    rdi,rax
     38d:	e8 00 00 00 00       	call   392 <_Z16ParseCommandLineiPPc+0x2eb>
/home/omkar/courses/ece759/project/AVX/Params.h:199
            throw(std::string("Invalid argument"));
     392:	bf 08 00 00 00       	mov    edi,0x8
     397:	e8 00 00 00 00       	call   39c <_Z16ParseCommandLineiPPc+0x2f5>
     39c:	48 89 c3             	mov    rbx,rax
     39f:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     3a3:	48 89 c7             	mov    rdi,rax
     3a6:	e8 00 00 00 00       	call   3ab <_Z16ParseCommandLineiPPc+0x304>
     3ab:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     3af:	48 89 c2             	mov    rdx,rax
     3b2:	be 00 00 00 00       	mov    esi,0x0
     3b7:	48 89 df             	mov    rdi,rbx
     3ba:	e8 00 00 00 00       	call   3bf <_Z16ParseCommandLineiPPc+0x318>
     3bf:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     3c3:	48 89 c7             	mov    rdi,rax
     3c6:	e8 00 00 00 00       	call   3cb <_Z16ParseCommandLineiPPc+0x324>
     3cb:	b8 00 00 00 00       	mov    eax,0x0
     3d0:	48 89 c2             	mov    rdx,rax
     3d3:	be 00 00 00 00       	mov    esi,0x0
     3d8:	48 89 df             	mov    rdi,rbx
     3db:	e8 00 00 00 00       	call   3e0 <_Z16ParseCommandLineiPPc+0x339>
/home/omkar/courses/ece759/project/AVX/Params.h:138
    params.nOmpRuns = params.ompThreads.size();
}

void ParseCommandLine(int argc, char* argv[])
{
    for (int i = 1; i < argc; ++i)
     3e0:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
     3e4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
     3e7:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
     3ea:	0f 9c c0             	setl   al
     3ed:	84 c0                	test   al,al
     3ef:	0f 85 d0 fc ff ff    	jne    c5 <_Z16ParseCommandLineiPPc+0x1e>
/home/omkar/courses/ece759/project/AVX/Params.h:202
            std::cerr << "Invalid argument " << argv[i] << std::endl;
            Usage(argv[0]);
            throw(std::string("Invalid argument"));
        }
    }
}
     3f5:	eb 22                	jmp    419 <_Z16ParseCommandLineiPPc+0x372>
     3f7:	49 89 c4             	mov    r12,rax
/home/omkar/courses/ece759/project/AVX/Params.h:199
            Usage(argv[0]);
            exit(1);
        default:
            std::cerr << "Invalid argument " << argv[i] << std::endl;
            Usage(argv[0]);
            throw(std::string("Invalid argument"));
     3fa:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     3fe:	48 89 c7             	mov    rdi,rax
     401:	e8 00 00 00 00       	call   406 <_Z16ParseCommandLineiPPc+0x35f>
     406:	48 89 df             	mov    rdi,rbx
     409:	e8 00 00 00 00       	call   40e <_Z16ParseCommandLineiPPc+0x367>
     40e:	4c 89 e0             	mov    rax,r12
     411:	48 89 c7             	mov    rdi,rax
     414:	e8 00 00 00 00       	call   419 <_Z16ParseCommandLineiPPc+0x372>
/home/omkar/courses/ece759/project/AVX/Params.h:202
        }
    }
}
     419:	48 83 c4 20          	add    rsp,0x20
     41d:	5b                   	pop    rbx
     41e:	41 5c                	pop    r12
     420:	5d                   	pop    rbp
     421:	c3                   	ret    

0000000000000422 <_Z5UsagePc>:
_Z5UsagePc():
/home/omkar/courses/ece759/project/AVX/Params.h:205

void Usage(char *name)
{
     422:	55                   	push   rbp
     423:	48 89 e5             	mov    rbp,rsp
     426:	48 83 ec 10          	sub    rsp,0x10
     42a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/home/omkar/courses/ece759/project/AVX/Params.h:206
    printf("\tUsage: %s [-h] [-c] [-f <int>] [-i <int>] [-x <int>] [-y <int>]\n", name);
     42e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
     432:	48 89 c6             	mov    rsi,rax
     435:	bf 00 00 00 00       	mov    edi,0x0
     43a:	b8 00 00 00 00       	mov    eax,0x0
     43f:	e8 00 00 00 00       	call   444 <_Z5UsagePc+0x22>
/home/omkar/courses/ece759/project/AVX/Params.h:207
    printf("   -h       Print this help menu.\n");
     444:	bf 00 00 00 00       	mov    edi,0x0
     449:	e8 00 00 00 00       	call   44e <_Z5UsagePc+0x2c>
/home/omkar/courses/ece759/project/AVX/Params.h:208
    printf("   -c       Supress CPU timing run.\n");
     44e:	bf 00 00 00 00       	mov    edi,0x0
     453:	e8 00 00 00 00       	call   458 <_Z5UsagePc+0x36>
/home/omkar/courses/ece759/project/AVX/Params.h:209
    printf("   -f <int> Sets the filter width.\n");
     458:	bf 00 00 00 00       	mov    edi,0x0
     45d:	e8 00 00 00 00       	call   462 <_Z5UsagePc+0x40>
/home/omkar/courses/ece759/project/AVX/Params.h:210
    printf("   -i <int> Number of iterations.\n");
     462:	bf 00 00 00 00       	mov    edi,0x0
     467:	e8 00 00 00 00       	call   46c <_Z5UsagePc+0x4a>
/home/omkar/courses/ece759/project/AVX/Params.h:211
    printf("   -x <int> Sets the image width.\n");
     46c:	bf 00 00 00 00       	mov    edi,0x0
     471:	e8 00 00 00 00       	call   476 <_Z5UsagePc+0x54>
/home/omkar/courses/ece759/project/AVX/Params.h:212
    printf("   -y <int> Sets the image height.\n");
     476:	bf 00 00 00 00       	mov    edi,0x0
     47b:	e8 00 00 00 00       	call   480 <_Z5UsagePc+0x5e>
/home/omkar/courses/ece759/project/AVX/Params.h:213
}
     480:	c9                   	leave  
     481:	c3                   	ret    

0000000000000482 <_Z15InitHostBuffersv>:
_Z15InitHostBuffersv():
/home/omkar/courses/ece759/project/AVX/main.cpp:146
/////////////////////////////////////////////////////////////////
// Host buffers
/////////////////////////////////////////////////////////////////

void InitHostBuffers()
{
     482:	55                   	push   rbp
     483:	48 89 e5             	mov    rbp,rsp
     486:	41 54                	push   r12
     488:	53                   	push   rbx
     489:	48 83 ec 30          	sub    rsp,0x30
/home/omkar/courses/ece759/project/AVX/main.cpp:147
    hostBuffers.pInput  = NULL;
     48d:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 498 <_Z15InitHostBuffersv+0x16>
     494:	00 00 00 00 
/home/omkar/courses/ece759/project/AVX/main.cpp:148
    hostBuffers.pOutputCPU = NULL;
     498:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 4a3 <_Z15InitHostBuffersv+0x21>
     49f:	00 00 00 00 
/home/omkar/courses/ece759/project/AVX/main.cpp:153

    /////////////////////////////////////////////////////////////////
    // Allocate and initialize memory used by host 
    /////////////////////////////////////////////////////////////////
    int sizeInBytes = params.nInWidth * params.nInHeight * sizeof(float);
     4a3:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 4a9 <_Z15InitHostBuffersv+0x27>
     4a9:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 4af <_Z15InitHostBuffersv+0x2d>
     4af:	0f af c2             	imul   eax,edx
     4b2:	c1 e0 02             	shl    eax,0x2
     4b5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:154
    hostBuffers.pInput = (float *) malloc(sizeInBytes);
     4b8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     4bb:	48 98                	cdqe   
     4bd:	48 89 c7             	mov    rdi,rax
     4c0:	e8 00 00 00 00       	call   4c5 <_Z15InitHostBuffersv+0x43>
     4c5:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 4cc <_Z15InitHostBuffersv+0x4a>
/home/omkar/courses/ece759/project/AVX/main.cpp:155
    if (!hostBuffers.pInput) 
     4cc:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 4d3 <_Z15InitHostBuffersv+0x51>
     4d3:	48 85 c0             	test   rax,rax
     4d6:	75 4e                	jne    526 <_Z15InitHostBuffersv+0xa4>
/home/omkar/courses/ece759/project/AVX/main.cpp:156
        throw(string("InitHostBuffers()::Could not allocate memory"));
     4d8:	bf 08 00 00 00       	mov    edi,0x8
     4dd:	e8 00 00 00 00       	call   4e2 <_Z15InitHostBuffersv+0x60>
     4e2:	48 89 c3             	mov    rbx,rax
     4e5:	48 8d 45 ed          	lea    rax,[rbp-0x13]
     4e9:	48 89 c7             	mov    rdi,rax
     4ec:	e8 00 00 00 00       	call   4f1 <_Z15InitHostBuffersv+0x6f>
     4f1:	48 8d 45 ed          	lea    rax,[rbp-0x13]
     4f5:	48 89 c2             	mov    rdx,rax
     4f8:	be 00 00 00 00       	mov    esi,0x0
     4fd:	48 89 df             	mov    rdi,rbx
     500:	e8 00 00 00 00       	call   505 <_Z15InitHostBuffersv+0x83>
     505:	48 8d 45 ed          	lea    rax,[rbp-0x13]
     509:	48 89 c7             	mov    rdi,rax
     50c:	e8 00 00 00 00       	call   511 <_Z15InitHostBuffersv+0x8f>
     511:	b8 00 00 00 00       	mov    eax,0x0
     516:	48 89 c2             	mov    rdx,rax
     519:	be 00 00 00 00       	mov    esi,0x0
     51e:	48 89 df             	mov    rdi,rbx
     521:	e8 00 00 00 00       	call   526 <_Z15InitHostBuffersv+0xa4>
/home/omkar/courses/ece759/project/AVX/main.cpp:158

    int sizeOutBytes = params.nWidth * params.nHeight * sizeof(float);
     526:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 52c <_Z15InitHostBuffersv+0xaa>
     52c:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 532 <_Z15InitHostBuffersv+0xb0>
     532:	0f af c2             	imul   eax,edx
     535:	c1 e0 02             	shl    eax,0x2
     538:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:159
    hostBuffers.pOutputCPU = (float *) malloc(sizeOutBytes);
     53b:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
     53e:	48 98                	cdqe   
     540:	48 89 c7             	mov    rdi,rax
     543:	e8 00 00 00 00       	call   548 <_Z15InitHostBuffersv+0xc6>
     548:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 54f <_Z15InitHostBuffersv+0xcd>
/home/omkar/courses/ece759/project/AVX/main.cpp:160
    if (!hostBuffers.pOutputCPU) 
     54f:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 556 <_Z15InitHostBuffersv+0xd4>
     556:	48 85 c0             	test   rax,rax
     559:	75 4e                	jne    5a9 <_Z15InitHostBuffersv+0x127>
/home/omkar/courses/ece759/project/AVX/main.cpp:161
        throw(string("InitHostBuffers()::Could not allocate memory"));
     55b:	bf 08 00 00 00       	mov    edi,0x8
     560:	e8 00 00 00 00       	call   565 <_Z15InitHostBuffersv+0xe3>
     565:	48 89 c3             	mov    rbx,rax
     568:	48 8d 45 ee          	lea    rax,[rbp-0x12]
     56c:	48 89 c7             	mov    rdi,rax
     56f:	e8 00 00 00 00       	call   574 <_Z15InitHostBuffersv+0xf2>
     574:	48 8d 45 ee          	lea    rax,[rbp-0x12]
     578:	48 89 c2             	mov    rdx,rax
     57b:	be 00 00 00 00       	mov    esi,0x0
     580:	48 89 df             	mov    rdi,rbx
     583:	e8 00 00 00 00       	call   588 <_Z15InitHostBuffersv+0x106>
     588:	48 8d 45 ee          	lea    rax,[rbp-0x12]
     58c:	48 89 c7             	mov    rdi,rax
     58f:	e8 00 00 00 00       	call   594 <_Z15InitHostBuffersv+0x112>
     594:	b8 00 00 00 00       	mov    eax,0x0
     599:	48 89 c2             	mov    rdx,rax
     59c:	be 00 00 00 00       	mov    esi,0x0
     5a1:	48 89 df             	mov    rdi,rbx
     5a4:	e8 00 00 00 00       	call   5a9 <_Z15InitHostBuffersv+0x127>
/home/omkar/courses/ece759/project/AVX/main.cpp:163

    int filterSizeBytes = params.nFilterWidth * params.nFilterWidth * sizeof(float);
     5a9:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 5af <_Z15InitHostBuffersv+0x12d>
     5af:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5b5 <_Z15InitHostBuffersv+0x133>
     5b5:	0f af c2             	imul   eax,edx
     5b8:	c1 e0 02             	shl    eax,0x2
     5bb:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:164
    hostBuffers.pFilter = (float *) malloc(filterSizeBytes);
     5be:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
     5c1:	48 98                	cdqe   
     5c3:	48 89 c7             	mov    rdi,rax
     5c6:	e8 00 00 00 00       	call   5cb <_Z15InitHostBuffersv+0x149>
     5cb:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 5d2 <_Z15InitHostBuffersv+0x150>
/home/omkar/courses/ece759/project/AVX/main.cpp:165
    if (!hostBuffers.pFilter) 
     5d2:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5d9 <_Z15InitHostBuffersv+0x157>
     5d9:	48 85 c0             	test   rax,rax
     5dc:	75 4e                	jne    62c <_Z15InitHostBuffersv+0x1aa>
/home/omkar/courses/ece759/project/AVX/main.cpp:166
        throw(string("InitHostBuffers()::Could not allocate memory"));
     5de:	bf 08 00 00 00       	mov    edi,0x8
     5e3:	e8 00 00 00 00       	call   5e8 <_Z15InitHostBuffersv+0x166>
     5e8:	48 89 c3             	mov    rbx,rax
     5eb:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     5ef:	48 89 c7             	mov    rdi,rax
     5f2:	e8 00 00 00 00       	call   5f7 <_Z15InitHostBuffersv+0x175>
     5f7:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     5fb:	48 89 c2             	mov    rdx,rax
     5fe:	be 00 00 00 00       	mov    esi,0x0
     603:	48 89 df             	mov    rdi,rbx
     606:	e8 00 00 00 00       	call   60b <_Z15InitHostBuffersv+0x189>
     60b:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     60f:	48 89 c7             	mov    rdi,rax
     612:	e8 00 00 00 00       	call   617 <_Z15InitHostBuffersv+0x195>
     617:	b8 00 00 00 00       	mov    eax,0x0
     61c:	48 89 c2             	mov    rdx,rax
     61f:	be 00 00 00 00       	mov    esi,0x0
     624:	48 89 df             	mov    rdi,rbx
     627:	e8 00 00 00 00       	call   62c <_Z15InitHostBuffersv+0x1aa>
/home/omkar/courses/ece759/project/AVX/main.cpp:168

    srand(0);
     62c:	bf 00 00 00 00       	mov    edi,0x0
     631:	e8 00 00 00 00       	call   636 <_Z15InitHostBuffersv+0x1b4>
/home/omkar/courses/ece759/project/AVX/main.cpp:170
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nInWidth * params.nInHeight; i++)
     636:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [rbp-0x30],0x0
     63d:	eb 26                	jmp    665 <_Z15InitHostBuffersv+0x1e3>
/home/omkar/courses/ece759/project/AVX/main.cpp:172
    {
        hostBuffers.pInput[i] = float(rand());
     63f:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 646 <_Z15InitHostBuffersv+0x1c4>
     646:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
     649:	48 63 d2             	movsxd rdx,edx
     64c:	48 c1 e2 02          	shl    rdx,0x2
     650:	48 8d 1c 10          	lea    rbx,[rax+rdx*1]
     654:	e8 00 00 00 00       	call   659 <_Z15InitHostBuffersv+0x1d7>
     659:	c5 fa 2a c0          	vcvtsi2ss xmm0,xmm0,eax
     65d:	c5 fa 11 03          	vmovss DWORD PTR [rbx],xmm0
/home/omkar/courses/ece759/project/AVX/main.cpp:170
    if (!hostBuffers.pFilter) 
        throw(string("InitHostBuffers()::Could not allocate memory"));

    srand(0);
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nInWidth * params.nInHeight; i++)
     661:	83 45 d0 01          	add    DWORD PTR [rbp-0x30],0x1
     665:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 66b <_Z15InitHostBuffersv+0x1e9>
     66b:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 671 <_Z15InitHostBuffersv+0x1ef>
     671:	0f af c2             	imul   eax,edx
     674:	3b 45 d0             	cmp    eax,DWORD PTR [rbp-0x30]
     677:	0f 9f c0             	setg   al
     67a:	84 c0                	test   al,al
     67c:	75 c1                	jne    63f <_Z15InitHostBuffersv+0x1bd>
/home/omkar/courses/ece759/project/AVX/main.cpp:175
    {
        hostBuffers.pInput[i] = float(rand());
    }

    double dFilterSum = 0;
     67e:	b8 00 00 00 00       	mov    eax,0x0
     683:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
/home/omkar/courses/ece759/project/AVX/main.cpp:176
    int nFilterSize = params.nFilterWidth*params.nFilterWidth;
     687:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 68d <_Z15InitHostBuffersv+0x20b>
     68d:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 693 <_Z15InitHostBuffersv+0x211>
     693:	0f af c2             	imul   eax,edx
     696:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:177
    for (int i = 0; i < nFilterSize; i++)
     699:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
     6a0:	eb 54                	jmp    6f6 <_Z15InitHostBuffersv+0x274>
/home/omkar/courses/ece759/project/AVX/main.cpp:179
    {
        hostBuffers.pFilter[i] = float(rand());
     6a2:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6a9 <_Z15InitHostBuffersv+0x227>
     6a9:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
     6ac:	48 63 d2             	movsxd rdx,edx
     6af:	48 c1 e2 02          	shl    rdx,0x2
     6b3:	48 8d 1c 10          	lea    rbx,[rax+rdx*1]
     6b7:	e8 00 00 00 00       	call   6bc <_Z15InitHostBuffersv+0x23a>
     6bc:	c5 fa 2a c0          	vcvtsi2ss xmm0,xmm0,eax
     6c0:	c5 fa 11 03          	vmovss DWORD PTR [rbx],xmm0
/home/omkar/courses/ece759/project/AVX/main.cpp:180
        dFilterSum += hostBuffers.pFilter[i];
     6c4:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6cb <_Z15InitHostBuffersv+0x249>
     6cb:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
     6ce:	48 63 d2             	movsxd rdx,edx
     6d1:	48 c1 e2 02          	shl    rdx,0x2
     6d5:	48 01 d0             	add    rax,rdx
     6d8:	c5 fa 10 00          	vmovss xmm0,DWORD PTR [rax]
     6dc:	c5 f8 14 c0          	vunpcklps xmm0,xmm0,xmm0
     6e0:	c5 f8 5a c0          	vcvtps2pd xmm0,xmm0
     6e4:	c5 fb 10 4d c8       	vmovsd xmm1,QWORD PTR [rbp-0x38]
     6e9:	c5 f3 58 c0          	vaddsd xmm0,xmm1,xmm0
     6ed:	c5 fb 11 45 c8       	vmovsd QWORD PTR [rbp-0x38],xmm0
/home/omkar/courses/ece759/project/AVX/main.cpp:177
        hostBuffers.pInput[i] = float(rand());
    }

    double dFilterSum = 0;
    int nFilterSize = params.nFilterWidth*params.nFilterWidth;
    for (int i = 0; i < nFilterSize; i++)
     6f2:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
     6f6:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
     6f9:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
     6fc:	0f 9c c0             	setl   al
     6ff:	84 c0                	test   al,al
     701:	75 9f                	jne    6a2 <_Z15InitHostBuffersv+0x220>
/home/omkar/courses/ece759/project/AVX/main.cpp:182
    {
        hostBuffers.pFilter[i] = float(rand());
        dFilterSum += hostBuffers.pFilter[i];
    }
    for (int i = 0; i < nFilterSize; i++)
     703:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
     70a:	eb 49                	jmp    755 <_Z15InitHostBuffersv+0x2d3>
/home/omkar/courses/ece759/project/AVX/main.cpp:183
        hostBuffers.pFilter[i] /= dFilterSum;
     70c:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 713 <_Z15InitHostBuffersv+0x291>
     713:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
     716:	48 63 d2             	movsxd rdx,edx
     719:	48 c1 e2 02          	shl    rdx,0x2
     71d:	48 01 d0             	add    rax,rdx
     720:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 727 <_Z15InitHostBuffersv+0x2a5>
     727:	8b 4d d8             	mov    ecx,DWORD PTR [rbp-0x28]
     72a:	48 63 c9             	movsxd rcx,ecx
     72d:	48 c1 e1 02          	shl    rcx,0x2
     731:	48 01 ca             	add    rdx,rcx
     734:	c5 fa 10 02          	vmovss xmm0,DWORD PTR [rdx]
     738:	c5 f8 14 c0          	vunpcklps xmm0,xmm0,xmm0
     73c:	c5 f8 5a c0          	vcvtps2pd xmm0,xmm0
     740:	c5 fb 5e 45 c8       	vdivsd xmm0,xmm0,QWORD PTR [rbp-0x38]
     745:	c5 fb 12 c0          	vmovddup xmm0,xmm0
     749:	c5 f9 5a c0          	vcvtpd2ps xmm0,xmm0
     74d:	c5 fa 11 00          	vmovss DWORD PTR [rax],xmm0
/home/omkar/courses/ece759/project/AVX/main.cpp:182
    for (int i = 0; i < nFilterSize; i++)
    {
        hostBuffers.pFilter[i] = float(rand());
        dFilterSum += hostBuffers.pFilter[i];
    }
    for (int i = 0; i < nFilterSize; i++)
     751:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
     755:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
     758:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
     75b:	0f 9c c0             	setl   al
     75e:	84 c0                	test   al,al
     760:	75 aa                	jne    70c <_Z15InitHostBuffersv+0x28a>
/home/omkar/courses/ece759/project/AVX/main.cpp:184
        hostBuffers.pFilter[i] /= dFilterSum;
}
     762:	eb 66                	jmp    7ca <_Z15InitHostBuffersv+0x348>
     764:	49 89 c4             	mov    r12,rax
/home/omkar/courses/ece759/project/AVX/main.cpp:156
    // Allocate and initialize memory used by host 
    /////////////////////////////////////////////////////////////////
    int sizeInBytes = params.nInWidth * params.nInHeight * sizeof(float);
    hostBuffers.pInput = (float *) malloc(sizeInBytes);
    if (!hostBuffers.pInput) 
        throw(string("InitHostBuffers()::Could not allocate memory"));
     767:	48 8d 45 ed          	lea    rax,[rbp-0x13]
     76b:	48 89 c7             	mov    rdi,rax
     76e:	e8 00 00 00 00       	call   773 <_Z15InitHostBuffersv+0x2f1>
     773:	48 89 df             	mov    rdi,rbx
     776:	e8 00 00 00 00       	call   77b <_Z15InitHostBuffersv+0x2f9>
     77b:	4c 89 e0             	mov    rax,r12
     77e:	48 89 c7             	mov    rdi,rax
     781:	e8 00 00 00 00       	call   786 <_Z15InitHostBuffersv+0x304>
     786:	49 89 c4             	mov    r12,rax
/home/omkar/courses/ece759/project/AVX/main.cpp:161

    int sizeOutBytes = params.nWidth * params.nHeight * sizeof(float);
    hostBuffers.pOutputCPU = (float *) malloc(sizeOutBytes);
    if (!hostBuffers.pOutputCPU) 
        throw(string("InitHostBuffers()::Could not allocate memory"));
     789:	48 8d 45 ee          	lea    rax,[rbp-0x12]
     78d:	48 89 c7             	mov    rdi,rax
     790:	e8 00 00 00 00       	call   795 <_Z15InitHostBuffersv+0x313>
     795:	48 89 df             	mov    rdi,rbx
     798:	e8 00 00 00 00       	call   79d <_Z15InitHostBuffersv+0x31b>
     79d:	4c 89 e0             	mov    rax,r12
     7a0:	48 89 c7             	mov    rdi,rax
     7a3:	e8 00 00 00 00       	call   7a8 <_Z15InitHostBuffersv+0x326>
     7a8:	49 89 c4             	mov    r12,rax
/home/omkar/courses/ece759/project/AVX/main.cpp:166

    int filterSizeBytes = params.nFilterWidth * params.nFilterWidth * sizeof(float);
    hostBuffers.pFilter = (float *) malloc(filterSizeBytes);
    if (!hostBuffers.pFilter) 
        throw(string("InitHostBuffers()::Could not allocate memory"));
     7ab:	48 8d 45 ef          	lea    rax,[rbp-0x11]
     7af:	48 89 c7             	mov    rdi,rax
     7b2:	e8 00 00 00 00       	call   7b7 <_Z15InitHostBuffersv+0x335>
     7b7:	48 89 df             	mov    rdi,rbx
     7ba:	e8 00 00 00 00       	call   7bf <_Z15InitHostBuffersv+0x33d>
     7bf:	4c 89 e0             	mov    rax,r12
     7c2:	48 89 c7             	mov    rdi,rax
     7c5:	e8 00 00 00 00       	call   7ca <_Z15InitHostBuffersv+0x348>
/home/omkar/courses/ece759/project/AVX/main.cpp:184
        hostBuffers.pFilter[i] = float(rand());
        dFilterSum += hostBuffers.pFilter[i];
    }
    for (int i = 0; i < nFilterSize; i++)
        hostBuffers.pFilter[i] /= dFilterSum;
}
     7ca:	48 83 c4 30          	add    rsp,0x30
     7ce:	5b                   	pop    rbx
     7cf:	41 5c                	pop    r12
     7d1:	5d                   	pop    rbp
     7d2:	c3                   	ret    

00000000000007d3 <_Z11ClearBufferPf>:
_Z11ClearBufferPf():
/home/omkar/courses/ece759/project/AVX/main.cpp:187

void ClearBuffer(float * pBuf)
{
     7d3:	55                   	push   rbp
     7d4:	48 89 e5             	mov    rbp,rsp
     7d7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
/home/omkar/courses/ece759/project/AVX/main.cpp:189
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nWidth*params.nHeight; i++)
     7db:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
     7e2:	eb 18                	jmp    7fc <_Z11ClearBufferPf+0x29>
/home/omkar/courses/ece759/project/AVX/main.cpp:191
    {
        pBuf[i] = -999.999f;
     7e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
     7e7:	48 98                	cdqe   
     7e9:	48 c1 e0 02          	shl    rax,0x2
     7ed:	48 03 45 e8          	add    rax,QWORD PTR [rbp-0x18]
     7f1:	ba f0 ff 79 c4       	mov    edx,0xc479fff0
     7f6:	89 10                	mov    DWORD PTR [rax],edx
/home/omkar/courses/ece759/project/AVX/main.cpp:189
}

void ClearBuffer(float * pBuf)
{
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nWidth*params.nHeight; i++)
     7f8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
     7fc:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 802 <_Z11ClearBufferPf+0x2f>
     802:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 808 <_Z11ClearBufferPf+0x35>
     808:	0f af c2             	imul   eax,edx
     80b:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
     80e:	0f 9f c0             	setg   al
     811:	84 c0                	test   al,al
     813:	75 cf                	jne    7e4 <_Z11ClearBufferPf+0x11>
/home/omkar/courses/ece759/project/AVX/main.cpp:193
    {
        pBuf[i] = -999.999f;
    }
}
     815:	5d                   	pop    rbp
     816:	c3                   	ret    

0000000000000817 <_Z18ReleaseHostBuffersv>:
_Z18ReleaseHostBuffersv():
/home/omkar/courses/ece759/project/AVX/main.cpp:196

void ReleaseHostBuffers()
{
     817:	55                   	push   rbp
     818:	48 89 e5             	mov    rbp,rsp
/home/omkar/courses/ece759/project/AVX/main.cpp:197
    FREE(hostBuffers.pInput, NULL);
     81b:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 822 <_Z18ReleaseHostBuffersv+0xb>
     822:	48 85 c0             	test   rax,rax
     825:	74 1a                	je     841 <_Z18ReleaseHostBuffersv+0x2a>
     827:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 82e <_Z18ReleaseHostBuffersv+0x17>
     82e:	48 89 c7             	mov    rdi,rax
     831:	e8 00 00 00 00       	call   836 <_Z18ReleaseHostBuffersv+0x1f>
     836:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 841 <_Z18ReleaseHostBuffersv+0x2a>
     83d:	00 00 00 00 
/home/omkar/courses/ece759/project/AVX/main.cpp:198
    FREE(hostBuffers.pOutputCPU, NULL);
     841:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 848 <_Z18ReleaseHostBuffersv+0x31>
     848:	48 85 c0             	test   rax,rax
     84b:	74 1a                	je     867 <_Z18ReleaseHostBuffersv+0x50>
     84d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 854 <_Z18ReleaseHostBuffersv+0x3d>
     854:	48 89 c7             	mov    rdi,rax
     857:	e8 00 00 00 00       	call   85c <_Z18ReleaseHostBuffersv+0x45>
     85c:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 867 <_Z18ReleaseHostBuffersv+0x50>
     863:	00 00 00 00 
/home/omkar/courses/ece759/project/AVX/main.cpp:199
    FREE(hostBuffers.pFilter, NULL);
     867:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 86e <_Z18ReleaseHostBuffersv+0x57>
     86e:	48 85 c0             	test   rax,rax
     871:	74 1a                	je     88d <_Z18ReleaseHostBuffersv+0x76>
     873:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 87a <_Z18ReleaseHostBuffersv+0x63>
     87a:	48 89 c7             	mov    rdi,rax
     87d:	e8 00 00 00 00       	call   882 <_Z18ReleaseHostBuffersv+0x6b>
     882:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 88d <_Z18ReleaseHostBuffersv+0x76>
     889:	00 00 00 00 
/home/omkar/courses/ece759/project/AVX/main.cpp:200
}
     88d:	5d                   	pop    rbp
     88e:	c3                   	ret    

000000000000088f <_Z8ConvolvePfS_S_iiiii>:
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:209
/////////////////////////////////////////////////////////////////

void Convolve(float * pInput, float * pFilter, float * pOutput,
          const int nInWidth, const int nWidth, const int nHeight,
          const int nFilterWidth, const int nNumThreads)
{
     88f:	55                   	push   rbp
     890:	48 89 e5             	mov    rbp,rsp
     893:	48 83 e4 e0          	and    rsp,0xffffffffffffffe0
     897:	48 81 ec e8 01 00 00 	sub    rsp,0x1e8
     89e:	48 89 7c 24 c0       	mov    QWORD PTR [rsp-0x40],rdi
     8a3:	48 89 74 24 b8       	mov    QWORD PTR [rsp-0x48],rsi
     8a8:	48 89 54 24 b0       	mov    QWORD PTR [rsp-0x50],rdx
     8ad:	89 4c 24 ac          	mov    DWORD PTR [rsp-0x54],ecx
     8b1:	44 89 44 24 a8       	mov    DWORD PTR [rsp-0x58],r8d
     8b6:	44 89 4c 24 a4       	mov    DWORD PTR [rsp-0x5c],r9d
/home/omkar/courses/ece759/project/AVX/main.cpp:211
    #pragma omp parallel for num_threads(nNumThreads)
    for (int yOut = 0; yOut < nHeight; yOut++)
     8bb:	c7 84 24 a8 01 00 00 	mov    DWORD PTR [rsp+0x1a8],0x0
     8c2:	00 00 00 00 
     8c6:	e9 53 03 00 00       	jmp    c1e <_Z8ConvolvePfS_S_iiiii+0x38f>
/home/omkar/courses/ece759/project/AVX/main.cpp:213
    {
        const int yInTopLeft = yOut;
     8cb:	8b 84 24 a8 01 00 00 	mov    eax,DWORD PTR [rsp+0x1a8]
     8d2:	89 84 24 b8 01 00 00 	mov    DWORD PTR [rsp+0x1b8],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:215

        for (int xOut = 0; xOut < nWidth; xOut++)
     8d9:	c7 84 24 ac 01 00 00 	mov    DWORD PTR [rsp+0x1ac],0x0
     8e0:	00 00 00 00 
     8e4:	e9 17 03 00 00       	jmp    c00 <_Z8ConvolvePfS_S_iiiii+0x371>
/home/omkar/courses/ece759/project/AVX/main.cpp:217
        {
            const int xInTopLeft = xOut;
     8e9:	8b 84 24 ac 01 00 00 	mov    eax,DWORD PTR [rsp+0x1ac]
     8f0:	89 84 24 bc 01 00 00 	mov    DWORD PTR [rsp+0x1bc],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:220

            // Core
            float sum = 0;
     8f7:	b8 00 00 00 00       	mov    eax,0x0
     8fc:	89 84 24 c0 01 00 00 	mov    DWORD PTR [rsp+0x1c0],eax
     903:	b8 00 00 00 00       	mov    eax,0x0
     908:	89 84 24 e0 01 00 00 	mov    DWORD PTR [rsp+0x1e0],eax
_mm256_set1_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/avxintrin.h:1254
/* Create a vector with all elements equal to A.  */
extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set1_ps (float __A)
{
  return __extension__ (__m256){ __A, __A, __A, __A,
				 __A, __A, __A, __A };
     90f:	c4 e2 7d 18 84 24 e0 	vbroadcastss ymm0,DWORD PTR [rsp+0x1e0]
     916:	01 00 00 
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:221
            __m256 prod __attribute__ ((aligned (32))) = _mm256_set1_ps(0.0f);
     919:	c5 fc 29 44 24 08    	vmovaps YMMWORD PTR [rsp+0x8],ymm0
     91f:	b8 00 00 00 00       	mov    eax,0x0
     924:	89 84 24 e4 01 00 00 	mov    DWORD PTR [rsp+0x1e4],eax
_mm256_set1_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/avxintrin.h:1254
     92b:	c4 e2 7d 18 84 24 e4 	vbroadcastss ymm0,DWORD PTR [rsp+0x1e4]
     932:	01 00 00 
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:222
            __m256 acc __attribute__ ((aligned (32))) = _mm256_set1_ps(0.0f);
     935:	c5 fc 29 44 24 c8    	vmovaps YMMWORD PTR [rsp-0x38],ymm0
/home/omkar/courses/ece759/project/AVX/main.cpp:225
            __m256 data __attribute__ ((aligned (32)));
            __m256 kernel __attribute__ ((aligned (32)));
            for (int r = 0; r < nFilterWidth; r++)
     93b:	c7 84 24 b0 01 00 00 	mov    DWORD PTR [rsp+0x1b0],0x0
     942:	00 00 00 00 
     946:	e9 6c 01 00 00       	jmp    ab7 <_Z8ConvolvePfS_S_iiiii+0x228>
/home/omkar/courses/ece759/project/AVX/main.cpp:227
            {
                const int idxFtmp = r * nFilterWidth;
     94b:	8b 84 24 b0 01 00 00 	mov    eax,DWORD PTR [rsp+0x1b0]
     952:	0f af 45 10          	imul   eax,DWORD PTR [rbp+0x10]
     956:	89 84 24 c4 01 00 00 	mov    DWORD PTR [rsp+0x1c4],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:229

                const int yIn = yInTopLeft + r;
     95d:	8b 84 24 b0 01 00 00 	mov    eax,DWORD PTR [rsp+0x1b0]
     964:	8b 94 24 b8 01 00 00 	mov    edx,DWORD PTR [rsp+0x1b8]
     96b:	01 d0                	add    eax,edx
     96d:	89 84 24 c8 01 00 00 	mov    DWORD PTR [rsp+0x1c8],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:230
                const int idxIntmp = yIn * nInWidth + xInTopLeft;
     974:	8b 84 24 c8 01 00 00 	mov    eax,DWORD PTR [rsp+0x1c8]
     97b:	0f af 44 24 ac       	imul   eax,DWORD PTR [rsp-0x54]
     980:	03 84 24 bc 01 00 00 	add    eax,DWORD PTR [rsp+0x1bc]
     987:	89 84 24 cc 01 00 00 	mov    DWORD PTR [rsp+0x1cc],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:241
                    const int idxIn = idxIntmp + c;    
                    sum += pFilter[idxF]*pInput[idxIn];
                }
                }
                else {
                for (int c = 0; c < nFilterWidth; c+=8)
     98e:	c7 84 24 b4 01 00 00 	mov    DWORD PTR [rsp+0x1b4],0x0
     995:	00 00 00 00 
     999:	e9 fc 00 00 00       	jmp    a9a <_Z8ConvolvePfS_S_iiiii+0x20b>
/home/omkar/courses/ece759/project/AVX/main.cpp:243
                {
                  const int idxF  = idxFtmp  + c;
     99e:	8b 84 24 b4 01 00 00 	mov    eax,DWORD PTR [rsp+0x1b4]
     9a5:	8b 94 24 c4 01 00 00 	mov    edx,DWORD PTR [rsp+0x1c4]
     9ac:	01 d0                	add    eax,edx
     9ae:	89 84 24 d0 01 00 00 	mov    DWORD PTR [rsp+0x1d0],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:244
                  const int idxIn = idxIntmp + c;    
     9b5:	8b 84 24 b4 01 00 00 	mov    eax,DWORD PTR [rsp+0x1b4]
     9bc:	8b 94 24 cc 01 00 00 	mov    edx,DWORD PTR [rsp+0x1cc]
     9c3:	01 d0                	add    eax,edx
     9c5:	89 84 24 d4 01 00 00 	mov    DWORD PTR [rsp+0x1d4],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:245
                  data = _mm256_loadu_ps(pInput + idxIn);
     9cc:	8b 84 24 d4 01 00 00 	mov    eax,DWORD PTR [rsp+0x1d4]
     9d3:	48 98                	cdqe   
     9d5:	48 c1 e0 02          	shl    rax,0x2
     9d9:	48 03 44 24 c0       	add    rax,QWORD PTR [rsp-0x40]
     9de:	48 89 84 24 98 01 00 	mov    QWORD PTR [rsp+0x198],rax
     9e5:	00 
_mm256_loadu_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/avxintrin.h:859
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_loadu_ps (float const *__P)
{
  return (__m256) __builtin_ia32_loadups256 (__P);
     9e6:	48 8b 84 24 98 01 00 	mov    rax,QWORD PTR [rsp+0x198]
     9ed:	00 
     9ee:	c5 fc 10 00          	vmovups ymm0,YMMWORD PTR [rax]
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:245
     9f2:	c5 fc 29 44 24 28    	vmovaps YMMWORD PTR [rsp+0x28],ymm0
/home/omkar/courses/ece759/project/AVX/main.cpp:246
                  kernel = _mm256_loadu_ps(pFilter + idxF);
     9f8:	8b 84 24 d0 01 00 00 	mov    eax,DWORD PTR [rsp+0x1d0]
     9ff:	48 98                	cdqe   
     a01:	48 c1 e0 02          	shl    rax,0x2
     a05:	48 03 44 24 b8       	add    rax,QWORD PTR [rsp-0x48]
     a0a:	48 89 84 24 a0 01 00 	mov    QWORD PTR [rsp+0x1a0],rax
     a11:	00 
_mm256_loadu_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/avxintrin.h:859
     a12:	48 8b 84 24 a0 01 00 	mov    rax,QWORD PTR [rsp+0x1a0]
     a19:	00 
     a1a:	c5 fc 10 00          	vmovups ymm0,YMMWORD PTR [rax]
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:246
     a1e:	c5 fc 29 44 24 48    	vmovaps YMMWORD PTR [rsp+0x48],ymm0
     a24:	c5 fc 28 44 24 28    	vmovaps ymm0,YMMWORD PTR [rsp+0x28]
     a2a:	c5 fc 29 44 24 68    	vmovaps YMMWORD PTR [rsp+0x68],ymm0
     a30:	c5 fc 28 44 24 48    	vmovaps ymm0,YMMWORD PTR [rsp+0x48]
     a36:	c5 fc 29 84 24 88 00 	vmovaps YMMWORD PTR [rsp+0x88],ymm0
     a3d:	00 00 
_mm256_mul_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/avxintrin.h:295
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mul_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_mulps256 ((__v8sf)__A, (__v8sf)__B);
     a3f:	c5 fc 28 84 24 88 00 	vmovaps ymm0,YMMWORD PTR [rsp+0x88]
     a46:	00 00 
     a48:	c5 fc 28 4c 24 68    	vmovaps ymm1,YMMWORD PTR [rsp+0x68]
     a4e:	c5 f4 59 c0          	vmulps ymm0,ymm1,ymm0
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:247
                  prod = _mm256_mul_ps(data, kernel);
     a52:	c5 fc 29 44 24 08    	vmovaps YMMWORD PTR [rsp+0x8],ymm0
     a58:	c5 fc 28 44 24 08    	vmovaps ymm0,YMMWORD PTR [rsp+0x8]
     a5e:	c5 fc 29 84 24 a8 00 	vmovaps YMMWORD PTR [rsp+0xa8],ymm0
     a65:	00 00 
     a67:	c5 fc 28 44 24 c8    	vmovaps ymm0,YMMWORD PTR [rsp-0x38]
     a6d:	c5 fc 29 84 24 c8 00 	vmovaps YMMWORD PTR [rsp+0xc8],ymm0
     a74:	00 00 
_mm256_add_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/avxintrin.h:124
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_addps256 ((__v8sf)__A, (__v8sf)__B);
     a76:	c5 fc 28 84 24 c8 00 	vmovaps ymm0,YMMWORD PTR [rsp+0xc8]
     a7d:	00 00 
     a7f:	c5 fc 28 8c 24 a8 00 	vmovaps ymm1,YMMWORD PTR [rsp+0xa8]
     a86:	00 00 
     a88:	c5 f4 58 c0          	vaddps ymm0,ymm1,ymm0
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:248
                  acc = _mm256_add_ps(prod, acc);
     a8c:	c5 fc 29 44 24 c8    	vmovaps YMMWORD PTR [rsp-0x38],ymm0
/home/omkar/courses/ece759/project/AVX/main.cpp:241
                    const int idxIn = idxIntmp + c;    
                    sum += pFilter[idxF]*pInput[idxIn];
                }
                }
                else {
                for (int c = 0; c < nFilterWidth; c+=8)
     a92:	83 84 24 b4 01 00 00 	add    DWORD PTR [rsp+0x1b4],0x8
     a99:	08 
     a9a:	8b 84 24 b4 01 00 00 	mov    eax,DWORD PTR [rsp+0x1b4]
     aa1:	3b 45 10             	cmp    eax,DWORD PTR [rbp+0x10]
     aa4:	0f 9c c0             	setl   al
     aa7:	84 c0                	test   al,al
     aa9:	0f 85 ef fe ff ff    	jne    99e <_Z8ConvolvePfS_S_iiiii+0x10f>
/home/omkar/courses/ece759/project/AVX/main.cpp:225
            float sum = 0;
            __m256 prod __attribute__ ((aligned (32))) = _mm256_set1_ps(0.0f);
            __m256 acc __attribute__ ((aligned (32))) = _mm256_set1_ps(0.0f);
            __m256 data __attribute__ ((aligned (32)));
            __m256 kernel __attribute__ ((aligned (32)));
            for (int r = 0; r < nFilterWidth; r++)
     aaf:	83 84 24 b0 01 00 00 	add    DWORD PTR [rsp+0x1b0],0x1
     ab6:	01 
     ab7:	8b 84 24 b0 01 00 00 	mov    eax,DWORD PTR [rsp+0x1b0]
     abe:	3b 45 10             	cmp    eax,DWORD PTR [rbp+0x10]
     ac1:	0f 9c c0             	setl   al
     ac4:	84 c0                	test   al,al
     ac6:	0f 85 7f fe ff ff    	jne    94b <_Z8ConvolvePfS_S_iiiii+0xbc>
     acc:	c5 fc 28 44 24 e8    	vmovaps ymm0,YMMWORD PTR [rsp-0x18]
     ad2:	c5 fc 29 84 24 e8 00 	vmovaps YMMWORD PTR [rsp+0xe8],ymm0
     ad9:	00 00 
     adb:	c5 fc 28 44 24 e8    	vmovaps ymm0,YMMWORD PTR [rsp-0x18]
     ae1:	c5 fc 29 84 24 08 01 	vmovaps YMMWORD PTR [rsp+0x108],ymm0
     ae8:	00 00 
_mm256_hadd_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/avxintrin.h:247
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hadd_ps (__m256 __X, __m256 __Y)
{
  return (__m256) __builtin_ia32_haddps256 ((__v8sf)__X, (__v8sf)__Y);
     aea:	c5 fc 28 84 24 e8 00 	vmovaps ymm0,YMMWORD PTR [rsp+0xe8]
     af1:	00 00 
     af3:	c5 ff 7c 84 24 08 01 	vhaddps ymm0,ymm0,YMMWORD PTR [rsp+0x108]
     afa:	00 00 
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:253
                  acc = _mm256_add_ps(prod, acc);
                }
                }
            } 
            if (SSE) {
              __m256 acc = _mm256_hadd_ps(acc, acc);
     afc:	c5 fc 29 44 24 e8    	vmovaps YMMWORD PTR [rsp-0x18],ymm0
/home/omkar/courses/ece759/project/AVX/main.cpp:254
              __m128 t1 = _mm256_extractf128_ps(acc, 0);
     b02:	c5 fc 28 44 24 e8    	vmovaps ymm0,YMMWORD PTR [rsp-0x18]
     b08:	c5 f8 28 c0          	vmovaps xmm0,xmm0
     b0c:	c5 f8 29 84 24 38 01 	vmovaps XMMWORD PTR [rsp+0x138],xmm0
     b13:	00 00 
     b15:	c5 f8 28 84 24 38 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x138]
     b1c:	00 00 
     b1e:	c5 f8 29 84 24 48 01 	vmovaps XMMWORD PTR [rsp+0x148],xmm0
     b25:	00 00 
     b27:	c5 f8 28 84 24 38 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x138]
     b2e:	00 00 
     b30:	c5 f8 29 84 24 58 01 	vmovaps XMMWORD PTR [rsp+0x158],xmm0
     b37:	00 00 
_mm_hadd_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/pmmintrin.h:57
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_ps (__m128 __X, __m128 __Y)
{
  return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
     b39:	c5 f8 28 84 24 48 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x148]
     b40:	00 00 
     b42:	c5 fb 7c 84 24 58 01 	vhaddps xmm0,xmm0,XMMWORD PTR [rsp+0x158]
     b49:	00 00 
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:255
              t1 = _mm_hadd_ps(t1, t1);
     b4b:	c5 f8 29 84 24 38 01 	vmovaps XMMWORD PTR [rsp+0x138],xmm0
     b52:	00 00 
     b54:	c5 f8 28 84 24 38 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x138]
     b5b:	00 00 
     b5d:	c5 f8 29 84 24 68 01 	vmovaps XMMWORD PTR [rsp+0x168],xmm0
     b64:	00 00 
     b66:	c5 f8 28 84 24 38 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x138]
     b6d:	00 00 
     b6f:	c5 f8 29 84 24 78 01 	vmovaps XMMWORD PTR [rsp+0x178],xmm0
     b76:	00 00 
_mm_hadd_ps():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/pmmintrin.h:57
     b78:	c5 f8 28 84 24 68 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x168]
     b7f:	00 00 
     b81:	c5 fb 7c 84 24 78 01 	vhaddps xmm0,xmm0,XMMWORD PTR [rsp+0x178]
     b88:	00 00 
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:256
              t1 = _mm_hadd_ps(t1, t1);
     b8a:	c5 f8 29 84 24 38 01 	vmovaps XMMWORD PTR [rsp+0x138],xmm0
     b91:	00 00 
     b93:	c5 f8 28 84 24 38 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x138]
     b9a:	00 00 
     b9c:	c5 f8 29 84 24 88 01 	vmovaps XMMWORD PTR [rsp+0x188],xmm0
     ba3:	00 00 
_mm_cvtss_f32():
/usr/lib/gcc/x86_64-linux-gnu/4.6/include/xmmintrin.h:941
}

extern __inline float __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_f32 (__m128 __A)
{
  return __builtin_ia32_vec_ext_v4sf ((__v4sf)__A, 0);
     ba5:	c5 f8 28 84 24 88 01 	vmovaps xmm0,XMMWORD PTR [rsp+0x188]
     bac:	00 00 
     bae:	c5 f8 28 c0          	vmovaps xmm0,xmm0
     bb2:	c5 fa 11 44 24 a0    	vmovss DWORD PTR [rsp-0x60],xmm0
     bb8:	8b 44 24 a0          	mov    eax,DWORD PTR [rsp-0x60]
_Z8ConvolvePfS_S_iiiii():
/home/omkar/courses/ece759/project/AVX/main.cpp:257
              float sum2 = _mm_cvtss_f32(t1);
     bbc:	89 84 24 d8 01 00 00 	mov    DWORD PTR [rsp+0x1d8],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:258
              const int idxOut = yOut * nWidth + xOut;
     bc3:	8b 84 24 a8 01 00 00 	mov    eax,DWORD PTR [rsp+0x1a8]
     bca:	0f af 44 24 a8       	imul   eax,DWORD PTR [rsp-0x58]
     bcf:	03 84 24 ac 01 00 00 	add    eax,DWORD PTR [rsp+0x1ac]
     bd6:	89 84 24 dc 01 00 00 	mov    DWORD PTR [rsp+0x1dc],eax
/home/omkar/courses/ece759/project/AVX/main.cpp:259
              pOutput[idxOut] = sum2;
     bdd:	8b 84 24 dc 01 00 00 	mov    eax,DWORD PTR [rsp+0x1dc]
     be4:	48 98                	cdqe   
     be6:	48 c1 e0 02          	shl    rax,0x2
     bea:	48 03 44 24 b0       	add    rax,QWORD PTR [rsp-0x50]
     bef:	8b 94 24 d8 01 00 00 	mov    edx,DWORD PTR [rsp+0x1d8]
     bf6:	89 10                	mov    DWORD PTR [rax],edx
/home/omkar/courses/ece759/project/AVX/main.cpp:215
    #pragma omp parallel for num_threads(nNumThreads)
    for (int yOut = 0; yOut < nHeight; yOut++)
    {
        const int yInTopLeft = yOut;

        for (int xOut = 0; xOut < nWidth; xOut++)
     bf8:	83 84 24 ac 01 00 00 	add    DWORD PTR [rsp+0x1ac],0x1
     bff:	01 
     c00:	8b 84 24 ac 01 00 00 	mov    eax,DWORD PTR [rsp+0x1ac]
     c07:	3b 44 24 a8          	cmp    eax,DWORD PTR [rsp-0x58]
     c0b:	0f 9c c0             	setl   al
     c0e:	84 c0                	test   al,al
     c10:	0f 85 d3 fc ff ff    	jne    8e9 <_Z8ConvolvePfS_S_iiiii+0x5a>
/home/omkar/courses/ece759/project/AVX/main.cpp:211
void Convolve(float * pInput, float * pFilter, float * pOutput,
          const int nInWidth, const int nWidth, const int nHeight,
          const int nFilterWidth, const int nNumThreads)
{
    #pragma omp parallel for num_threads(nNumThreads)
    for (int yOut = 0; yOut < nHeight; yOut++)
     c16:	83 84 24 a8 01 00 00 	add    DWORD PTR [rsp+0x1a8],0x1
     c1d:	01 
     c1e:	8b 84 24 a8 01 00 00 	mov    eax,DWORD PTR [rsp+0x1a8]
     c25:	3b 44 24 a4          	cmp    eax,DWORD PTR [rsp-0x5c]
     c29:	0f 9c c0             	setl   al
     c2c:	84 c0                	test   al,al
     c2e:	0f 85 97 fc ff ff    	jne    8cb <_Z8ConvolvePfS_S_iiiii+0x3c>
/home/omkar/courses/ece759/project/AVX/main.cpp:268
            pOutput[idxOut] = sum;
            }

        } 
    }
}
     c34:	c9                   	leave  
     c35:	c3                   	ret    

0000000000000c36 <_Z6RunCPUi>:
_Z6RunCPUi():
/home/omkar/courses/ece759/project/AVX/main.cpp:271

void RunCPU(int run)
{
     c36:	55                   	push   rbp
     c37:	48 89 e5             	mov    rbp,rsp
     c3a:	53                   	push   rbx
     c3b:	48 83 ec 38          	sub    rsp,0x38
     c3f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
/home/omkar/courses/ece759/project/AVX/main.cpp:272
    if (params.bCPUTiming)
     c42:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # c49 <_Z6RunCPUi+0x13>
     c49:	84 c0                	test   al,al
     c4b:	0f 84 fd 00 00 00    	je     d4e <_Z6RunCPUi+0x118>
/home/omkar/courses/ece759/project/AVX/main.cpp:274
    {
        cout << "\n********    Starting CPU (" << params.ompThreads[run]
     c51:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     c54:	48 98                	cdqe   
     c56:	48 89 c6             	mov    rsi,rax
     c59:	bf 00 00 00 00       	mov    edi,0x0
     c5e:	e8 00 00 00 00       	call   c63 <_Z6RunCPUi+0x2d>
     c63:	8b 18                	mov    ebx,DWORD PTR [rax]
     c65:	be 00 00 00 00       	mov    esi,0x0
     c6a:	bf 00 00 00 00       	mov    edi,0x0
     c6f:	e8 00 00 00 00       	call   c74 <_Z6RunCPUi+0x3e>
     c74:	89 de                	mov    esi,ebx
     c76:	48 89 c7             	mov    rdi,rax
     c79:	e8 00 00 00 00       	call   c7e <_Z6RunCPUi+0x48>
/home/omkar/courses/ece759/project/AVX/main.cpp:275
             << "-threads) run    ********" << endl;
     c7e:	be 00 00 00 00       	mov    esi,0x0
     c83:	48 89 c7             	mov    rdi,rax
     c86:	e8 00 00 00 00       	call   c8b <_Z6RunCPUi+0x55>
     c8b:	be 00 00 00 00       	mov    esi,0x0
     c90:	48 89 c7             	mov    rdi,rax
     c93:	e8 00 00 00 00       	call   c98 <_Z6RunCPUi+0x62>
/home/omkar/courses/ece759/project/AVX/main.cpp:277

        timers.counter.Reset();
     c98:	bf 00 00 00 00       	mov    edi,0x0
     c9d:	e8 00 00 00 00       	call   ca2 <_Z6RunCPUi+0x6c>
/home/omkar/courses/ece759/project/AVX/main.cpp:278
        timers.counter.Start();
     ca2:	bf 00 00 00 00       	mov    edi,0x0
     ca7:	e8 00 00 00 00       	call   cac <_Z6RunCPUi+0x76>
/home/omkar/courses/ece759/project/AVX/main.cpp:280

        for (int i = 0; i < params.nIterations; i++)
     cac:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
     cb3:	eb 5b                	jmp    d10 <_Z6RunCPUi+0xda>
/home/omkar/courses/ece759/project/AVX/main.cpp:285
            Convolve(hostBuffers.pInput, hostBuffers.pFilter, hostBuffers.pOutputCPU,
                        params.nInWidth,
                        params.nWidth, params.nHeight, 
                        params.nFilterWidth,
                        params.ompThreads[run]);
     cb5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     cb8:	48 98                	cdqe   
     cba:	48 89 c6             	mov    rsi,rax
     cbd:	bf 00 00 00 00       	mov    edi,0x0
     cc2:	e8 00 00 00 00       	call   cc7 <_Z6RunCPUi+0x91>
     cc7:	44 8b 00             	mov    r8d,DWORD PTR [rax]
     cca:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # cd0 <_Z6RunCPUi+0x9a>
     cd0:	44 8b 0d 00 00 00 00 	mov    r9d,DWORD PTR [rip+0x0]        # cd7 <_Z6RunCPUi+0xa1>
     cd7:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # cde <_Z6RunCPUi+0xa8>
     cde:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # ce4 <_Z6RunCPUi+0xae>
     ce4:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # ceb <_Z6RunCPUi+0xb5>
     ceb:	48 8b 35 00 00 00 00 	mov    rsi,QWORD PTR [rip+0x0]        # cf2 <_Z6RunCPUi+0xbc>
     cf2:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # cf9 <_Z6RunCPUi+0xc3>
     cf9:	44 89 44 24 08       	mov    DWORD PTR [rsp+0x8],r8d
     cfe:	89 3c 24             	mov    DWORD PTR [rsp],edi
     d01:	45 89 d0             	mov    r8d,r10d
     d04:	48 89 c7             	mov    rdi,rax
     d07:	e8 00 00 00 00       	call   d0c <_Z6RunCPUi+0xd6>
/home/omkar/courses/ece759/project/AVX/main.cpp:280
             << "-threads) run    ********" << endl;

        timers.counter.Reset();
        timers.counter.Start();

        for (int i = 0; i < params.nIterations; i++)
     d0c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
     d10:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # d16 <_Z6RunCPUi+0xe0>
     d16:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
     d19:	0f 9f c0             	setg   al
     d1c:	84 c0                	test   al,al
     d1e:	75 95                	jne    cb5 <_Z6RunCPUi+0x7f>
/home/omkar/courses/ece759/project/AVX/main.cpp:287
                        params.nInWidth,
                        params.nWidth, params.nHeight, 
                        params.nFilterWidth,
                        params.ompThreads[run]);

        timers.counter.Stop();
     d20:	bf 00 00 00 00       	mov    edi,0x0
     d25:	e8 00 00 00 00       	call   d2a <_Z6RunCPUi+0xf4>
/home/omkar/courses/ece759/project/AVX/main.cpp:288
        timers.dCpuTime = timers.counter.GetElapsedTime()/double(params.nIterations);
     d2a:	bf 00 00 00 00       	mov    edi,0x0
     d2f:	e8 00 00 00 00       	call   d34 <_Z6RunCPUi+0xfe>
     d34:	c5 f9 28 c8          	vmovapd xmm1,xmm0
     d38:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # d3e <_Z6RunCPUi+0x108>
     d3e:	c5 fb 2a c0          	vcvtsi2sd xmm0,xmm0,eax
     d42:	c5 f3 5e c0          	vdivsd xmm0,xmm1,xmm0
     d46:	c5 fb 11 05 00 00 00 	vmovsd QWORD PTR [rip+0x0],xmm0        # d4e <_Z6RunCPUi+0x118>
     d4d:	00 
/home/omkar/courses/ece759/project/AVX/main.cpp:290
    }
}
     d4e:	48 83 c4 38          	add    rsp,0x38
     d52:	5b                   	pop    rbx
     d53:	5d                   	pop    rbp
     d54:	c3                   	ret    

0000000000000d55 <_Z9PrintInfov>:
_Z9PrintInfov():
/home/omkar/courses/ece759/project/AVX/main.cpp:297
/////////////////////////////////////////////////////////////////
// Print info, timing 
/////////////////////////////////////////////////////////////////

void PrintInfo()
{
     d55:	55                   	push   rbp
     d56:	48 89 e5             	mov    rbp,rsp
     d59:	41 54                	push   r12
     d5b:	53                   	push   rbx
     d5c:	48 83 ec 10          	sub    rsp,0x10
/home/omkar/courses/ece759/project/AVX/main.cpp:298
    cout << endl;
     d60:	be 00 00 00 00       	mov    esi,0x0
     d65:	bf 00 00 00 00       	mov    edi,0x0
     d6a:	e8 00 00 00 00       	call   d6f <_Z9PrintInfov+0x1a>
/home/omkar/courses/ece759/project/AVX/main.cpp:299
    cout << "Width:          " << params.nWidth << endl;
     d6f:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # d75 <_Z9PrintInfov+0x20>
     d75:	be 00 00 00 00       	mov    esi,0x0
     d7a:	bf 00 00 00 00       	mov    edi,0x0
     d7f:	e8 00 00 00 00       	call   d84 <_Z9PrintInfov+0x2f>
     d84:	89 de                	mov    esi,ebx
     d86:	48 89 c7             	mov    rdi,rax
     d89:	e8 00 00 00 00       	call   d8e <_Z9PrintInfov+0x39>
     d8e:	be 00 00 00 00       	mov    esi,0x0
     d93:	48 89 c7             	mov    rdi,rax
     d96:	e8 00 00 00 00       	call   d9b <_Z9PrintInfov+0x46>
/home/omkar/courses/ece759/project/AVX/main.cpp:300
    cout << "Height:         " << params.nHeight << endl;
     d9b:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # da1 <_Z9PrintInfov+0x4c>
     da1:	be 00 00 00 00       	mov    esi,0x0
     da6:	bf 00 00 00 00       	mov    edi,0x0
     dab:	e8 00 00 00 00       	call   db0 <_Z9PrintInfov+0x5b>
     db0:	89 de                	mov    esi,ebx
     db2:	48 89 c7             	mov    rdi,rax
     db5:	e8 00 00 00 00       	call   dba <_Z9PrintInfov+0x65>
     dba:	be 00 00 00 00       	mov    esi,0x0
     dbf:	48 89 c7             	mov    rdi,rax
     dc2:	e8 00 00 00 00       	call   dc7 <_Z9PrintInfov+0x72>
/home/omkar/courses/ece759/project/AVX/main.cpp:302
    cout << "Filter Size:    " << params.nFilterWidth << " x "
                                << params.nFilterWidth << endl;
     dc7:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # dcd <_Z9PrintInfov+0x78>
/home/omkar/courses/ece759/project/AVX/main.cpp:301
void PrintInfo()
{
    cout << endl;
    cout << "Width:          " << params.nWidth << endl;
    cout << "Height:         " << params.nHeight << endl;
    cout << "Filter Size:    " << params.nFilterWidth << " x "
     dcd:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # dd4 <_Z9PrintInfov+0x7f>
     dd4:	be 00 00 00 00       	mov    esi,0x0
     dd9:	bf 00 00 00 00       	mov    edi,0x0
     dde:	e8 00 00 00 00       	call   de3 <_Z9PrintInfov+0x8e>
     de3:	44 89 e6             	mov    esi,r12d
     de6:	48 89 c7             	mov    rdi,rax
     de9:	e8 00 00 00 00       	call   dee <_Z9PrintInfov+0x99>
     dee:	be 00 00 00 00       	mov    esi,0x0
     df3:	48 89 c7             	mov    rdi,rax
     df6:	e8 00 00 00 00       	call   dfb <_Z9PrintInfov+0xa6>
/home/omkar/courses/ece759/project/AVX/main.cpp:302
                                << params.nFilterWidth << endl;
     dfb:	89 de                	mov    esi,ebx
     dfd:	48 89 c7             	mov    rdi,rax
     e00:	e8 00 00 00 00       	call   e05 <_Z9PrintInfov+0xb0>
     e05:	be 00 00 00 00       	mov    esi,0x0
     e0a:	48 89 c7             	mov    rdi,rax
     e0d:	e8 00 00 00 00       	call   e12 <_Z9PrintInfov+0xbd>
/home/omkar/courses/ece759/project/AVX/main.cpp:303
    cout << "Iterations:     " << params.nIterations << endl;
     e12:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # e18 <_Z9PrintInfov+0xc3>
     e18:	be 00 00 00 00       	mov    esi,0x0
     e1d:	bf 00 00 00 00       	mov    edi,0x0
     e22:	e8 00 00 00 00       	call   e27 <_Z9PrintInfov+0xd2>
     e27:	89 de                	mov    esi,ebx
     e29:	48 89 c7             	mov    rdi,rax
     e2c:	e8 00 00 00 00       	call   e31 <_Z9PrintInfov+0xdc>
     e31:	be 00 00 00 00       	mov    esi,0x0
     e36:	48 89 c7             	mov    rdi,rax
     e39:	e8 00 00 00 00       	call   e3e <_Z9PrintInfov+0xe9>
/home/omkar/courses/ece759/project/AVX/main.cpp:304
    cout << "CPU Timing:     " << (params.bCPUTiming ? "True":"False") << endl;
     e3e:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # e45 <_Z9PrintInfov+0xf0>
     e45:	84 c0                	test   al,al
     e47:	74 07                	je     e50 <_Z9PrintInfov+0xfb>
     e49:	bb 00 00 00 00       	mov    ebx,0x0
     e4e:	eb 05                	jmp    e55 <_Z9PrintInfov+0x100>
     e50:	bb 00 00 00 00       	mov    ebx,0x0
     e55:	be 00 00 00 00       	mov    esi,0x0
     e5a:	bf 00 00 00 00       	mov    edi,0x0
     e5f:	e8 00 00 00 00       	call   e64 <_Z9PrintInfov+0x10f>
     e64:	48 89 de             	mov    rsi,rbx
     e67:	48 89 c7             	mov    rdi,rax
     e6a:	e8 00 00 00 00       	call   e6f <_Z9PrintInfov+0x11a>
     e6f:	be 00 00 00 00       	mov    esi,0x0
     e74:	48 89 c7             	mov    rdi,rax
     e77:	e8 00 00 00 00       	call   e7c <_Z9PrintInfov+0x127>
/home/omkar/courses/ece759/project/AVX/main.cpp:305
    cout << "Testing:        ";
     e7c:	be 00 00 00 00       	mov    esi,0x0
     e81:	bf 00 00 00 00       	mov    edi,0x0
     e86:	e8 00 00 00 00       	call   e8b <_Z9PrintInfov+0x136>
/home/omkar/courses/ece759/project/AVX/main.cpp:307

    if (params.bCPUTiming)
     e8b:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # e92 <_Z9PrintInfov+0x13d>
     e92:	84 c0                	test   al,al
     e94:	74 57                	je     eed <_Z9PrintInfov+0x198>
/home/omkar/courses/ece759/project/AVX/main.cpp:308
        for (int run = 0; run < params.nOmpRuns; run++)
     e96:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
     e9d:	eb 3e                	jmp    edd <_Z9PrintInfov+0x188>
/home/omkar/courses/ece759/project/AVX/main.cpp:309
            cout << "CPU (" << params.ompThreads[run] << "-threads) , ";
     e9f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     ea2:	48 98                	cdqe   
     ea4:	48 89 c6             	mov    rsi,rax
     ea7:	bf 00 00 00 00       	mov    edi,0x0
     eac:	e8 00 00 00 00       	call   eb1 <_Z9PrintInfov+0x15c>
     eb1:	8b 18                	mov    ebx,DWORD PTR [rax]
     eb3:	be 00 00 00 00       	mov    esi,0x0
     eb8:	bf 00 00 00 00       	mov    edi,0x0
     ebd:	e8 00 00 00 00       	call   ec2 <_Z9PrintInfov+0x16d>
     ec2:	89 de                	mov    esi,ebx
     ec4:	48 89 c7             	mov    rdi,rax
     ec7:	e8 00 00 00 00       	call   ecc <_Z9PrintInfov+0x177>
     ecc:	be 00 00 00 00       	mov    esi,0x0
     ed1:	48 89 c7             	mov    rdi,rax
     ed4:	e8 00 00 00 00       	call   ed9 <_Z9PrintInfov+0x184>
/home/omkar/courses/ece759/project/AVX/main.cpp:308
    cout << "Iterations:     " << params.nIterations << endl;
    cout << "CPU Timing:     " << (params.bCPUTiming ? "True":"False") << endl;
    cout << "Testing:        ";

    if (params.bCPUTiming)
        for (int run = 0; run < params.nOmpRuns; run++)
     ed9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
     edd:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # ee3 <_Z9PrintInfov+0x18e>
     ee3:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
     ee6:	0f 9f c0             	setg   al
     ee9:	84 c0                	test   al,al
     eeb:	75 b2                	jne    e9f <_Z9PrintInfov+0x14a>
/home/omkar/courses/ece759/project/AVX/main.cpp:311
            cout << "CPU (" << params.ompThreads[run] << "-threads) , ";

    cout << endl << endl;
     eed:	be 00 00 00 00       	mov    esi,0x0
     ef2:	bf 00 00 00 00       	mov    edi,0x0
     ef7:	e8 00 00 00 00       	call   efc <_Z9PrintInfov+0x1a7>
     efc:	be 00 00 00 00       	mov    esi,0x0
     f01:	48 89 c7             	mov    rdi,rax
     f04:	e8 00 00 00 00       	call   f09 <_Z9PrintInfov+0x1b4>
/home/omkar/courses/ece759/project/AVX/main.cpp:312
}
     f09:	48 83 c4 10          	add    rsp,0x10
     f0d:	5b                   	pop    rbx
     f0e:	41 5c                	pop    r12
     f10:	5d                   	pop    rbp
     f11:	c3                   	ret    

0000000000000f12 <_Z12PrintCPUTimei>:
_Z12PrintCPUTimei():
/home/omkar/courses/ece759/project/AVX/main.cpp:315

void PrintCPUTime(int run)
{
     f12:	55                   	push   rbp
     f13:	48 89 e5             	mov    rbp,rsp
     f16:	53                   	push   rbx
     f17:	48 83 ec 18          	sub    rsp,0x18
     f1b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
/home/omkar/courses/ece759/project/AVX/main.cpp:316
    if (params.bCPUTiming)
     f1e:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # f25 <_Z12PrintCPUTimei+0x13>
     f25:	84 c0                	test   al,al
     f27:	74 61                	je     f8a <_Z12PrintCPUTimei+0x78>
/home/omkar/courses/ece759/project/AVX/main.cpp:317
        cout << "CPU (" << params.ompThreads[run] << "-threads): " << timers.dCpuTime << endl;
     f29:	c5 fb 10 05 00 00 00 	vmovsd xmm0,QWORD PTR [rip+0x0]        # f31 <_Z12PrintCPUTimei+0x1f>
     f30:	00 
     f31:	c5 fb 11 45 e0       	vmovsd QWORD PTR [rbp-0x20],xmm0
     f36:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     f39:	48 98                	cdqe   
     f3b:	48 89 c6             	mov    rsi,rax
     f3e:	bf 00 00 00 00       	mov    edi,0x0
     f43:	e8 00 00 00 00       	call   f48 <_Z12PrintCPUTimei+0x36>
     f48:	8b 18                	mov    ebx,DWORD PTR [rax]
     f4a:	be 00 00 00 00       	mov    esi,0x0
     f4f:	bf 00 00 00 00       	mov    edi,0x0
     f54:	e8 00 00 00 00       	call   f59 <_Z12PrintCPUTimei+0x47>
     f59:	89 de                	mov    esi,ebx
     f5b:	48 89 c7             	mov    rdi,rax
     f5e:	e8 00 00 00 00       	call   f63 <_Z12PrintCPUTimei+0x51>
     f63:	be 00 00 00 00       	mov    esi,0x0
     f68:	48 89 c7             	mov    rdi,rax
     f6b:	e8 00 00 00 00       	call   f70 <_Z12PrintCPUTimei+0x5e>
     f70:	c5 fb 10 45 e0       	vmovsd xmm0,QWORD PTR [rbp-0x20]
     f75:	48 89 c7             	mov    rdi,rax
     f78:	e8 00 00 00 00       	call   f7d <_Z12PrintCPUTimei+0x6b>
     f7d:	be 00 00 00 00       	mov    esi,0x0
     f82:	48 89 c7             	mov    rdi,rax
     f85:	e8 00 00 00 00       	call   f8a <_Z12PrintCPUTimei+0x78>
/home/omkar/courses/ece759/project/AVX/main.cpp:318
}
     f8a:	48 83 c4 18          	add    rsp,0x18
     f8e:	5b                   	pop    rbx
     f8f:	5d                   	pop    rbp
     f90:	c3                   	ret    

0000000000000f91 <main>:
main():
/home/omkar/courses/ece759/project/AVX/main.cpp:325
/////////////////////////////////////////////////////////////////
// Main 
/////////////////////////////////////////////////////////////////

int main(int argc, char * argv[])
{
     f91:	55                   	push   rbp
     f92:	48 89 e5             	mov    rbp,rsp
     f95:	53                   	push   rbx
     f96:	48 83 ec 28          	sub    rsp,0x28
     f9a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
     f9d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
/home/omkar/courses/ece759/project/AVX/main.cpp:328
    try
    {
        InitParams(argc, argv);
     fa1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
     fa5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     fa8:	48 89 d6             	mov    rsi,rdx
     fab:	89 c7                	mov    edi,eax
     fad:	e8 00 00 00 00       	call   fb2 <main+0x21>
/home/omkar/courses/ece759/project/AVX/main.cpp:329
        PrintInfo();
     fb2:	e8 00 00 00 00       	call   fb7 <main+0x26>
/home/omkar/courses/ece759/project/AVX/main.cpp:331

        InitHostBuffers();
     fb7:	e8 00 00 00 00       	call   fbc <main+0x2b>
/home/omkar/courses/ece759/project/AVX/main.cpp:333

        for (int run = 0; run < params.nOmpRuns; run++)
     fbc:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
     fc3:	eb 27                	jmp    fec <main+0x5b>
/home/omkar/courses/ece759/project/AVX/main.cpp:335
        {
            ClearBuffer(hostBuffers.pOutputCPU);
     fc5:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # fcc <main+0x3b>
     fcc:	48 89 c7             	mov    rdi,rax
     fcf:	e8 00 00 00 00       	call   fd4 <main+0x43>
/home/omkar/courses/ece759/project/AVX/main.cpp:336
            RunCPU(run);
     fd4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     fd7:	89 c7                	mov    edi,eax
     fd9:	e8 00 00 00 00       	call   fde <main+0x4d>
/home/omkar/courses/ece759/project/AVX/main.cpp:337
            PrintCPUTime(run);
     fde:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     fe1:	89 c7                	mov    edi,eax
     fe3:	e8 00 00 00 00       	call   fe8 <main+0x57>
/home/omkar/courses/ece759/project/AVX/main.cpp:333
        InitParams(argc, argv);
        PrintInfo();

        InitHostBuffers();

        for (int run = 0; run < params.nOmpRuns; run++)
     fe8:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
     fec:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # ff2 <main+0x61>
     ff2:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
     ff5:	0f 9f c0             	setg   al
     ff8:	84 c0                	test   al,al
     ffa:	75 c9                	jne    fc5 <main+0x34>
/home/omkar/courses/ece759/project/AVX/main.cpp:340
            ClearBuffer(hostBuffers.pOutputCPU);
            RunCPU(run);
            PrintCPUTime(run);
        }

        ReleaseHostBuffers();
     ffc:	e8 00 00 00 00       	call   1001 <main+0x70>
/home/omkar/courses/ece759/project/AVX/main.cpp:353
    {
        cerr << "Exception caught in main()" << endl;
        ReleaseHostBuffers();
    }

    return 0;
    1001:	b8 00 00 00 00       	mov    eax,0x0
/home/omkar/courses/ece759/project/AVX/main.cpp:354
}
    1006:	48 83 c4 28          	add    rsp,0x28
    100a:	5b                   	pop    rbx
    100b:	5d                   	pop    rbp
    100c:	c3                   	ret    
    100d:	48 89 c3             	mov    rbx,rax
/home/omkar/courses/ece759/project/AVX/main.cpp:346
    }
    catch(std::string msg)
    {
        cerr << "Exception caught in main(): " << msg << endl;
        ReleaseHostBuffers();
    }
    1010:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    1014:	48 89 c7             	mov    rdi,rax
    1017:	e8 00 00 00 00       	call   101c <main+0x8b>
    101c:	eb 03                	jmp    1021 <main+0x90>
    101e:	48 89 c3             	mov    rbx,rax
/home/omkar/courses/ece759/project/AVX/main.cpp:342
            PrintCPUTime(run);
        }

        ReleaseHostBuffers();
    }
    catch(std::string msg)
    1021:	e8 00 00 00 00       	call   1026 <main+0x95>
    1026:	48 89 d8             	mov    rax,rbx
    1029:	48 89 c7             	mov    rdi,rax
    102c:	e8 00 00 00 00       	call   1031 <main+0xa0>
    1031:	48 89 c3             	mov    rbx,rax
/home/omkar/courses/ece759/project/AVX/main.cpp:347
    {
        cerr << "Exception caught in main(): " << msg << endl;
        ReleaseHostBuffers();
    }
    catch(...)
    1034:	e8 00 00 00 00       	call   1039 <main+0xa8>
    1039:	48 89 d8             	mov    rax,rbx
    103c:	48 89 c7             	mov    rdi,rax
    103f:	e8 00 00 00 00       	call   1044 <main+0xb3>
    1044:	48 89 c3             	mov    rbx,rax
    1047:	48 89 d0             	mov    rax,rdx
    104a:	48 83 f8 01          	cmp    rax,0x1
    104e:	75 6e                	jne    10be <main+0x12d>
/home/omkar/courses/ece759/project/AVX/main.cpp:342
            PrintCPUTime(run);
        }

        ReleaseHostBuffers();
    }
    catch(std::string msg)
    1050:	48 89 d8             	mov    rax,rbx
    1053:	48 89 c7             	mov    rdi,rax
    1056:	e8 00 00 00 00       	call   105b <main+0xca>
    105b:	48 89 c2             	mov    rdx,rax
    105e:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    1062:	48 89 d6             	mov    rsi,rdx
    1065:	48 89 c7             	mov    rdi,rax
    1068:	e8 00 00 00 00       	call   106d <main+0xdc>
    106d:	48 89 d8             	mov    rax,rbx
    1070:	48 89 c7             	mov    rdi,rax
    1073:	e8 00 00 00 00       	call   1078 <main+0xe7>
/home/omkar/courses/ece759/project/AVX/main.cpp:344
    {
        cerr << "Exception caught in main(): " << msg << endl;
    1078:	be 00 00 00 00       	mov    esi,0x0
    107d:	bf 00 00 00 00       	mov    edi,0x0
    1082:	e8 00 00 00 00       	call   1087 <main+0xf6>
    1087:	48 8d 55 e0          	lea    rdx,[rbp-0x20]
    108b:	48 89 d6             	mov    rsi,rdx
    108e:	48 89 c7             	mov    rdi,rax
    1091:	e8 00 00 00 00       	call   1096 <main+0x105>
    1096:	be 00 00 00 00       	mov    esi,0x0
    109b:	48 89 c7             	mov    rdi,rax
    109e:	e8 00 00 00 00       	call   10a3 <main+0x112>
/home/omkar/courses/ece759/project/AVX/main.cpp:345
        ReleaseHostBuffers();
    10a3:	e8 00 00 00 00       	call   10a8 <main+0x117>
/home/omkar/courses/ece759/project/AVX/main.cpp:346
    }
    10a8:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    10ac:	48 89 c7             	mov    rdi,rax
    10af:	e8 00 00 00 00       	call   10b4 <main+0x123>
/home/omkar/courses/ece759/project/AVX/main.cpp:342
            PrintCPUTime(run);
        }

        ReleaseHostBuffers();
    }
    catch(std::string msg)
    10b4:	e8 00 00 00 00       	call   10b9 <main+0x128>
    10b9:	e9 43 ff ff ff       	jmp    1001 <main+0x70>
/home/omkar/courses/ece759/project/AVX/main.cpp:347
    {
        cerr << "Exception caught in main(): " << msg << endl;
        ReleaseHostBuffers();
    }
    catch(...)
    10be:	48 89 d8             	mov    rax,rbx
    10c1:	48 89 c7             	mov    rdi,rax
    10c4:	e8 00 00 00 00       	call   10c9 <main+0x138>
/home/omkar/courses/ece759/project/AVX/main.cpp:349
    {
        cerr << "Exception caught in main()" << endl;
    10c9:	be 00 00 00 00       	mov    esi,0x0
    10ce:	bf 00 00 00 00       	mov    edi,0x0
    10d3:	e8 00 00 00 00       	call   10d8 <main+0x147>
    10d8:	be 00 00 00 00       	mov    esi,0x0
    10dd:	48 89 c7             	mov    rdi,rax
    10e0:	e8 00 00 00 00       	call   10e5 <main+0x154>
/home/omkar/courses/ece759/project/AVX/main.cpp:350
        ReleaseHostBuffers();
    10e5:	e8 00 00 00 00       	call   10ea <main+0x159>
/home/omkar/courses/ece759/project/AVX/main.cpp:347
    catch(std::string msg)
    {
        cerr << "Exception caught in main(): " << msg << endl;
        ReleaseHostBuffers();
    }
    catch(...)
    10ea:	e8 00 00 00 00       	call   10ef <main+0x15e>
    10ef:	e9 0d ff ff ff       	jmp    1001 <main+0x70>

00000000000010f4 <_Z41__static_initialization_and_destruction_0ii>:
__static_initialization_and_destruction_0():
/home/omkar/courses/ece759/project/AVX/main.cpp:354
        cerr << "Exception caught in main()" << endl;
        ReleaseHostBuffers();
    }

    return 0;
}
    10f4:	55                   	push   rbp
    10f5:	48 89 e5             	mov    rbp,rsp
    10f8:	48 83 ec 10          	sub    rsp,0x10
    10fc:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    10ff:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
    1102:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
    1106:	75 6c                	jne    1174 <_Z41__static_initialization_and_destruction_0ii+0x80>
    1108:	81 7d f8 ff ff 00 00 	cmp    DWORD PTR [rbp-0x8],0xffff
    110f:	75 63                	jne    1174 <_Z41__static_initialization_and_destruction_0ii+0x80>
/usr/include/c++/4.6/iostream:75
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
    1111:	bf 00 00 00 00       	mov    edi,0x0
    1116:	e8 00 00 00 00       	call   111b <_Z41__static_initialization_and_destruction_0ii+0x27>
    111b:	b8 00 00 00 00       	mov    eax,0x0
    1120:	ba 00 00 00 00       	mov    edx,0x0
    1125:	be 00 00 00 00       	mov    esi,0x0
    112a:	48 89 c7             	mov    rdi,rax
    112d:	e8 00 00 00 00       	call   1132 <_Z41__static_initialization_and_destruction_0ii+0x3e>
/home/omkar/courses/ece759/project/AVX/Params.h:113
    std::vector<int> ompThreads;
    int nOmpRuns;       //ompThreads.size()

    bool bCPUTiming;            //Time CPU performance

} params;
    1132:	bf 00 00 00 00       	mov    edi,0x0
    1137:	e8 00 00 00 00       	call   113c <_Z41__static_initialization_and_destruction_0ii+0x48>
    113c:	b8 00 00 00 00       	mov    eax,0x0
    1141:	ba 00 00 00 00       	mov    edx,0x0
    1146:	be 00 00 00 00       	mov    esi,0x0
    114b:	48 89 c7             	mov    rdi,rax
    114e:	e8 00 00 00 00       	call   1153 <_Z41__static_initialization_and_destruction_0ii+0x5f>
/home/omkar/courses/ece759/project/AVX/main.cpp:139

struct timerStruct
{
    double dCpuTime;
    CPerfCounter counter;
} timers;
    1153:	bf 00 00 00 00       	mov    edi,0x0
    1158:	e8 00 00 00 00       	call   115d <_Z41__static_initialization_and_destruction_0ii+0x69>
    115d:	b8 00 00 00 00       	mov    eax,0x0
    1162:	ba 00 00 00 00       	mov    edx,0x0
    1167:	be 00 00 00 00       	mov    esi,0x0
    116c:	48 89 c7             	mov    rdi,rax
    116f:	e8 00 00 00 00       	call   1174 <_Z41__static_initialization_and_destruction_0ii+0x80>
/home/omkar/courses/ece759/project/AVX/main.cpp:354
        cerr << "Exception caught in main()" << endl;
        ReleaseHostBuffers();
    }

    return 0;
}
    1174:	c9                   	leave  
    1175:	c3                   	ret    

0000000000001176 <_GLOBAL__sub_I_params>:
_GLOBAL__sub_I_params():
    1176:	55                   	push   rbp
    1177:	48 89 e5             	mov    rbp,rsp
    117a:	be ff ff 00 00       	mov    esi,0xffff
    117f:	bf 01 00 00 00       	mov    edi,0x1
    1184:	e8 6b ff ff ff       	call   10f4 <_Z41__static_initialization_and_destruction_0ii>
    1189:	5d                   	pop    rbp
    118a:	c3                   	ret    

Disassembly of section .text._ZnwmPv:

0000000000000000 <_ZnwmPv>:
_ZnwmPv():
/usr/include/c++/4.6/new:103
void* operator new[](std::size_t, const std::nothrow_t&) throw();
void operator delete(void*, const std::nothrow_t&) throw();
void operator delete[](void*, const std::nothrow_t&) throw();

// Default placement versions of operator new.
inline void* operator new(std::size_t, void* __p) throw() { return __p; }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
   c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  10:	5d                   	pop    rbp
  11:	c3                   	ret    

Disassembly of section .text._ZN11paramStructC2Ev:

0000000000000000 <_ZN11paramStructC1Ev>:
paramStruct():
/home/omkar/courses/ece759/project/AVX/Params.h:98
#ifndef PARAMS_H_
#define PARAMS_H_

#define DEFAULT_NUM_THREADS 4

struct paramStruct
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 83 c0 18          	add    rax,0x18
  14:	48 89 c7             	mov    rdi,rax
  17:	e8 00 00 00 00       	call   1c <_ZN11paramStructC1Ev+0x1c>
  1c:	c9                   	leave  
  1d:	c3                   	ret    

Disassembly of section .text._ZN11timerStructC2Ev:

0000000000000000 <_ZN11timerStructC1Ev>:
timerStruct():
/home/omkar/courses/ece759/project/AVX/main.cpp:135
    float * pInput;
    float * pFilter;
    float * pOutputCPU;
} hostBuffers;

struct timerStruct
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 83 c0 08          	add    rax,0x8
  14:	48 89 c7             	mov    rdi,rax
  17:	e8 00 00 00 00       	call   1c <_ZN11timerStructC1Ev+0x1c>
  1c:	c9                   	leave  
  1d:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEEC2Ev:

0000000000000000 <_ZNSt6vectorIiSaIiEEC1Ev>:
vector():
/usr/include/c++/4.6/bits/stl_vector.h:217
      // [23.2.4.1] construct/copy/destroy
      // (assign() and get_allocator() are also listed in this section)
      /**
       *  @brief  Default constructor creates no elements.
       */
      vector()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_vector.h:218
      : _Base() { }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSt6vectorIiSaIiEEC1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEED2Ev:

0000000000000000 <_ZNSt6vectorIiSaIiEED1Ev>:
~vector():
/usr/include/c++/4.6/bits/stl_vector.h:349
       *  The dtor only erases the elements, and note that if the
       *  elements themselves are pointers, the pointed-to memory is
       *  not touched in any way.  Managing the pointer is the user's
       *  responsibility.
       */
      ~vector()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	53                   	push   rbx
   5:	48 83 ec 18          	sub    rsp,0x18
   9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
/usr/include/c++/4.6/bits/stl_vector.h:350
      { std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
   d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  11:	48 89 c7             	mov    rdi,rax
  14:	e8 00 00 00 00       	call   19 <_ZNSt6vectorIiSaIiEED1Ev+0x19>
  19:	48 89 c2             	mov    rdx,rax
  1c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  20:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  28:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2b:	48 89 ce             	mov    rsi,rcx
  2e:	48 89 c7             	mov    rdi,rax
  31:	e8 00 00 00 00       	call   36 <_ZNSt6vectorIiSaIiEED1Ev+0x36>
/usr/include/c++/4.6/bits/stl_vector.h:351
		      _M_get_Tp_allocator()); }
  36:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  3a:	48 89 c7             	mov    rdi,rax
  3d:	e8 00 00 00 00       	call   42 <_ZNSt6vectorIiSaIiEED1Ev+0x42>
  42:	48 83 c4 18          	add    rsp,0x18
  46:	5b                   	pop    rbx
  47:	5d                   	pop    rbp
  48:	c3                   	ret    
  49:	48 89 c3             	mov    rbx,rax
  4c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  50:	48 89 c7             	mov    rdi,rax
  53:	e8 00 00 00 00       	call   58 <_ZNSt6vectorIiSaIiEED1Ev+0x58>
  58:	48 89 d8             	mov    rax,rbx
  5b:	48 89 c7             	mov    rdi,rax
  5e:	e8 00 00 00 00       	call   63 <timers+0x3>

Disassembly of section .text._ZNSt6vectorIiSaIiEE9push_backERKi:

0000000000000000 <_ZNSt6vectorIiSaIiEE9push_backERKi>:
_ZNSt6vectorIiSaIiEE9push_backERKi():
/usr/include/c++/4.6/bits/stl_vector.h:826
       *  to it.  Due to the nature of a %vector this operation can be
       *  done in constant time if the %vector has preallocated space
       *  available.
       */
      void
      push_back(const value_type& __x)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
/usr/include/c++/4.6/bits/stl_vector.h:828
      {
	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
  10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  14:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  20:	48 39 c2             	cmp    rdx,rax
  23:	74 31                	je     56 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x56>
/usr/include/c++/4.6/bits/stl_vector.h:830
	  {
	    this->_M_impl.construct(this->_M_impl._M_finish, __x);
  25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  29:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  31:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  35:	48 89 ce             	mov    rsi,rcx
  38:	48 89 c7             	mov    rdi,rax
  3b:	e8 00 00 00 00       	call   40 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x40>
/usr/include/c++/4.6/bits/stl_vector.h:831
	    ++this->_M_impl._M_finish;
  40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  44:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  48:	48 8d 50 04          	lea    rdx,[rax+0x4]
  4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  50:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  54:	eb 22                	jmp    78 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x78>
/usr/include/c++/4.6/bits/stl_vector.h:834
	  }
	else
	  _M_insert_aux(end(), __x);
  56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  5a:	48 89 c7             	mov    rdi,rax
  5d:	e8 00 00 00 00       	call   62 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x62>
  62:	48 89 c1             	mov    rcx,rax
  65:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  6d:	48 89 ce             	mov    rsi,rcx
  70:	48 89 c7             	mov    rdi,rax
  73:	e8 00 00 00 00       	call   78 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x78>
/usr/include/c++/4.6/bits/stl_vector.h:835
      }
  78:	c9                   	leave  
  79:	c3                   	ret    

Disassembly of section .text._ZNKSt6vectorIiSaIiEE4sizeEv:

0000000000000000 <_ZNKSt6vectorIiSaIiEE4sizeEv>:
_ZNKSt6vectorIiSaIiEE4sizeEv():
/usr/include/c++/4.6/bits/stl_vector.h:570
#endif

      // [23.2.4.2] capacity
      /**  Returns the number of elements in the %vector.  */
      size_type
      size() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_vector.h:571
      { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  10:	48 89 c2             	mov    rdx,rax
  13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  17:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1a:	48 89 d1             	mov    rcx,rdx
  1d:	48 29 c1             	sub    rcx,rax
  20:	48 89 c8             	mov    rax,rcx
  23:	48 c1 f8 02          	sar    rax,0x2
  27:	5d                   	pop    rbp
  28:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEEixEm:

0000000000000000 <_ZNSt6vectorIiSaIiEEixEm>:
_ZNSt6vectorIiSaIiEEixEm():
/usr/include/c++/4.6/bits/stl_vector.h:695
       *  Note that data access with this operator is unchecked and
       *  out_of_range lookups are not defined. (For checked lookups
       *  see at().)
       */
      reference
      operator[](size_type __n)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
/usr/include/c++/4.6/bits/stl_vector.h:696
      { return *(this->_M_impl._M_start + __n); }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 8b 00             	mov    rax,QWORD PTR [rax]
  13:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  17:	48 c1 e2 02          	shl    rdx,0x2
  1b:	48 01 d0             	add    rax,rdx
  1e:	5d                   	pop    rbp
  1f:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev>:
~_Vector_impl():
/usr/include/c++/4.6/bits/stl_vector.h:75
  template<typename _Tp, typename _Alloc>
    struct _Vector_base
    {
      typedef typename _Alloc::template rebind<_Tp>::other _Tp_alloc_type;

      struct _Vector_impl 
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEEC2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEEC1Ev>:
_Vector_base():
/usr/include/c++/4.6/bits/stl_vector.h:106

      allocator_type
      get_allocator() const
      { return allocator_type(_M_get_Tp_allocator()); }

      _Vector_base()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_vector.h:107
      : _M_impl() { }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSt12_Vector_baseIiSaIiEEC1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEED2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEED1Ev>:
~_Vector_base():
/usr/include/c++/4.6/bits/stl_vector.h:141
	__x._M_impl._M_finish = 0;
	__x._M_impl._M_end_of_storage = 0;
      }
#endif

      ~_Vector_base()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	53                   	push   rbx
   5:	48 83 ec 18          	sub    rsp,0x18
   9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
/usr/include/c++/4.6/bits/stl_vector.h:142
      { _M_deallocate(this->_M_impl._M_start, this->_M_impl._M_end_of_storage
   d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  11:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  15:	48 89 c2             	mov    rdx,rax
  18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1f:	48 89 d1             	mov    rcx,rdx
  22:	48 29 c1             	sub    rcx,rax
  25:	48 89 c8             	mov    rax,rcx
  28:	48 c1 f8 02          	sar    rax,0x2
  2c:	48 89 c2             	mov    rdx,rax
  2f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  33:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  36:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  3a:	48 89 ce             	mov    rsi,rcx
  3d:	48 89 c7             	mov    rdi,rax
  40:	e8 00 00 00 00       	call   45 <_ZNSt12_Vector_baseIiSaIiEED1Ev+0x45>
/usr/include/c++/4.6/bits/stl_vector.h:143
		      - this->_M_impl._M_start); }
  45:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  49:	48 89 c7             	mov    rdi,rax
  4c:	e8 00 00 00 00       	call   51 <_ZNSt12_Vector_baseIiSaIiEED1Ev+0x51>
  51:	48 83 c4 18          	add    rsp,0x18
  55:	5b                   	pop    rbx
  56:	5d                   	pop    rbp
  57:	c3                   	ret    
  58:	48 89 c3             	mov    rbx,rax
  5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  5f:	48 89 c7             	mov    rdi,rax
  62:	e8 00 00 00 00       	call   67 <_ZNSt12_Vector_baseIiSaIiEED1Ev+0x67>
  67:	48 89 d8             	mov    rax,rbx
  6a:	48 89 c7             	mov    rdi,rax
  6d:	e8 00 00 00 00       	call   72 <timers+0x12>

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>:
_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv():
/usr/include/c++/4.6/bits/stl_vector.h:95
      
    public:
      typedef _Alloc allocator_type;

      _Tp_alloc_type&
      _M_get_Tp_allocator()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_vector.h:96
      { return *static_cast<_Tp_alloc_type*>(&this->_M_impl); }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	5d                   	pop    rbp
   d:	c3                   	ret    

Disassembly of section .text._ZSt8_DestroyIPiiEvT_S1_RSaIT0_E:

0000000000000000 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E>:
_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E():
/usr/include/c++/4.6/bits/stl_construct.h:150
	__alloc.destroy(std::__addressof(*__first));
    }

  template<typename _ForwardIterator, typename _Tp>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/include/c++/4.6/bits/stl_construct.h:153
	     allocator<_Tp>&)
    {
      _Destroy(__first, __last);
  14:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1c:	48 89 d6             	mov    rsi,rdx
  1f:	48 89 c7             	mov    rdi,rax
  22:	e8 00 00 00 00       	call   27 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E+0x27>
/usr/include/c++/4.6/bits/stl_construct.h:154
    }
  27:	c9                   	leave  
  28:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi>:
_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi():
/usr/include/c++/4.6/ext/new_allocator.h:107
      { return size_t(-1) / sizeof(_Tp); }

      // _GLIBCXX_RESOLVE_LIB_DEFECTS
      // 402. wrong new expression in [some_] allocator::construct
      void 
      construct(pointer __p, const _Tp& __val) 
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/include/c++/4.6/ext/new_allocator.h:108
      { ::new((void *)__p) _Tp(__val); }
  14:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  18:	48 89 c6             	mov    rsi,rax
  1b:	bf 04 00 00 00       	mov    edi,0x4
  20:	e8 00 00 00 00       	call   25 <_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi+0x25>
  25:	48 85 c0             	test   rax,rax
  28:	74 08                	je     32 <_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi+0x32>
  2a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  2e:	8b 12                	mov    edx,DWORD PTR [rdx]
  30:	89 10                	mov    DWORD PTR [rax],edx
  32:	c9                   	leave  
  33:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi:

0000000000000000 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi>:
_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi():
/usr/include/c++/4.6/bits/vector.tcc:300
      vector<_Tp, _Alloc>::
      _M_insert_aux(iterator __position, _Args&&... __args)
#else
  template<typename _Tp, typename _Alloc>
    void
    vector<_Tp, _Alloc>::
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	41 54                	push   r12
   6:	53                   	push   rbx
   7:	48 83 ec 50          	sub    rsp,0x50
   b:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
   f:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  13:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
/usr/include/c++/4.6/bits/vector.tcc:304
    _M_insert_aux(iterator __position, const _Tp& __x)
#endif
    {
      if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
  17:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  1b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  1f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  23:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  27:	48 39 c2             	cmp    rdx,rax
  2a:	0f 84 8b 00 00 00    	je     bb <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0xbb>
/usr/include/c++/4.6/bits/vector.tcc:306
	{
	  this->_M_impl.construct(this->_M_impl._M_finish,
  30:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  34:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  38:	48 8d 50 fc          	lea    rdx,[rax-0x4]
  3c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  44:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  48:	48 89 ce             	mov    rsi,rcx
  4b:	48 89 c7             	mov    rdi,rax
  4e:	e8 00 00 00 00       	call   53 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x53>
/usr/include/c++/4.6/bits/vector.tcc:309
				  _GLIBCXX_MOVE(*(this->_M_impl._M_finish
						  - 1)));
	  ++this->_M_impl._M_finish;
  53:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  57:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  5b:	48 8d 50 04          	lea    rdx,[rax+0x4]
  5f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  63:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
/usr/include/c++/4.6/bits/vector.tcc:311
#ifndef __GXX_EXPERIMENTAL_CXX0X__
	  _Tp __x_copy = __x;
  67:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  6b:	8b 00                	mov    eax,DWORD PTR [rax]
  6d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
/usr/include/c++/4.6/bits/vector.tcc:313
#endif
	  _GLIBCXX_MOVE_BACKWARD3(__position.base(),
  70:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  74:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  78:	4c 8d 60 fc          	lea    r12,[rax-0x4]
  7c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  84:	48 8d 58 f8          	lea    rbx,[rax-0x8]
  88:	48 8d 45 b0          	lea    rax,[rbp-0x50]
  8c:	48 89 c7             	mov    rdi,rax
  8f:	e8 00 00 00 00       	call   94 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x94>
  94:	48 8b 00             	mov    rax,QWORD PTR [rax]
  97:	4c 89 e2             	mov    rdx,r12
  9a:	48 89 de             	mov    rsi,rbx
  9d:	48 89 c7             	mov    rdi,rax
  a0:	e8 00 00 00 00       	call   a5 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0xa5>
/usr/include/c++/4.6/bits/vector.tcc:317
				  this->_M_impl._M_finish - 2,
				  this->_M_impl._M_finish - 1);
#ifndef __GXX_EXPERIMENTAL_CXX0X__
	  *__position = __x_copy;
  a5:	48 8d 45 b0          	lea    rax,[rbp-0x50]
  a9:	48 89 c7             	mov    rdi,rax
  ac:	e8 00 00 00 00       	call   b1 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0xb1>
  b1:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  b4:	89 10                	mov    DWORD PTR [rax],edx
/usr/include/c++/4.6/bits/vector.tcc:373
			- this->_M_impl._M_start);
	  this->_M_impl._M_start = __new_start;
	  this->_M_impl._M_finish = __new_finish;
	  this->_M_impl._M_end_of_storage = __new_start + __len;
	}
    }
  b6:	e9 17 02 00 00       	jmp    2d2 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2d2>
/usr/include/c++/4.6/bits/vector.tcc:325
#endif
	}
      else
	{
	  const size_type __len =
	    _M_check_len(size_type(1), "vector::_M_insert_aux");
  bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  bf:	ba 00 00 00 00       	mov    edx,0x0
  c4:	be 01 00 00 00       	mov    esi,0x1
  c9:	48 89 c7             	mov    rdi,rax
  cc:	e8 00 00 00 00       	call   d1 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0xd1>
  d1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
/usr/include/c++/4.6/bits/vector.tcc:326
	  const size_type __elems_before = __position - begin();
  d5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  d9:	48 89 c7             	mov    rdi,rax
  dc:	e8 00 00 00 00       	call   e1 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0xe1>
  e1:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  e5:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
  e9:	48 8d 45 b0          	lea    rax,[rbp-0x50]
  ed:	48 89 d6             	mov    rsi,rdx
  f0:	48 89 c7             	mov    rdi,rax
  f3:	e8 00 00 00 00       	call   f8 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0xf8>
  f8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
/usr/include/c++/4.6/bits/vector.tcc:327
	  pointer __new_start(this->_M_allocate(__len));
  fc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 100:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
 104:	48 89 d6             	mov    rsi,rdx
 107:	48 89 c7             	mov    rdi,rax
 10a:	e8 00 00 00 00       	call   10f <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x10f>
 10f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
/usr/include/c++/4.6/bits/vector.tcc:328
	  pointer __new_finish(__new_start);
 113:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 117:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
/usr/include/c++/4.6/bits/vector.tcc:335
	    {
	      // The order of the three operations is dictated by the C++0x
	      // case, where the moves could alter a new element belonging
	      // to the existing vector.  This is an issue only for callers
	      // taking the element by const lvalue ref (see 23.1/13).
	      this->_M_impl.construct(__new_start + __elems_before,
 11b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 11f:	48 c1 e0 02          	shl    rax,0x2
 123:	48 89 c1             	mov    rcx,rax
 126:	48 03 4d e0          	add    rcx,QWORD PTR [rbp-0x20]
 12a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 12e:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
 132:	48 89 ce             	mov    rsi,rcx
 135:	48 89 c7             	mov    rdi,rax
 138:	e8 00 00 00 00       	call   13d <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x13d>
/usr/include/c++/4.6/bits/vector.tcc:341
#ifdef __GXX_EXPERIMENTAL_CXX0X__
				      std::forward<_Args>(__args)...);
#else
	                              __x);
#endif
	      __new_finish = 0;
 13d:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
 144:	00 
/usr/include/c++/4.6/bits/vector.tcc:343

	      __new_finish =
 145:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 149:	48 89 c7             	mov    rdi,rax
 14c:	e8 00 00 00 00       	call   151 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x151>
 151:	48 89 c3             	mov    rbx,rax
 154:	48 8d 45 b0          	lea    rax,[rbp-0x50]
 158:	48 89 c7             	mov    rdi,rax
 15b:	e8 00 00 00 00       	call   160 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x160>
 160:	48 8b 30             	mov    rsi,QWORD PTR [rax]
 163:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 167:	48 8b 00             	mov    rax,QWORD PTR [rax]
 16a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
 16e:	48 89 d9             	mov    rcx,rbx
 171:	48 89 c7             	mov    rdi,rax
 174:	e8 00 00 00 00       	call   179 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x179>
 179:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
/usr/include/c++/4.6/bits/vector.tcc:347
		std::__uninitialized_move_a(this->_M_impl._M_start,
					    __position.base(), __new_start,
					    _M_get_Tp_allocator());
	      ++__new_finish;
 17d:	48 83 45 c8 04       	add    QWORD PTR [rbp-0x38],0x4
/usr/include/c++/4.6/bits/vector.tcc:349

	      __new_finish =
 182:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 186:	48 89 c7             	mov    rdi,rax
 189:	e8 00 00 00 00       	call   18e <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x18e>
 18e:	49 89 c4             	mov    r12,rax
 191:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 195:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
 199:	48 8d 45 b0          	lea    rax,[rbp-0x50]
 19d:	48 89 c7             	mov    rdi,rax
 1a0:	e8 00 00 00 00       	call   1a5 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1a5>
 1a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
 1a8:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
 1ac:	4c 89 e1             	mov    rcx,r12
 1af:	48 89 de             	mov    rsi,rbx
 1b2:	48 89 c7             	mov    rdi,rax
 1b5:	e8 00 00 00 00       	call   1ba <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1ba>
 1ba:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
/usr/include/c++/4.6/bits/vector.tcc:364
	      else
		std::_Destroy(__new_start, __new_finish, _M_get_Tp_allocator());
	      _M_deallocate(__new_start, __len);
	      __throw_exception_again;
	    }
	  std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
 1be:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1c2:	48 89 c7             	mov    rdi,rax
 1c5:	e8 00 00 00 00       	call   1ca <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1ca>
 1ca:	48 89 c2             	mov    rdx,rax
 1cd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1d1:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
 1d5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
 1dc:	48 89 ce             	mov    rsi,rcx
 1df:	48 89 c7             	mov    rdi,rax
 1e2:	e8 00 00 00 00       	call   1e7 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1e7>
/usr/include/c++/4.6/bits/vector.tcc:366
			_M_get_Tp_allocator());
	  _M_deallocate(this->_M_impl._M_start,
 1e7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1eb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
 1ef:	48 89 c2             	mov    rdx,rax
 1f2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1f6:	48 8b 00             	mov    rax,QWORD PTR [rax]
 1f9:	48 89 d1             	mov    rcx,rdx
 1fc:	48 29 c1             	sub    rcx,rax
 1ff:	48 89 c8             	mov    rax,rcx
 202:	48 c1 f8 02          	sar    rax,0x2
 206:	48 89 c2             	mov    rdx,rax
 209:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 20d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
 210:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 214:	48 89 ce             	mov    rsi,rcx
 217:	48 89 c7             	mov    rdi,rax
 21a:	e8 00 00 00 00       	call   21f <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x21f>
/usr/include/c++/4.6/bits/vector.tcc:369
			this->_M_impl._M_end_of_storage
			- this->_M_impl._M_start);
	  this->_M_impl._M_start = __new_start;
 21f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 223:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
 227:	48 89 10             	mov    QWORD PTR [rax],rdx
/usr/include/c++/4.6/bits/vector.tcc:370
	  this->_M_impl._M_finish = __new_finish;
 22a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 22e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
 232:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
/usr/include/c++/4.6/bits/vector.tcc:371
	  this->_M_impl._M_end_of_storage = __new_start + __len;
 236:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
 23a:	48 c1 e0 02          	shl    rax,0x2
 23e:	48 89 c2             	mov    rdx,rax
 241:	48 03 55 e0          	add    rdx,QWORD PTR [rbp-0x20]
 245:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 249:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
 24d:	e9 80 00 00 00       	jmp    2d2 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2d2>
 252:	48 89 c3             	mov    rbx,rax
/usr/include/c++/4.6/bits/vector.tcc:355
		std::__uninitialized_move_a(__position.base(),
					    this->_M_impl._M_finish,
					    __new_finish,
					    _M_get_Tp_allocator());
	    }
          __catch(...)
 255:	e8 00 00 00 00       	call   25a <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x25a>
 25a:	48 89 d8             	mov    rax,rbx
 25d:	48 89 c7             	mov    rdi,rax
 260:	e8 00 00 00 00       	call   265 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x265>
 265:	48 89 c7             	mov    rdi,rax
 268:	e8 00 00 00 00       	call   26d <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x26d>
/usr/include/c++/4.6/bits/vector.tcc:357
	    {
	      if (!__new_finish)
 26d:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
 272:	75 20                	jne    294 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x294>
/usr/include/c++/4.6/bits/vector.tcc:358
		this->_M_impl.destroy(__new_start + __elems_before);
 274:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 278:	48 c1 e0 02          	shl    rax,0x2
 27c:	48 89 c2             	mov    rdx,rax
 27f:	48 03 55 e0          	add    rdx,QWORD PTR [rbp-0x20]
 283:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 287:	48 89 d6             	mov    rsi,rdx
 28a:	48 89 c7             	mov    rdi,rax
 28d:	e8 00 00 00 00       	call   292 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x292>
 292:	eb 22                	jmp    2b6 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2b6>
/usr/include/c++/4.6/bits/vector.tcc:360
	      else
		std::_Destroy(__new_start, __new_finish, _M_get_Tp_allocator());
 294:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 298:	48 89 c7             	mov    rdi,rax
 29b:	e8 00 00 00 00       	call   2a0 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2a0>
 2a0:	48 89 c2             	mov    rdx,rax
 2a3:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
 2a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 2ab:	48 89 ce             	mov    rsi,rcx
 2ae:	48 89 c7             	mov    rdi,rax
 2b1:	e8 00 00 00 00       	call   2b6 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2b6>
/usr/include/c++/4.6/bits/vector.tcc:361
	      _M_deallocate(__new_start, __len);
 2b6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 2ba:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
 2be:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
 2c2:	48 89 ce             	mov    rsi,rcx
 2c5:	48 89 c7             	mov    rdi,rax
 2c8:	e8 00 00 00 00       	call   2cd <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2cd>
/usr/include/c++/4.6/bits/vector.tcc:362
	      __throw_exception_again;
 2cd:	e8 00 00 00 00       	call   2d2 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2d2>
/usr/include/c++/4.6/bits/vector.tcc:373
			- this->_M_impl._M_start);
	  this->_M_impl._M_start = __new_start;
	  this->_M_impl._M_finish = __new_finish;
	  this->_M_impl._M_end_of_storage = __new_start + __len;
	}
    }
 2d2:	48 83 c4 50          	add    rsp,0x50
 2d6:	5b                   	pop    rbx
 2d7:	41 5c                	pop    r12
 2d9:	5d                   	pop    rbp
 2da:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEE3endEv:

0000000000000000 <_ZNSt6vectorIiSaIiEE3endEv>:
_ZNSt6vectorIiSaIiEE3endEv():
/usr/include/c++/4.6/bits/stl_vector.h:481
       *  Returns a read/write iterator that points one past the last
       *  element in the %vector.  Iteration is done in ordinary
       *  element order.
       */
      iterator
      end()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
/usr/include/c++/4.6/bits/stl_vector.h:482
      { return iterator(this->_M_impl._M_finish); }
   c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  10:	48 8d 50 08          	lea    rdx,[rax+0x8]
  14:	48 8d 45 f0          	lea    rax,[rbp-0x10]
  18:	48 89 d6             	mov    rsi,rdx
  1b:	48 89 c7             	mov    rdi,rax
  1e:	e8 00 00 00 00       	call   23 <_ZNSt6vectorIiSaIiEE3endEv+0x23>
  23:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  27:	c9                   	leave  
  28:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev>:
_Vector_impl():
/usr/include/c++/4.6/bits/stl_vector.h:82
      {
	typename _Tp_alloc_type::pointer _M_start;
	typename _Tp_alloc_type::pointer _M_finish;
	typename _Tp_alloc_type::pointer _M_end_of_storage;

	_Vector_impl()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_vector.h:83
	: _Tp_alloc_type(), _M_start(0), _M_finish(0), _M_end_of_storage(0)
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev+0x18>
  18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
  23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  27:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  2e:	00 
  2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  33:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  3a:	00 
/usr/include/c++/4.6/bits/stl_vector.h:84
	{ }
  3b:	c9                   	leave  
  3c:	c3                   	ret    

Disassembly of section .text._ZNSaIiED2Ev:

0000000000000000 <_ZNSaIiED1Ev>:
~allocator():
/usr/include/c++/4.6/bits/allocator.h:115
      : __glibcxx_base_allocator<_Tp>(__a) { }

      template<typename _Tp1>
        allocator(const allocator<_Tp1>&) throw() { }

      ~allocator() throw() { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSaIiED1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>:
_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim():
/usr/include/c++/4.6/bits/stl_vector.h:153
      typename _Tp_alloc_type::pointer
      _M_allocate(size_t __n)
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }

      void
      _M_deallocate(typename _Tp_alloc_type::pointer __p, size_t __n)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/include/c++/4.6/bits/stl_vector.h:155
      {
	if (__p)
  14:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  19:	74 17                	je     32 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim+0x32>
/usr/include/c++/4.6/bits/stl_vector.h:156
	  _M_impl.deallocate(__p, __n);
  1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  23:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  27:	48 89 ce             	mov    rsi,rcx
  2a:	48 89 c7             	mov    rdi,rax
  2d:	e8 00 00 00 00       	call   32 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim+0x32>
/usr/include/c++/4.6/bits/stl_vector.h:157
      }
  32:	c9                   	leave  
  33:	c3                   	ret    

Disassembly of section .text._ZSt8_DestroyIPiEvT_S1_:

0000000000000000 <_ZSt8_DestroyIPiEvT_S1_>:
_ZSt8_DestroyIPiEvT_S1_():
/usr/include/c++/4.6/bits/stl_construct.h:123
   * a trivial destructor, the compiler should optimize all of this
   * away, otherwise the objects' destructors must be invoked.
   */
  template<typename _ForwardIterator>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
/usr/include/c++/4.6/bits/stl_construct.h:127
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;
      std::_Destroy_aux<__has_trivial_destructor(_Value_type)>::
  10:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  18:	48 89 d6             	mov    rsi,rdx
  1b:	48 89 c7             	mov    rdi,rax
  1e:	e8 00 00 00 00       	call   23 <_ZSt8_DestroyIPiEvT_S1_+0x23>
/usr/include/c++/4.6/bits/stl_construct.h:129
	__destroy(__first, __last);
    }
  23:	c9                   	leave  
  24:	c3                   	ret    

Disassembly of section .text._ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv:

0000000000000000 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>:
_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv():
/usr/include/c++/4.6/bits/stl_iterator.h:784
      __normal_iterator
      operator-(const difference_type& __n) const
      { return __normal_iterator(_M_current - __n); }

      const _Iterator&
      base() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_iterator.h:785
      { return _M_current; }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	5d                   	pop    rbp
   d:	c3                   	ret    

Disassembly of section .text._ZSt13copy_backwardIPiS0_ET0_T_S2_S1_:

0000000000000000 <_ZSt13copy_backwardIPiS0_ET0_T_S2_S1_>:
_ZSt13copy_backwardIPiS0_ET0_T_S2_S1_():
/usr/include/c++/4.6/bits/stl_algobase.h:613
   *  Result may not be in the range [first,last).  Use copy instead.  Note
   *  that the start of the output range may overlap [first,last).
  */
  template<typename _BI1, typename _BI2>
    inline _BI2
    copy_backward(_BI1 __first, _BI1 __last, _BI2 __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	53                   	push   rbx
   5:	48 83 ec 28          	sub    rsp,0x28
   9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  11:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:625
	    typename iterator_traits<_BI2>::value_type>)
      __glibcxx_requires_valid_range(__first, __last);

      return (std::__copy_move_backward_a2<__is_move_iterator<_BI1>::__value>
	      (std::__miter_base(__first), std::__miter_base(__last),
	       __result));
  15:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  19:	48 89 c7             	mov    rdi,rax
  1c:	e8 00 00 00 00       	call   21 <_ZSt13copy_backwardIPiS0_ET0_T_S2_S1_+0x21>
  21:	48 89 c3             	mov    rbx,rax
  24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  28:	48 89 c7             	mov    rdi,rax
  2b:	e8 00 00 00 00       	call   30 <_ZSt13copy_backwardIPiS0_ET0_T_S2_S1_+0x30>
  30:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  34:	48 89 de             	mov    rsi,rbx
  37:	48 89 c7             	mov    rdi,rax
  3a:	e8 00 00 00 00       	call   3f <_ZSt13copy_backwardIPiS0_ET0_T_S2_S1_+0x3f>
/usr/include/c++/4.6/bits/stl_algobase.h:626
    }
  3f:	48 83 c4 28          	add    rsp,0x28
  43:	5b                   	pop    rbx
  44:	5d                   	pop    rbp
  45:	c3                   	ret    

Disassembly of section .text._ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv:

0000000000000000 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv>:
_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv():
/usr/include/c++/4.6/bits/stl_iterator.h:732
		      _Container>::__type>& __i)
        : _M_current(__i.base()) { }

      // Forward iterator requirements
      reference
      operator*() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_iterator.h:733
      { return *_M_current; }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	48 8b 00             	mov    rax,QWORD PTR [rax]
   f:	5d                   	pop    rbp
  10:	c3                   	ret    

Disassembly of section .text._ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc:

0000000000000000 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc>:
_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc():
/usr/include/c++/4.6/bits/stl_vector.h:1239
        _M_insert_aux(iterator __position, _Args&&... __args);
#endif

      // Called by the latter.
      size_type
      _M_check_len(size_type __n, const char* __s) const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	53                   	push   rbx
   5:	48 83 ec 38          	sub    rsp,0x38
   9:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
   d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  11:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
/usr/include/c++/4.6/bits/stl_vector.h:1241
      {
	if (max_size() - size() < __n)
  15:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  19:	48 89 c7             	mov    rdi,rax
  1c:	e8 00 00 00 00       	call   21 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x21>
  21:	48 89 c3             	mov    rbx,rax
  24:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  28:	48 89 c7             	mov    rdi,rax
  2b:	e8 00 00 00 00       	call   30 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x30>
  30:	48 89 da             	mov    rdx,rbx
  33:	48 29 c2             	sub    rdx,rax
  36:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  3a:	48 39 c2             	cmp    rdx,rax
  3d:	0f 92 c0             	setb   al
  40:	84 c0                	test   al,al
  42:	74 0c                	je     50 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x50>
/usr/include/c++/4.6/bits/stl_vector.h:1242
	  __throw_length_error(__N(__s));
  44:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  48:	48 89 c7             	mov    rdi,rax
  4b:	e8 00 00 00 00       	call   50 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x50>
/usr/include/c++/4.6/bits/stl_vector.h:1244

	const size_type __len = size() + std::max(size(), __n);
  50:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  54:	48 89 c7             	mov    rdi,rax
  57:	e8 00 00 00 00       	call   5c <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x5c>
  5c:	48 89 c3             	mov    rbx,rax
  5f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  63:	48 89 c7             	mov    rdi,rax
  66:	e8 00 00 00 00       	call   6b <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x6b>
  6b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  6f:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
  73:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  77:	48 89 d6             	mov    rsi,rdx
  7a:	48 89 c7             	mov    rdi,rax
  7d:	e8 00 00 00 00       	call   82 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x82>
  82:	48 8b 00             	mov    rax,QWORD PTR [rax]
  85:	48 01 d8             	add    rax,rbx
  88:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
/usr/include/c++/4.6/bits/stl_vector.h:1245
	return (__len < size() || __len > max_size()) ? max_size() : __len;
  8c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  90:	48 89 c7             	mov    rdi,rax
  93:	e8 00 00 00 00       	call   98 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x98>
  98:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  9c:	77 12                	ja     b0 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xb0>
  9e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  a2:	48 89 c7             	mov    rdi,rax
  a5:	e8 00 00 00 00       	call   aa <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xaa>
  aa:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  ae:	73 0e                	jae    be <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xbe>
  b0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  b4:	48 89 c7             	mov    rdi,rax
  b7:	e8 00 00 00 00       	call   bc <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xbc>
  bc:	eb 04                	jmp    c2 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xc2>
  be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
/usr/include/c++/4.6/bits/stl_vector.h:1246
      }
  c2:	48 83 c4 38          	add    rsp,0x38
  c6:	5b                   	pop    rbx
  c7:	5d                   	pop    rbp
  c8:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEE5beginEv:

0000000000000000 <_ZNSt6vectorIiSaIiEE5beginEv>:
_ZNSt6vectorIiSaIiEE5beginEv():
/usr/include/c++/4.6/bits/stl_vector.h:463
       *  Returns a read/write iterator that points to the first
       *  element in the %vector.  Iteration is done in ordinary
       *  element order.
       */
      iterator
      begin()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
/usr/include/c++/4.6/bits/stl_vector.h:464
      { return iterator(this->_M_impl._M_start); }
   c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  10:	48 8d 45 f0          	lea    rax,[rbp-0x10]
  14:	48 89 d6             	mov    rsi,rdx
  17:	48 89 c7             	mov    rdi,rax
  1a:	e8 00 00 00 00       	call   1f <_ZNSt6vectorIiSaIiEE5beginEv+0x1f>
  1f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23:	c9                   	leave  
  24:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_:

0000000000000000 <_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_>:
_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_():
/usr/include/c++/4.6/bits/stl_iterator.h:890
#endif
    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline typename __normal_iterator<_Iterator, _Container>::difference_type
    operator-(const __normal_iterator<_Iterator, _Container>& __lhs,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	53                   	push   rbx
   5:	48 83 ec 18          	sub    rsp,0x18
   9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
/usr/include/c++/4.6/bits/stl_iterator.h:892
	      const __normal_iterator<_Iterator, _Container>& __rhs)
    { return __lhs.base() - __rhs.base(); }
  11:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  15:	48 89 c7             	mov    rdi,rax
  18:	e8 00 00 00 00       	call   1d <_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_+0x1d>
  1d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  20:	48 89 c3             	mov    rbx,rax
  23:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  27:	48 89 c7             	mov    rdi,rax
  2a:	e8 00 00 00 00       	call   2f <_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_+0x2f>
  2f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  32:	48 89 da             	mov    rdx,rbx
  35:	48 29 c2             	sub    rdx,rax
  38:	48 89 d0             	mov    rax,rdx
  3b:	48 c1 f8 02          	sar    rax,0x2
  3f:	48 83 c4 18          	add    rsp,0x18
  43:	5b                   	pop    rbx
  44:	5d                   	pop    rbp
  45:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm>:
_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm():
/usr/include/c++/4.6/bits/stl_vector.h:149

    public:
      _Vector_impl _M_impl;

      typename _Tp_alloc_type::pointer
      _M_allocate(size_t __n)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
/usr/include/c++/4.6/bits/stl_vector.h:150
      { return __n != 0 ? _M_impl.allocate(__n) : 0; }
  10:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  15:	74 1a                	je     31 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm+0x31>
  17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1b:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  1f:	ba 00 00 00 00       	mov    edx,0x0
  24:	48 89 ce             	mov    rsi,rcx
  27:	48 89 c7             	mov    rdi,rax
  2a:	e8 00 00 00 00       	call   2f <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm+0x2f>
  2f:	eb 05                	jmp    36 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm+0x36>
  31:	b8 00 00 00 00       	mov    eax,0x0
  36:	c9                   	leave  
  37:	c3                   	ret    

Disassembly of section .text._ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_:

0000000000000000 <_ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_>:
_ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_():
/usr/include/c++/4.6/bits/stl_uninitialized.h:264
    { return std::uninitialized_copy(__first, __last, __result); }

  template<typename _InputIterator, typename _ForwardIterator,
	   typename _Allocator>
    inline _ForwardIterator
    __uninitialized_move_a(_InputIterator __first, _InputIterator __last,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  14:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
/usr/include/c++/4.6/bits/stl_uninitialized.h:269
			   _ForwardIterator __result, _Allocator& __alloc)
    {
      return std::__uninitialized_copy_a(_GLIBCXX_MAKE_MOVE_ITERATOR(__first),
					 _GLIBCXX_MAKE_MOVE_ITERATOR(__last),
					 __result, __alloc);
  18:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  1c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  20:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  28:	48 89 c7             	mov    rdi,rax
  2b:	e8 00 00 00 00       	call   30 <_ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_+0x30>
/usr/include/c++/4.6/bits/stl_uninitialized.h:270
    }
  30:	c9                   	leave  
  31:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE7destroyEPi:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE7destroyEPi>:
_ZN9__gnu_cxx13new_allocatorIiE7destroyEPi():
/usr/include/c++/4.6/ext/new_allocator.h:118
        construct(pointer __p, _Args&&... __args)
	{ ::new((void *)__p) _Tp(std::forward<_Args>(__args)...); }
#endif

      void 
      destroy(pointer __p) { __p->~_Tp(); }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
   c:	5d                   	pop    rbp
   d:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_:

0000000000000000 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_>:
__normal_iterator():
/usr/include/c++/4.6/bits/stl_iterator.h:720
      typedef typename __traits_type::pointer   	pointer;

      _GLIBCXX_CONSTEXPR __normal_iterator() : _M_current(_Iterator()) { }

      explicit
      __normal_iterator(const _Iterator& __i) : _M_current(__i) { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
   c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  10:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  17:	48 89 10             	mov    QWORD PTR [rax],rdx
  1a:	5d                   	pop    rbp
  1b:	c3                   	ret    

Disassembly of section .text._ZNSaIiEC2Ev:

0000000000000000 <_ZNSaIiEC1Ev>:
allocator():
/usr/include/c++/4.6/bits/allocator.h:107

      template<typename _Tp1>
        struct rebind
        { typedef allocator<_Tp1> other; };

      allocator() throw() { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSaIiEC1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiED2Ev:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiED1Ev>:
~new_allocator():
/usr/include/c++/4.6/ext/new_allocator.h:76
      new_allocator(const new_allocator&) throw() { }

      template<typename _Tp1>
        new_allocator(const new_allocator<_Tp1>&) throw() { }

      ~new_allocator() throw() { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	5d                   	pop    rbp
   9:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim>:
_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim():
/usr/include/c++/4.6/ext/new_allocator.h:97
	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/include/c++/4.6/ext/new_allocator.h:98
      { ::operator delete(__p); }
  14:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  18:	48 89 c7             	mov    rdi,rax
  1b:	e8 00 00 00 00       	call   20 <_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim+0x20>
  20:	c9                   	leave  
  21:	c3                   	ret    

Disassembly of section .text._ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_:

0000000000000000 <_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_>:
_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_():
/usr/include/c++/4.6/bits/stl_construct.h:113
  template<>
    struct _Destroy_aux<true>
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator, _ForwardIterator) { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
   c:	5d                   	pop    rbp
   d:	c3                   	ret    

Disassembly of section .text._ZSt12__miter_baseIPiENSt11_Miter_baseIT_E13iterator_typeES2_:

0000000000000000 <_ZSt12__miter_baseIPiENSt11_Miter_baseIT_E13iterator_typeES2_>:
_ZSt12__miter_baseIPiENSt11_Miter_baseIT_E13iterator_typeES2_():
/usr/include/c++/4.6/bits/stl_algobase.h:282
    : _Iter_base<_Iterator, __is_move_iterator<_Iterator>::__value>
    { };

  template<typename _Iterator>
    inline typename _Miter_base<_Iterator>::iterator_type
    __miter_base(_Iterator __it)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_algobase.h:283
    { return std::_Miter_base<_Iterator>::_S_base(__it); }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZSt12__miter_baseIPiENSt11_Miter_baseIT_E13iterator_typeES2_+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_():
/usr/include/c++/4.6/bits/stl_algobase.h:586
								 __result);
    }

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a2(_BI1 __first, _BI1 __last, _BI2 __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	41 54                	push   r12
   6:	53                   	push   rbx
   7:	48 83 ec 20          	sub    rsp,0x20
   b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  13:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:590
    {
      return _BI2(std::__copy_move_backward_a<_IsMove>
		  (std::__niter_base(__first), std::__niter_base(__last),
		   std::__niter_base(__result)));
  17:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1b:	48 89 c7             	mov    rdi,rax
  1e:	e8 00 00 00 00       	call   23 <_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_+0x23>
  23:	49 89 c4             	mov    r12,rax
  26:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  2a:	48 89 c7             	mov    rdi,rax
  2d:	e8 00 00 00 00       	call   32 <_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_+0x32>
  32:	48 89 c3             	mov    rbx,rax
  35:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  39:	48 89 c7             	mov    rdi,rax
  3c:	e8 00 00 00 00       	call   41 <_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_+0x41>
  41:	4c 89 e2             	mov    rdx,r12
  44:	48 89 de             	mov    rsi,rbx
  47:	48 89 c7             	mov    rdi,rax
  4a:	e8 00 00 00 00       	call   4f <_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_+0x4f>
/usr/include/c++/4.6/bits/stl_algobase.h:591
    }
  4f:	48 83 c4 20          	add    rsp,0x20
  53:	5b                   	pop    rbx
  54:	41 5c                	pop    r12
  56:	5d                   	pop    rbp
  57:	c3                   	ret    

Disassembly of section .text._ZNKSt6vectorIiSaIiEE8max_sizeEv:

0000000000000000 <_ZNKSt6vectorIiSaIiEE8max_sizeEv>:
_ZNKSt6vectorIiSaIiEE8max_sizeEv():
/usr/include/c++/4.6/bits/stl_vector.h:575
      size() const
      { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }

      /**  Returns the size() of the largest possible %vector.  */
      size_type
      max_size() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_vector.h:576
      { return _M_get_Tp_allocator().max_size(); }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNKSt6vectorIiSaIiEE8max_sizeEv+0x18>
  18:	48 89 c7             	mov    rdi,rax
  1b:	e8 00 00 00 00       	call   20 <_ZNKSt6vectorIiSaIiEE8max_sizeEv+0x20>
  20:	c9                   	leave  
  21:	c3                   	ret    

Disassembly of section .text._ZSt3maxImERKT_S2_S2_:

0000000000000000 <_ZSt3maxImERKT_S2_S2_>:
_ZSt3maxImERKT_S2_S2_():
/usr/include/c++/4.6/bits/stl_algobase.h:210
   *  temporary expressions, since they are only evaluated once, unlike a
   *  preprocessor macro.
  */
  template<typename _Tp>
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
/usr/include/c++/4.6/bits/stl_algobase.h:215
    {
      // concept requirements
      __glibcxx_function_requires(_LessThanComparableConcept<_Tp>)
      //return  __a < __b ? __b : __a;
      if (__a < __b)
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  13:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  17:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1a:	48 39 c2             	cmp    rdx,rax
  1d:	73 06                	jae    25 <_ZSt3maxImERKT_S2_S2_+0x25>
/usr/include/c++/4.6/bits/stl_algobase.h:216
	return __b;
  1f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23:	eb 04                	jmp    29 <_ZSt3maxImERKT_S2_S2_+0x29>
/usr/include/c++/4.6/bits/stl_algobase.h:217
      return __a;
  25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
/usr/include/c++/4.6/bits/stl_algobase.h:218
    }
  29:	5d                   	pop    rbp
  2a:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv>:
_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv():
/usr/include/c++/4.6/ext/new_allocator.h:87
      address(const_reference __x) const { return std::__addressof(__x); }

      // NB: __n is permitted to be 0.  The C++ standard says nothing
      // about what the return value is when __n == 0.
      pointer
      allocate(size_type __n, const void* = 0)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/include/c++/4.6/ext/new_allocator.h:89
      { 
	if (__n > this->max_size())
  14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  18:	48 89 c7             	mov    rdi,rax
  1b:	e8 00 00 00 00       	call   20 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x20>
  20:	48 3b 45 f0          	cmp    rax,QWORD PTR [rbp-0x10]
  24:	0f 92 c0             	setb   al
  27:	84 c0                	test   al,al
  29:	74 05                	je     30 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x30>
/usr/include/c++/4.6/ext/new_allocator.h:90
	  std::__throw_bad_alloc();
  2b:	e8 00 00 00 00       	call   30 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x30>
/usr/include/c++/4.6/ext/new_allocator.h:92

	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
  30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  34:	48 c1 e0 02          	shl    rax,0x2
  38:	48 89 c7             	mov    rdi,rax
  3b:	e8 00 00 00 00       	call   40 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x40>
/usr/include/c++/4.6/ext/new_allocator.h:93
      }
  40:	c9                   	leave  
  41:	c3                   	ret    

Disassembly of section .text._ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E:

0000000000000000 <_ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E>:
_ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E():
/usr/include/c++/4.6/bits/stl_uninitialized.h:257
	}
    }

  template<typename _InputIterator, typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    __uninitialized_copy_a(_InputIterator __first, _InputIterator __last,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  14:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
/usr/include/c++/4.6/bits/stl_uninitialized.h:259
			   _ForwardIterator __result, allocator<_Tp>&)
    { return std::uninitialized_copy(__first, __last, __result); }
  18:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  1c:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  24:	48 89 ce             	mov    rsi,rcx
  27:	48 89 c7             	mov    rdi,rax
  2a:	e8 00 00 00 00       	call   2f <_ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E+0x2f>
  2f:	c9                   	leave  
  30:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiEC2Ev:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiEC1Ev>:
new_allocator():
/usr/include/c++/4.6/ext/new_allocator.h:69

      template<typename _Tp1>
        struct rebind
        { typedef new_allocator<_Tp1> other; };

      new_allocator() throw() { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	5d                   	pop    rbp
   9:	c3                   	ret    

Disassembly of section .text._ZNSt10_Iter_baseIPiLb0EE7_S_baseES0_:

0000000000000000 <_ZNSt10_Iter_baseIPiLb0EE7_S_baseES0_>:
_ZNSt10_Iter_baseIPiLb0EE7_S_baseES0_():
/usr/include/c++/4.6/bits/stl_iterator_base_types.h:213
  // untouched
  template<typename _Iterator, bool _HasBase>
    struct _Iter_base
    {
      typedef _Iterator iterator_type;
      static iterator_type _S_base(_Iterator __it)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_iterator_base_types.h:214
      { return __it; }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	5d                   	pop    rbp
   d:	c3                   	ret    

Disassembly of section .text._ZSt12__niter_baseIPiENSt11_Niter_baseIT_E13iterator_typeES2_:

0000000000000000 <_ZSt12__niter_baseIPiENSt11_Niter_baseIT_E13iterator_typeES2_>:
_ZSt12__niter_baseIPiENSt11_Niter_baseIT_E13iterator_typeES2_():
/usr/include/c++/4.6/bits/stl_algobase.h:271
    : _Iter_base<_Iterator, __is_normal_iterator<_Iterator>::__value>
    { };

  template<typename _Iterator>
    inline typename _Niter_base<_Iterator>::iterator_type
    __niter_base(_Iterator __it)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_algobase.h:272
    { return std::_Niter_base<_Iterator>::_S_base(__it); }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZSt12__niter_baseIPiENSt11_Niter_baseIT_E13iterator_typeES2_+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_():
/usr/include/c++/4.6/bits/stl_algobase.h:568
	}
    };

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a(_BI1 __first, _BI1 __last, _BI2 __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 30          	sub    rsp,0x30
   8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  10:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:576
      typedef typename iterator_traits<_BI2>::value_type _ValueType2;
      typedef typename iterator_traits<_BI1>::iterator_category _Category;
      const bool __simple = (__is_trivial(_ValueType1)
	                     && __is_pointer<_BI1>::__value
	                     && __is_pointer<_BI2>::__value
			     && __are_same<_ValueType1, _ValueType2>::__value);
  14:	c6 45 ff 01          	mov    BYTE PTR [rbp-0x1],0x1
/usr/include/c++/4.6/bits/stl_algobase.h:581

      return std::__copy_move_backward<_IsMove, __simple,
	                               _Category>::__copy_move_b(__first,
								 __last,
								 __result);
  18:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  1c:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  24:	48 89 ce             	mov    rsi,rcx
  27:	48 89 c7             	mov    rdi,rax
  2a:	e8 00 00 00 00       	call   2f <_ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_+0x2f>
/usr/include/c++/4.6/bits/stl_algobase.h:582
    }
  2f:	c9                   	leave  
  30:	c3                   	ret    

Disassembly of section .text._ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv:

0000000000000000 <_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>:
_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv():
/usr/include/c++/4.6/bits/stl_vector.h:99
      _Tp_alloc_type&
      _M_get_Tp_allocator()
      { return *static_cast<_Tp_alloc_type*>(&this->_M_impl); }

      const _Tp_alloc_type&
      _M_get_Tp_allocator() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/bits/stl_vector.h:100
      { return *static_cast<const _Tp_alloc_type*>(&this->_M_impl); }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	5d                   	pop    rbp
   d:	c3                   	ret    

Disassembly of section .text._ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv:

0000000000000000 <_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv>:
_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv():
/usr/include/c++/4.6/ext/new_allocator.h:101
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }

      size_type
      max_size() const throw() 
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/include/c++/4.6/ext/new_allocator.h:102
      { return size_t(-1) / sizeof(_Tp); }
   8:	48 b8 ff ff ff ff ff 	movabs rax,0x3fffffffffffffff
   f:	ff ff 3f 
  12:	5d                   	pop    rbp
  13:	c3                   	ret    

Disassembly of section .text._ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_:

0000000000000000 <_ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_>:
_ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_():
/usr/include/c++/4.6/bits/stl_uninitialized.h:109
   *
   *  Like copy(), but does not require an initialized output range.
  */
  template<typename _InputIterator, typename _ForwardIterator>
    inline _ForwardIterator
    uninitialized_copy(_InputIterator __first, _InputIterator __last,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/include/c++/4.6/bits/stl_uninitialized.h:119
      typedef typename iterator_traits<_ForwardIterator>::value_type
	_ValueType2;

      return std::__uninitialized_copy<(__is_trivial(_ValueType1)
					&& __is_trivial(_ValueType2))>::
	__uninit_copy(__first, __last, __result);
  14:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  18:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  20:	48 89 ce             	mov    rsi,rcx
  23:	48 89 c7             	mov    rdi,rax
  26:	e8 00 00 00 00       	call   2b <_ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_+0x2b>
/usr/include/c++/4.6/bits/stl_uninitialized.h:120
    }
  2b:	c9                   	leave  
  2c:	c3                   	ret    

Disassembly of section .text._ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_:

0000000000000000 <_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_>:
_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_():
/usr/include/c++/4.6/bits/stl_algobase.h:557
  template<bool _IsMove>
    struct __copy_move_backward<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
        static _Tp*
        __copy_move_b(const _Tp* __first, const _Tp* __last, _Tp* __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 30          	sub    rsp,0x30
   8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  10:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:559
        {
	  const ptrdiff_t _Num = __last - __first;
  14:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1c:	48 89 d1             	mov    rcx,rdx
  1f:	48 29 c1             	sub    rcx,rax
  22:	48 89 c8             	mov    rax,rcx
  25:	48 c1 f8 02          	sar    rax,0x2
  29:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
/usr/include/c++/4.6/bits/stl_algobase.h:560
	  if (_Num)
  2d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  32:	74 2a                	je     5e <_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_+0x5e>
/usr/include/c++/4.6/bits/stl_algobase.h:561
	    __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
  34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  38:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  3f:	00 
  40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  44:	48 c1 e0 02          	shl    rax,0x2
  48:	48 f7 d8             	neg    rax
  4b:	48 03 45 d8          	add    rax,QWORD PTR [rbp-0x28]
  4f:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  53:	48 89 ce             	mov    rsi,rcx
  56:	48 89 c7             	mov    rdi,rax
  59:	e8 00 00 00 00       	call   5e <_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_+0x5e>
/usr/include/c++/4.6/bits/stl_algobase.h:562
	  return __result - _Num;
  5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  62:	48 c1 e0 02          	shl    rax,0x2
  66:	48 f7 d8             	neg    rax
  69:	48 03 45 d8          	add    rax,QWORD PTR [rbp-0x28]
/usr/include/c++/4.6/bits/stl_algobase.h:563
	}
  6d:	c9                   	leave  
  6e:	c3                   	ret    

Disassembly of section .text._ZNSt20__uninitialized_copyILb1EE13__uninit_copyIPiS2_EET0_T_S4_S3_:

0000000000000000 <_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIPiS2_EET0_T_S4_S3_>:
_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIPiS2_EET0_T_S4_S3_():
/usr/include/c++/4.6/bits/stl_uninitialized.h:93
  template<>
    struct __uninitialized_copy<true>
    {
      template<typename _InputIterator, typename _ForwardIterator>
        static _ForwardIterator
        __uninit_copy(_InputIterator __first, _InputIterator __last,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/include/c++/4.6/bits/stl_uninitialized.h:95
		      _ForwardIterator __result)
        { return std::copy(__first, __last, __result); }
  14:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  18:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  20:	48 89 ce             	mov    rsi,rcx
  23:	48 89 c7             	mov    rdi,rax
  26:	e8 00 00 00 00       	call   2b <_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIPiS2_EET0_T_S4_S3_+0x2b>
  2b:	c9                   	leave  
  2c:	c3                   	ret    

Disassembly of section .text._ZSt4copyIPiS0_ET0_T_S2_S1_:

0000000000000000 <_ZSt4copyIPiS0_ET0_T_S2_S1_>:
_ZSt4copyIPiS0_ET0_T_S2_S1_():
/usr/include/c++/4.6/bits/stl_algobase.h:444
   *  Note that the end of the output range is permitted to be contained
   *  within [first,last).
  */
  template<typename _II, typename _OI>
    inline _OI
    copy(_II __first, _II __last, _OI __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	53                   	push   rbx
   5:	48 83 ec 28          	sub    rsp,0x28
   9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  11:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:454
	    typename iterator_traits<_II>::value_type>)
      __glibcxx_requires_valid_range(__first, __last);

      return (std::__copy_move_a2<__is_move_iterator<_II>::__value>
	      (std::__miter_base(__first), std::__miter_base(__last),
	       __result));
  15:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  19:	48 89 c7             	mov    rdi,rax
  1c:	e8 00 00 00 00       	call   21 <_ZSt4copyIPiS0_ET0_T_S2_S1_+0x21>
  21:	48 89 c3             	mov    rbx,rax
  24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  28:	48 89 c7             	mov    rdi,rax
  2b:	e8 00 00 00 00       	call   30 <_ZSt4copyIPiS0_ET0_T_S2_S1_+0x30>
  30:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  34:	48 89 de             	mov    rsi,rbx
  37:	48 89 c7             	mov    rdi,rax
  3a:	e8 00 00 00 00       	call   3f <_ZSt4copyIPiS0_ET0_T_S2_S1_+0x3f>
/usr/include/c++/4.6/bits/stl_algobase.h:455
    }
  3f:	48 83 c4 28          	add    rsp,0x28
  43:	5b                   	pop    rbx
  44:	5d                   	pop    rbp
  45:	c3                   	ret    

Disassembly of section .text._ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_():
/usr/include/c++/4.6/bits/stl_algobase.h:418
    __copy_move_a2(istreambuf_iterator<_CharT, char_traits<_CharT> >,
		   istreambuf_iterator<_CharT, char_traits<_CharT> >, _CharT*);

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a2(_II __first, _II __last, _OI __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	41 54                	push   r12
   6:	53                   	push   rbx
   7:	48 83 ec 20          	sub    rsp,0x20
   b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  13:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:422
    {
      return _OI(std::__copy_move_a<_IsMove>(std::__niter_base(__first),
					     std::__niter_base(__last),
					     std::__niter_base(__result)));
  17:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1b:	48 89 c7             	mov    rdi,rax
  1e:	e8 00 00 00 00       	call   23 <_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_+0x23>
  23:	49 89 c4             	mov    r12,rax
  26:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  2a:	48 89 c7             	mov    rdi,rax
  2d:	e8 00 00 00 00       	call   32 <_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_+0x32>
  32:	48 89 c3             	mov    rbx,rax
  35:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  39:	48 89 c7             	mov    rdi,rax
  3c:	e8 00 00 00 00       	call   41 <_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_+0x41>
  41:	4c 89 e2             	mov    rdx,r12
  44:	48 89 de             	mov    rsi,rbx
  47:	48 89 c7             	mov    rdi,rax
  4a:	e8 00 00 00 00       	call   4f <_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_+0x4f>
/usr/include/c++/4.6/bits/stl_algobase.h:423
    }
  4f:	48 83 c4 20          	add    rsp,0x20
  53:	5b                   	pop    rbx
  54:	41 5c                	pop    r12
  56:	5d                   	pop    rbp
  57:	c3                   	ret    

Disassembly of section .text._ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_():
/usr/include/c++/4.6/bits/stl_algobase.h:373
	}
    };

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a(_II __first, _II __last, _OI __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 30          	sub    rsp,0x30
   8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  10:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:381
      typedef typename iterator_traits<_OI>::value_type _ValueTypeO;
      typedef typename iterator_traits<_II>::iterator_category _Category;
      const bool __simple = (__is_trivial(_ValueTypeI)
	                     && __is_pointer<_II>::__value
	                     && __is_pointer<_OI>::__value
			     && __are_same<_ValueTypeI, _ValueTypeO>::__value);
  14:	c6 45 ff 01          	mov    BYTE PTR [rbp-0x1],0x1
/usr/include/c++/4.6/bits/stl_algobase.h:384

      return std::__copy_move<_IsMove, __simple,
	                      _Category>::__copy_m(__first, __last, __result);
  18:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  1c:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  24:	48 89 ce             	mov    rsi,rcx
  27:	48 89 c7             	mov    rdi,rax
  2a:	e8 00 00 00 00       	call   2f <_ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_+0x2f>
/usr/include/c++/4.6/bits/stl_algobase.h:385
    }
  2f:	c9                   	leave  
  30:	c3                   	ret    

Disassembly of section .text._ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_:

0000000000000000 <_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_>:
_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_():
/usr/include/c++/4.6/bits/stl_algobase.h:362
  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 30          	sub    rsp,0x30
   8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  10:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
/usr/include/c++/4.6/bits/stl_algobase.h:364
        {
	  const ptrdiff_t _Num = __last - __first;
  14:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1c:	48 89 d1             	mov    rcx,rdx
  1f:	48 29 c1             	sub    rcx,rax
  22:	48 89 c8             	mov    rax,rcx
  25:	48 c1 f8 02          	sar    rax,0x2
  29:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
/usr/include/c++/4.6/bits/stl_algobase.h:365
	  if (_Num)
  2d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  32:	74 1f                	je     53 <_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_+0x53>
/usr/include/c++/4.6/bits/stl_algobase.h:366
	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
  34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  38:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  3f:	00 
  40:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  44:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  48:	48 89 ce             	mov    rsi,rcx
  4b:	48 89 c7             	mov    rdi,rax
  4e:	e8 00 00 00 00       	call   53 <_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_+0x53>
/usr/include/c++/4.6/bits/stl_algobase.h:367
	  return __result + _Num;
  53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  57:	48 c1 e0 02          	shl    rax,0x2
  5b:	48 03 45 d8          	add    rax,QWORD PTR [rbp-0x28]
/usr/include/c++/4.6/bits/stl_algobase.h:368
	}
  5f:	c9                   	leave  
  60:	c3                   	ret    

Disassembly of section .text._ZN11paramStructD2Ev:

0000000000000000 <_ZN11paramStructD1Ev>:
~paramStruct():
/home/omkar/courses/ece759/project/AVX/Params.h:98
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 83 c0 18          	add    rax,0x18
  14:	48 89 c7             	mov    rdi,rax
  17:	e8 00 00 00 00       	call   1c <_ZN11paramStructD1Ev+0x1c>
  1c:	c9                   	leave  
  1d:	c3                   	ret    

Disassembly of section .text._ZN11timerStructD2Ev:

0000000000000000 <_ZN11timerStructD1Ev>:
~timerStruct():
/home/omkar/courses/ece759/project/AVX/main.cpp:135
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 83 c0 08          	add    rax,0x8
  14:	48 89 c7             	mov    rdi,rax
  17:	e8 00 00 00 00       	call   1c <_ZN11timerStructD1Ev+0x1c>
  1c:	c9                   	leave  
  1d:	c3                   	ret    
