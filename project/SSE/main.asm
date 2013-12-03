
main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_Z10InitParamsiPPc>:
_Z10InitParamsiPPc():
/home/odeshmukh/work/project/SSE/Params.h:119

void Usage(char *name);
void ParseCommandLine(int argc, char* argv[]);

void InitParams(int argc, char* argv[])
{
       0:	55                   	push   rbp
       1:	48 89 e5             	mov    rbp,rsp
       4:	48 83 ec 20          	sub    rsp,0x20
       8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
       b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
/home/odeshmukh/work/project/SSE/Params.h:120
    params.nWidth = 1024*8;
       f:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x2000        # 19 <_Z10InitParamsiPPc+0x19>
      16:	20 00 00 
/home/odeshmukh/work/project/SSE/Params.h:121
    params.nHeight = 1024*8;
      19:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x2000        # 23 <_Z10InitParamsiPPc+0x23>
      20:	20 00 00 
/home/odeshmukh/work/project/SSE/Params.h:122
    params.nFilterWidth = 17;
      23:	c7 05 00 00 00 00 11 	mov    DWORD PTR [rip+0x0],0x11        # 2d <_Z10InitParamsiPPc+0x2d>
      2a:	00 00 00 
/home/odeshmukh/work/project/SSE/Params.h:123
    params.nIterations = 3;
      2d:	c7 05 00 00 00 00 03 	mov    DWORD PTR [rip+0x0],0x3        # 37 <_Z10InitParamsiPPc+0x37>
      34:	00 00 00 
/home/odeshmukh/work/project/SSE/Params.h:125

    params.bCPUTiming = true;
      37:	c6 05 00 00 00 00 01 	mov    BYTE PTR [rip+0x0],0x1        # 3e <_Z10InitParamsiPPc+0x3e>
/home/odeshmukh/work/project/SSE/Params.h:127

    ParseCommandLine(argc, argv);
      3e:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
      42:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
      45:	48 89 d6             	mov    rsi,rdx
      48:	89 c7                	mov    edi,eax
      4a:	e8 00 00 00 00       	call   4f <_Z10InitParamsiPPc+0x4f>
/home/odeshmukh/work/project/SSE/Params.h:129

    params.nInWidth = params.nWidth + (params.nFilterWidth-1);
      4f:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 55 <_Z10InitParamsiPPc+0x55>
      55:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 5b <_Z10InitParamsiPPc+0x5b>
      5b:	ff ca                	dec    edx
      5d:	01 d0                	add    eax,edx
      5f:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 65 <_Z10InitParamsiPPc+0x65>
/home/odeshmukh/work/project/SSE/Params.h:130
    params.nInHeight = params.nHeight + (params.nFilterWidth-1);
      65:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 6b <_Z10InitParamsiPPc+0x6b>
      6b:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 71 <_Z10InitParamsiPPc+0x71>
      71:	ff ca                	dec    edx
      73:	01 d0                	add    eax,edx
      75:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 7b <_Z10InitParamsiPPc+0x7b>
/home/odeshmukh/work/project/SSE/Params.h:132

    params.ompThreads.push_back(1);
      7b:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
      82:	48 8d 45 fc          	lea    rax,[rbp-0x4]
      86:	48 89 c6             	mov    rsi,rax
      89:	bf 00 00 00 00       	mov    edi,0x0
      8e:	e8 00 00 00 00       	call   93 <_Z10InitParamsiPPc+0x93>
/home/odeshmukh/work/project/SSE/Params.h:133
    params.nOmpRuns = params.ompThreads.size();
      93:	bf 00 00 00 00       	mov    edi,0x0
      98:	e8 00 00 00 00       	call   9d <_Z10InitParamsiPPc+0x9d>
      9d:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # a3 <_Z10InitParamsiPPc+0xa3>
/home/odeshmukh/work/project/SSE/Params.h:134
}
      a3:	c9                   	leave  
      a4:	c3                   	ret    

00000000000000a5 <_Z16ParseCommandLineiPPc>:
_Z16ParseCommandLineiPPc():
/home/odeshmukh/work/project/SSE/Params.h:137

void ParseCommandLine(int argc, char* argv[])
{
      a5:	55                   	push   rbp
      a6:	48 89 e5             	mov    rbp,rsp
      a9:	41 55                	push   r13
      ab:	41 54                	push   r12
      ad:	53                   	push   rbx
      ae:	48 83 ec 28          	sub    rsp,0x28
      b2:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
      b5:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
/home/odeshmukh/work/project/SSE/Params.h:138
    for (int i = 1; i < argc; ++i)
      b9:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
      c0:	e9 4a 03 00 00       	jmp    40f <_Z16ParseCommandLineiPPc+0x36a>
/home/odeshmukh/work/project/SSE/Params.h:140
    {
        switch (argv[i][1])
      c5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
      c8:	48 98                	cdqe   
      ca:	48 c1 e0 03          	shl    rax,0x3
      ce:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
      d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
      d5:	48 ff c0             	inc    rax
      d8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
      db:	0f be c0             	movsx  eax,al
      de:	83 e8 63             	sub    eax,0x63
      e1:	83 f8 16             	cmp    eax,0x16
      e4:	0f 87 59 02 00 00    	ja     343 <_Z16ParseCommandLineiPPc+0x29e>
      ea:	89 c0                	mov    eax,eax
      ec:	48 8b 04 c5 00 00 00 	mov    rax,QWORD PTR [rax*8+0x0]
      f3:	00 
      f4:	ff e0                	jmp    rax
/home/odeshmukh/work/project/SSE/Params.h:143
        {
        case 'c':
            params.bCPUTiming = false;
      f6:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # fd <_Z16ParseCommandLineiPPc+0x58>
/home/odeshmukh/work/project/SSE/Params.h:144
            break;
      fd:	e9 0a 03 00 00       	jmp    40c <_Z16ParseCommandLineiPPc+0x367>
/home/odeshmukh/work/project/SSE/Params.h:146
        case 'f':
            if (++i < argc)
     102:	ff 45 dc             	inc    DWORD PTR [rbp-0x24]
     105:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     108:	3b 45 cc             	cmp    eax,DWORD PTR [rbp-0x34]
     10b:	0f 9c c0             	setl   al
     10e:	84 c0                	test   al,al
     110:	74 2c                	je     13e <_Z16ParseCommandLineiPPc+0x99>
/home/odeshmukh/work/project/SSE/Params.h:148
            {
                sscanf(argv[i], "%u", &params.nFilterWidth);
     112:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     115:	48 98                	cdqe   
     117:	48 c1 e0 03          	shl    rax,0x3
     11b:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     11f:	48 8b 00             	mov    rax,QWORD PTR [rax]
     122:	ba 00 00 00 00       	mov    edx,0x0
     127:	be 00 00 00 00       	mov    esi,0x0
     12c:	48 89 c7             	mov    rdi,rax
     12f:	b8 00 00 00 00       	mov    eax,0x0
     134:	e8 00 00 00 00       	call   139 <_Z16ParseCommandLineiPPc+0x94>
/home/odeshmukh/work/project/SSE/Params.h:156
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     139:	e9 ce 02 00 00       	jmp    40c <_Z16ParseCommandLineiPPc+0x367>
/home/odeshmukh/work/project/SSE/Params.h:152
            {
                sscanf(argv[i], "%u", &params.nFilterWidth);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     13e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     141:	48 98                	cdqe   
     143:	48 ff c8             	dec    rax
     146:	48 c1 e0 03          	shl    rax,0x3
     14a:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     14e:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     151:	be 00 00 00 00       	mov    esi,0x0
     156:	bf 00 00 00 00       	mov    edi,0x0
     15b:	e8 00 00 00 00       	call   160 <_Z16ParseCommandLineiPPc+0xbb>
     160:	48 89 de             	mov    rsi,rbx
     163:	48 89 c7             	mov    rdi,rax
     166:	e8 00 00 00 00       	call   16b <_Z16ParseCommandLineiPPc+0xc6>
     16b:	be 00 00 00 00       	mov    esi,0x0
     170:	48 89 c7             	mov    rdi,rax
     173:	e8 00 00 00 00       	call   178 <_Z16ParseCommandLineiPPc+0xd3>
/home/odeshmukh/work/project/SSE/Params.h:153
                Usage(argv[0]);
     178:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
     17c:	48 8b 00             	mov    rax,QWORD PTR [rax]
     17f:	48 89 c7             	mov    rdi,rax
     182:	e8 00 00 00 00       	call   187 <_Z16ParseCommandLineiPPc+0xe2>
/home/odeshmukh/work/project/SSE/Params.h:154
                throw;
     187:	e8 00 00 00 00       	call   18c <_Z16ParseCommandLineiPPc+0xe7>
/home/odeshmukh/work/project/SSE/Params.h:158
            }
            break;
        case 'i':
            if (++i < argc)
     18c:	ff 45 dc             	inc    DWORD PTR [rbp-0x24]
     18f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     192:	3b 45 cc             	cmp    eax,DWORD PTR [rbp-0x34]
     195:	0f 9c c0             	setl   al
     198:	84 c0                	test   al,al
     19a:	74 2c                	je     1c8 <_Z16ParseCommandLineiPPc+0x123>
/home/odeshmukh/work/project/SSE/Params.h:160
            {
                sscanf(argv[i], "%u", &params.nIterations);
     19c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     19f:	48 98                	cdqe   
     1a1:	48 c1 e0 03          	shl    rax,0x3
     1a5:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     1a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
     1ac:	ba 00 00 00 00       	mov    edx,0x0
     1b1:	be 00 00 00 00       	mov    esi,0x0
     1b6:	48 89 c7             	mov    rdi,rax
     1b9:	b8 00 00 00 00       	mov    eax,0x0
     1be:	e8 00 00 00 00       	call   1c3 <_Z16ParseCommandLineiPPc+0x11e>
/home/odeshmukh/work/project/SSE/Params.h:168
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     1c3:	e9 44 02 00 00       	jmp    40c <_Z16ParseCommandLineiPPc+0x367>
/home/odeshmukh/work/project/SSE/Params.h:164
            {
                sscanf(argv[i], "%u", &params.nIterations);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     1c8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     1cb:	48 98                	cdqe   
     1cd:	48 ff c8             	dec    rax
     1d0:	48 c1 e0 03          	shl    rax,0x3
     1d4:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     1d8:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     1db:	be 00 00 00 00       	mov    esi,0x0
     1e0:	bf 00 00 00 00       	mov    edi,0x0
     1e5:	e8 00 00 00 00       	call   1ea <_Z16ParseCommandLineiPPc+0x145>
     1ea:	48 89 de             	mov    rsi,rbx
     1ed:	48 89 c7             	mov    rdi,rax
     1f0:	e8 00 00 00 00       	call   1f5 <_Z16ParseCommandLineiPPc+0x150>
     1f5:	be 00 00 00 00       	mov    esi,0x0
     1fa:	48 89 c7             	mov    rdi,rax
     1fd:	e8 00 00 00 00       	call   202 <_Z16ParseCommandLineiPPc+0x15d>
/home/odeshmukh/work/project/SSE/Params.h:165
                Usage(argv[0]);
     202:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
     206:	48 8b 00             	mov    rax,QWORD PTR [rax]
     209:	48 89 c7             	mov    rdi,rax
     20c:	e8 00 00 00 00       	call   211 <_Z16ParseCommandLineiPPc+0x16c>
/home/odeshmukh/work/project/SSE/Params.h:166
                throw;
     211:	e8 00 00 00 00       	call   216 <_Z16ParseCommandLineiPPc+0x171>
/home/odeshmukh/work/project/SSE/Params.h:170
            }
            break;
        case 'x':
            if (++i < argc)
     216:	ff 45 dc             	inc    DWORD PTR [rbp-0x24]
     219:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     21c:	3b 45 cc             	cmp    eax,DWORD PTR [rbp-0x34]
     21f:	0f 9c c0             	setl   al
     222:	84 c0                	test   al,al
     224:	74 2c                	je     252 <_Z16ParseCommandLineiPPc+0x1ad>
/home/odeshmukh/work/project/SSE/Params.h:172
            {
                sscanf(argv[i], "%u", &params.nWidth);
     226:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     229:	48 98                	cdqe   
     22b:	48 c1 e0 03          	shl    rax,0x3
     22f:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     233:	48 8b 00             	mov    rax,QWORD PTR [rax]
     236:	ba 00 00 00 00       	mov    edx,0x0
     23b:	be 00 00 00 00       	mov    esi,0x0
     240:	48 89 c7             	mov    rdi,rax
     243:	b8 00 00 00 00       	mov    eax,0x0
     248:	e8 00 00 00 00       	call   24d <_Z16ParseCommandLineiPPc+0x1a8>
/home/odeshmukh/work/project/SSE/Params.h:180
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     24d:	e9 ba 01 00 00       	jmp    40c <_Z16ParseCommandLineiPPc+0x367>
/home/odeshmukh/work/project/SSE/Params.h:176
            {
                sscanf(argv[i], "%u", &params.nWidth);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     252:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     255:	48 98                	cdqe   
     257:	48 ff c8             	dec    rax
     25a:	48 c1 e0 03          	shl    rax,0x3
     25e:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     262:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     265:	be 00 00 00 00       	mov    esi,0x0
     26a:	bf 00 00 00 00       	mov    edi,0x0
     26f:	e8 00 00 00 00       	call   274 <_Z16ParseCommandLineiPPc+0x1cf>
     274:	48 89 de             	mov    rsi,rbx
     277:	48 89 c7             	mov    rdi,rax
     27a:	e8 00 00 00 00       	call   27f <_Z16ParseCommandLineiPPc+0x1da>
     27f:	be 00 00 00 00       	mov    esi,0x0
     284:	48 89 c7             	mov    rdi,rax
     287:	e8 00 00 00 00       	call   28c <_Z16ParseCommandLineiPPc+0x1e7>
/home/odeshmukh/work/project/SSE/Params.h:177
                Usage(argv[0]);
     28c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
     290:	48 8b 00             	mov    rax,QWORD PTR [rax]
     293:	48 89 c7             	mov    rdi,rax
     296:	e8 00 00 00 00       	call   29b <_Z16ParseCommandLineiPPc+0x1f6>
/home/odeshmukh/work/project/SSE/Params.h:178
                throw;
     29b:	e8 00 00 00 00       	call   2a0 <_Z16ParseCommandLineiPPc+0x1fb>
/home/odeshmukh/work/project/SSE/Params.h:182
            }
            break;
        case 'y':
            if (++i < argc)
     2a0:	ff 45 dc             	inc    DWORD PTR [rbp-0x24]
     2a3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     2a6:	3b 45 cc             	cmp    eax,DWORD PTR [rbp-0x34]
     2a9:	0f 9c c0             	setl   al
     2ac:	84 c0                	test   al,al
     2ae:	74 2c                	je     2dc <_Z16ParseCommandLineiPPc+0x237>
/home/odeshmukh/work/project/SSE/Params.h:184
            {
                sscanf(argv[i], "%u", &params.nHeight);
     2b0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     2b3:	48 98                	cdqe   
     2b5:	48 c1 e0 03          	shl    rax,0x3
     2b9:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     2bd:	48 8b 00             	mov    rax,QWORD PTR [rax]
     2c0:	ba 00 00 00 00       	mov    edx,0x0
     2c5:	be 00 00 00 00       	mov    esi,0x0
     2ca:	48 89 c7             	mov    rdi,rax
     2cd:	b8 00 00 00 00       	mov    eax,0x0
     2d2:	e8 00 00 00 00       	call   2d7 <_Z16ParseCommandLineiPPc+0x232>
/home/odeshmukh/work/project/SSE/Params.h:192
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
                Usage(argv[0]);
                throw;
            }
            break;
     2d7:	e9 30 01 00 00       	jmp    40c <_Z16ParseCommandLineiPPc+0x367>
/home/odeshmukh/work/project/SSE/Params.h:188
            {
                sscanf(argv[i], "%u", &params.nHeight);
            }
            else
            {
                std::cerr << "Could not read argument after option " << argv[i-1] << std::endl;
     2dc:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     2df:	48 98                	cdqe   
     2e1:	48 ff c8             	dec    rax
     2e4:	48 c1 e0 03          	shl    rax,0x3
     2e8:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     2ec:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     2ef:	be 00 00 00 00       	mov    esi,0x0
     2f4:	bf 00 00 00 00       	mov    edi,0x0
     2f9:	e8 00 00 00 00       	call   2fe <_Z16ParseCommandLineiPPc+0x259>
     2fe:	48 89 de             	mov    rsi,rbx
     301:	48 89 c7             	mov    rdi,rax
     304:	e8 00 00 00 00       	call   309 <_Z16ParseCommandLineiPPc+0x264>
     309:	be 00 00 00 00       	mov    esi,0x0
     30e:	48 89 c7             	mov    rdi,rax
     311:	e8 00 00 00 00       	call   316 <_Z16ParseCommandLineiPPc+0x271>
/home/odeshmukh/work/project/SSE/Params.h:189
                Usage(argv[0]);
     316:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
     31a:	48 8b 00             	mov    rax,QWORD PTR [rax]
     31d:	48 89 c7             	mov    rdi,rax
     320:	e8 00 00 00 00       	call   325 <_Z16ParseCommandLineiPPc+0x280>
/home/odeshmukh/work/project/SSE/Params.h:190
                throw;
     325:	e8 00 00 00 00       	call   32a <_Z16ParseCommandLineiPPc+0x285>
/home/odeshmukh/work/project/SSE/Params.h:194
            }
            break;
        case 'h':
            Usage(argv[0]);
     32a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
     32e:	48 8b 00             	mov    rax,QWORD PTR [rax]
     331:	48 89 c7             	mov    rdi,rax
     334:	e8 00 00 00 00       	call   339 <_Z16ParseCommandLineiPPc+0x294>
/home/odeshmukh/work/project/SSE/Params.h:195
            exit(1);
     339:	bf 01 00 00 00       	mov    edi,0x1
     33e:	e8 00 00 00 00       	call   343 <_Z16ParseCommandLineiPPc+0x29e>
/home/odeshmukh/work/project/SSE/Params.h:197
        default:
            std::cerr << "Invalid argument " << argv[i] << std::endl;
     343:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     346:	48 98                	cdqe   
     348:	48 c1 e0 03          	shl    rax,0x3
     34c:	48 03 45 c0          	add    rax,QWORD PTR [rbp-0x40]
     350:	48 8b 18             	mov    rbx,QWORD PTR [rax]
     353:	be 00 00 00 00       	mov    esi,0x0
     358:	bf 00 00 00 00       	mov    edi,0x0
     35d:	e8 00 00 00 00       	call   362 <_Z16ParseCommandLineiPPc+0x2bd>
     362:	48 89 de             	mov    rsi,rbx
     365:	48 89 c7             	mov    rdi,rax
     368:	e8 00 00 00 00       	call   36d <_Z16ParseCommandLineiPPc+0x2c8>
     36d:	be 00 00 00 00       	mov    esi,0x0
     372:	48 89 c7             	mov    rdi,rax
     375:	e8 00 00 00 00       	call   37a <_Z16ParseCommandLineiPPc+0x2d5>
/home/odeshmukh/work/project/SSE/Params.h:198
            Usage(argv[0]);
     37a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
     37e:	48 8b 00             	mov    rax,QWORD PTR [rax]
     381:	48 89 c7             	mov    rdi,rax
     384:	e8 00 00 00 00       	call   389 <_Z16ParseCommandLineiPPc+0x2e4>
/home/odeshmukh/work/project/SSE/Params.h:199
            throw(std::string("Invalid argument"));
     389:	48 8d 45 db          	lea    rax,[rbp-0x25]
     38d:	48 89 c7             	mov    rdi,rax
     390:	e8 00 00 00 00       	call   395 <_Z16ParseCommandLineiPPc+0x2f0>
     395:	4c 8d 65 db          	lea    r12,[rbp-0x25]
     399:	bf 08 00 00 00       	mov    edi,0x8
     39e:	e8 00 00 00 00       	call   3a3 <_Z16ParseCommandLineiPPc+0x2fe>
     3a3:	48 89 c3             	mov    rbx,rax
     3a6:	48 89 d8             	mov    rax,rbx
     3a9:	4c 89 e2             	mov    rdx,r12
     3ac:	be 00 00 00 00       	mov    esi,0x0
     3b1:	48 89 c7             	mov    rdi,rax
     3b4:	e8 00 00 00 00       	call   3b9 <_Z16ParseCommandLineiPPc+0x314>
     3b9:	eb 33                	jmp    3ee <_Z16ParseCommandLineiPPc+0x349>
     3bb:	41 89 d4             	mov    r12d,edx
     3be:	49 89 c5             	mov    r13,rax
     3c1:	48 89 df             	mov    rdi,rbx
     3c4:	e8 00 00 00 00       	call   3c9 <_Z16ParseCommandLineiPPc+0x324>
     3c9:	4c 89 e8             	mov    rax,r13
     3cc:	49 63 d4             	movsxd rdx,r12d
     3cf:	89 d3                	mov    ebx,edx
     3d1:	49 89 c4             	mov    r12,rax
     3d4:	48 8d 45 db          	lea    rax,[rbp-0x25]
     3d8:	48 89 c7             	mov    rdi,rax
     3db:	e8 00 00 00 00       	call   3e0 <_Z16ParseCommandLineiPPc+0x33b>
     3e0:	4c 89 e0             	mov    rax,r12
     3e3:	48 63 d3             	movsxd rdx,ebx
     3e6:	48 89 c7             	mov    rdi,rax
     3e9:	e8 00 00 00 00       	call   3ee <_Z16ParseCommandLineiPPc+0x349>
     3ee:	48 8d 45 db          	lea    rax,[rbp-0x25]
     3f2:	48 89 c7             	mov    rdi,rax
     3f5:	e8 00 00 00 00       	call   3fa <_Z16ParseCommandLineiPPc+0x355>
     3fa:	ba 00 00 00 00       	mov    edx,0x0
     3ff:	be 00 00 00 00       	mov    esi,0x0
     404:	48 89 df             	mov    rdi,rbx
     407:	e8 00 00 00 00       	call   40c <_Z16ParseCommandLineiPPc+0x367>
/home/odeshmukh/work/project/SSE/Params.h:138
    params.nOmpRuns = params.ompThreads.size();
}

void ParseCommandLine(int argc, char* argv[])
{
    for (int i = 1; i < argc; ++i)
     40c:	ff 45 dc             	inc    DWORD PTR [rbp-0x24]
     40f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     412:	3b 45 cc             	cmp    eax,DWORD PTR [rbp-0x34]
     415:	0f 9c c0             	setl   al
     418:	84 c0                	test   al,al
     41a:	0f 85 a5 fc ff ff    	jne    c5 <_Z16ParseCommandLineiPPc+0x20>
/home/odeshmukh/work/project/SSE/Params.h:202
            std::cerr << "Invalid argument " << argv[i] << std::endl;
            Usage(argv[0]);
            throw(std::string("Invalid argument"));
        }
    }
}
     420:	48 83 c4 28          	add    rsp,0x28
     424:	5b                   	pop    rbx
     425:	41 5c                	pop    r12
     427:	41 5d                	pop    r13
     429:	c9                   	leave  
     42a:	c3                   	ret    

000000000000042b <_Z5UsagePc>:
_Z5UsagePc():
/home/odeshmukh/work/project/SSE/Params.h:205

void Usage(char *name)
{
     42b:	55                   	push   rbp
     42c:	48 89 e5             	mov    rbp,rsp
     42f:	48 83 ec 10          	sub    rsp,0x10
     433:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/home/odeshmukh/work/project/SSE/Params.h:206
    printf("\tUsage: %s [-h] [-c] [-f <int>] [-i <int>] [-x <int>] [-y <int>]\n", name);
     437:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
     43b:	48 89 c6             	mov    rsi,rax
     43e:	bf 00 00 00 00       	mov    edi,0x0
     443:	b8 00 00 00 00       	mov    eax,0x0
     448:	e8 00 00 00 00       	call   44d <_Z5UsagePc+0x22>
/home/odeshmukh/work/project/SSE/Params.h:207
    printf("   -h       Print this help menu.\n");
     44d:	bf 00 00 00 00       	mov    edi,0x0
     452:	e8 00 00 00 00       	call   457 <_Z5UsagePc+0x2c>
/home/odeshmukh/work/project/SSE/Params.h:208
    printf("   -c       Supress CPU timing run.\n");
     457:	bf 00 00 00 00       	mov    edi,0x0
     45c:	e8 00 00 00 00       	call   461 <_Z5UsagePc+0x36>
/home/odeshmukh/work/project/SSE/Params.h:209
    printf("   -f <int> Sets the filter width.\n");
     461:	bf 00 00 00 00       	mov    edi,0x0
     466:	e8 00 00 00 00       	call   46b <_Z5UsagePc+0x40>
/home/odeshmukh/work/project/SSE/Params.h:210
    printf("   -i <int> Number of iterations.\n");
     46b:	bf 00 00 00 00       	mov    edi,0x0
     470:	e8 00 00 00 00       	call   475 <_Z5UsagePc+0x4a>
/home/odeshmukh/work/project/SSE/Params.h:211
    printf("   -x <int> Sets the image width.\n");
     475:	bf 00 00 00 00       	mov    edi,0x0
     47a:	e8 00 00 00 00       	call   47f <_Z5UsagePc+0x54>
/home/odeshmukh/work/project/SSE/Params.h:212
    printf("   -y <int> Sets the image height.\n");
     47f:	bf 00 00 00 00       	mov    edi,0x0
     484:	e8 00 00 00 00       	call   489 <_Z5UsagePc+0x5e>
/home/odeshmukh/work/project/SSE/Params.h:213
}
     489:	c9                   	leave  
     48a:	c3                   	ret    

000000000000048b <_Z15InitHostBuffersv>:
_Z15InitHostBuffersv():
/home/odeshmukh/work/project/SSE/main.cpp:146
/////////////////////////////////////////////////////////////////
// Host buffers
/////////////////////////////////////////////////////////////////

void InitHostBuffers()
{
     48b:	55                   	push   rbp
     48c:	48 89 e5             	mov    rbp,rsp
     48f:	41 55                	push   r13
     491:	41 54                	push   r12
     493:	53                   	push   rbx
     494:	48 83 ec 38          	sub    rsp,0x38
/home/odeshmukh/work/project/SSE/main.cpp:147
    hostBuffers.pInput  = NULL;
     498:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 4a3 <_Z15InitHostBuffersv+0x18>
     49f:	00 00 00 00 
/home/odeshmukh/work/project/SSE/main.cpp:148
    hostBuffers.pOutputCPU = NULL;
     4a3:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 4ae <_Z15InitHostBuffersv+0x23>
     4aa:	00 00 00 00 
/home/odeshmukh/work/project/SSE/main.cpp:153

    /////////////////////////////////////////////////////////////////
    // Allocate and initialize memory used by host 
    /////////////////////////////////////////////////////////////////
    int sizeInBytes = params.nInWidth * params.nInHeight * sizeof(float);
     4ae:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 4b4 <_Z15InitHostBuffersv+0x29>
     4b4:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 4ba <_Z15InitHostBuffersv+0x2f>
     4ba:	0f af c2             	imul   eax,edx
     4bd:	48 98                	cdqe   
     4bf:	c1 e0 02             	shl    eax,0x2
     4c2:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
/home/odeshmukh/work/project/SSE/main.cpp:154
    hostBuffers.pInput = (float *) malloc(sizeInBytes);
     4c5:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
     4c8:	48 98                	cdqe   
     4ca:	48 89 c7             	mov    rdi,rax
     4cd:	e8 00 00 00 00       	call   4d2 <_Z15InitHostBuffersv+0x47>
     4d2:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 4d9 <_Z15InitHostBuffersv+0x4e>
/home/odeshmukh/work/project/SSE/main.cpp:155
    if (!hostBuffers.pInput) 
     4d9:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 4e0 <_Z15InitHostBuffersv+0x55>
     4e0:	48 85 c0             	test   rax,rax
     4e3:	0f 85 83 00 00 00    	jne    56c <_Z15InitHostBuffersv+0xe1>
/home/odeshmukh/work/project/SSE/main.cpp:156
        throw(string("InitHostBuffers()::Could not allocate memory"));
     4e9:	48 8d 45 b9          	lea    rax,[rbp-0x47]
     4ed:	48 89 c7             	mov    rdi,rax
     4f0:	e8 00 00 00 00       	call   4f5 <_Z15InitHostBuffersv+0x6a>
     4f5:	4c 8d 65 b9          	lea    r12,[rbp-0x47]
     4f9:	bf 08 00 00 00       	mov    edi,0x8
     4fe:	e8 00 00 00 00       	call   503 <_Z15InitHostBuffersv+0x78>
     503:	48 89 c3             	mov    rbx,rax
     506:	48 89 d8             	mov    rax,rbx
     509:	4c 89 e2             	mov    rdx,r12
     50c:	be 00 00 00 00       	mov    esi,0x0
     511:	48 89 c7             	mov    rdi,rax
     514:	e8 00 00 00 00       	call   519 <_Z15InitHostBuffersv+0x8e>
     519:	eb 33                	jmp    54e <_Z15InitHostBuffersv+0xc3>
     51b:	41 89 d4             	mov    r12d,edx
     51e:	49 89 c5             	mov    r13,rax
     521:	48 89 df             	mov    rdi,rbx
     524:	e8 00 00 00 00       	call   529 <_Z15InitHostBuffersv+0x9e>
     529:	4c 89 e8             	mov    rax,r13
     52c:	49 63 d4             	movsxd rdx,r12d
     52f:	89 d3                	mov    ebx,edx
     531:	49 89 c4             	mov    r12,rax
     534:	48 8d 45 b9          	lea    rax,[rbp-0x47]
     538:	48 89 c7             	mov    rdi,rax
     53b:	e8 00 00 00 00       	call   540 <_Z15InitHostBuffersv+0xb5>
     540:	4c 89 e0             	mov    rax,r12
     543:	48 63 d3             	movsxd rdx,ebx
     546:	48 89 c7             	mov    rdi,rax
     549:	e8 00 00 00 00       	call   54e <_Z15InitHostBuffersv+0xc3>
     54e:	48 8d 45 b9          	lea    rax,[rbp-0x47]
     552:	48 89 c7             	mov    rdi,rax
     555:	e8 00 00 00 00       	call   55a <_Z15InitHostBuffersv+0xcf>
     55a:	ba 00 00 00 00       	mov    edx,0x0
     55f:	be 00 00 00 00       	mov    esi,0x0
     564:	48 89 df             	mov    rdi,rbx
     567:	e8 00 00 00 00       	call   56c <_Z15InitHostBuffersv+0xe1>
/home/odeshmukh/work/project/SSE/main.cpp:158

    int sizeOutBytes = params.nWidth * params.nHeight * sizeof(float);
     56c:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 572 <_Z15InitHostBuffersv+0xe7>
     572:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 578 <_Z15InitHostBuffersv+0xed>
     578:	0f af c2             	imul   eax,edx
     57b:	48 98                	cdqe   
     57d:	c1 e0 02             	shl    eax,0x2
     580:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
/home/odeshmukh/work/project/SSE/main.cpp:159
    hostBuffers.pOutputCPU = (float *) malloc(sizeOutBytes);
     583:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
     586:	48 98                	cdqe   
     588:	48 89 c7             	mov    rdi,rax
     58b:	e8 00 00 00 00       	call   590 <_Z15InitHostBuffersv+0x105>
     590:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 597 <_Z15InitHostBuffersv+0x10c>
/home/odeshmukh/work/project/SSE/main.cpp:160
    if (!hostBuffers.pOutputCPU) 
     597:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 59e <_Z15InitHostBuffersv+0x113>
     59e:	48 85 c0             	test   rax,rax
     5a1:	0f 85 83 00 00 00    	jne    62a <_Z15InitHostBuffersv+0x19f>
/home/odeshmukh/work/project/SSE/main.cpp:161
        throw(string("InitHostBuffers()::Could not allocate memory"));
     5a7:	48 8d 45 ba          	lea    rax,[rbp-0x46]
     5ab:	48 89 c7             	mov    rdi,rax
     5ae:	e8 00 00 00 00       	call   5b3 <_Z15InitHostBuffersv+0x128>
     5b3:	4c 8d 65 ba          	lea    r12,[rbp-0x46]
     5b7:	bf 08 00 00 00       	mov    edi,0x8
     5bc:	e8 00 00 00 00       	call   5c1 <_Z15InitHostBuffersv+0x136>
     5c1:	48 89 c3             	mov    rbx,rax
     5c4:	48 89 d8             	mov    rax,rbx
     5c7:	4c 89 e2             	mov    rdx,r12
     5ca:	be 00 00 00 00       	mov    esi,0x0
     5cf:	48 89 c7             	mov    rdi,rax
     5d2:	e8 00 00 00 00       	call   5d7 <_Z15InitHostBuffersv+0x14c>
     5d7:	eb 33                	jmp    60c <_Z15InitHostBuffersv+0x181>
     5d9:	41 89 d4             	mov    r12d,edx
     5dc:	49 89 c5             	mov    r13,rax
     5df:	48 89 df             	mov    rdi,rbx
     5e2:	e8 00 00 00 00       	call   5e7 <_Z15InitHostBuffersv+0x15c>
     5e7:	4c 89 e8             	mov    rax,r13
     5ea:	49 63 d4             	movsxd rdx,r12d
     5ed:	89 d3                	mov    ebx,edx
     5ef:	49 89 c4             	mov    r12,rax
     5f2:	48 8d 45 ba          	lea    rax,[rbp-0x46]
     5f6:	48 89 c7             	mov    rdi,rax
     5f9:	e8 00 00 00 00       	call   5fe <_Z15InitHostBuffersv+0x173>
     5fe:	4c 89 e0             	mov    rax,r12
     601:	48 63 d3             	movsxd rdx,ebx
     604:	48 89 c7             	mov    rdi,rax
     607:	e8 00 00 00 00       	call   60c <_Z15InitHostBuffersv+0x181>
     60c:	48 8d 45 ba          	lea    rax,[rbp-0x46]
     610:	48 89 c7             	mov    rdi,rax
     613:	e8 00 00 00 00       	call   618 <_Z15InitHostBuffersv+0x18d>
     618:	ba 00 00 00 00       	mov    edx,0x0
     61d:	be 00 00 00 00       	mov    esi,0x0
     622:	48 89 df             	mov    rdi,rbx
     625:	e8 00 00 00 00       	call   62a <_Z15InitHostBuffersv+0x19f>
/home/odeshmukh/work/project/SSE/main.cpp:163

    int filterSizeBytes = params.nFilterWidth * params.nFilterWidth * sizeof(float);
     62a:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 630 <_Z15InitHostBuffersv+0x1a5>
     630:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 636 <_Z15InitHostBuffersv+0x1ab>
     636:	0f af c2             	imul   eax,edx
     639:	48 98                	cdqe   
     63b:	c1 e0 02             	shl    eax,0x2
     63e:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
/home/odeshmukh/work/project/SSE/main.cpp:164
    hostBuffers.pFilter = (float *) malloc(filterSizeBytes);
     641:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
     644:	48 98                	cdqe   
     646:	48 89 c7             	mov    rdi,rax
     649:	e8 00 00 00 00       	call   64e <_Z15InitHostBuffersv+0x1c3>
     64e:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 655 <_Z15InitHostBuffersv+0x1ca>
/home/odeshmukh/work/project/SSE/main.cpp:165
    if (!hostBuffers.pFilter) 
     655:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 65c <_Z15InitHostBuffersv+0x1d1>
     65c:	48 85 c0             	test   rax,rax
     65f:	0f 85 83 00 00 00    	jne    6e8 <_Z15InitHostBuffersv+0x25d>
/home/odeshmukh/work/project/SSE/main.cpp:166
        throw(string("InitHostBuffers()::Could not allocate memory"));
     665:	48 8d 45 bb          	lea    rax,[rbp-0x45]
     669:	48 89 c7             	mov    rdi,rax
     66c:	e8 00 00 00 00       	call   671 <_Z15InitHostBuffersv+0x1e6>
     671:	4c 8d 65 bb          	lea    r12,[rbp-0x45]
     675:	bf 08 00 00 00       	mov    edi,0x8
     67a:	e8 00 00 00 00       	call   67f <_Z15InitHostBuffersv+0x1f4>
     67f:	48 89 c3             	mov    rbx,rax
     682:	48 89 d8             	mov    rax,rbx
     685:	4c 89 e2             	mov    rdx,r12
     688:	be 00 00 00 00       	mov    esi,0x0
     68d:	48 89 c7             	mov    rdi,rax
     690:	e8 00 00 00 00       	call   695 <_Z15InitHostBuffersv+0x20a>
     695:	eb 33                	jmp    6ca <_Z15InitHostBuffersv+0x23f>
     697:	41 89 d4             	mov    r12d,edx
     69a:	49 89 c5             	mov    r13,rax
     69d:	48 89 df             	mov    rdi,rbx
     6a0:	e8 00 00 00 00       	call   6a5 <_Z15InitHostBuffersv+0x21a>
     6a5:	4c 89 e8             	mov    rax,r13
     6a8:	49 63 d4             	movsxd rdx,r12d
     6ab:	89 d3                	mov    ebx,edx
     6ad:	49 89 c4             	mov    r12,rax
     6b0:	48 8d 45 bb          	lea    rax,[rbp-0x45]
     6b4:	48 89 c7             	mov    rdi,rax
     6b7:	e8 00 00 00 00       	call   6bc <_Z15InitHostBuffersv+0x231>
     6bc:	4c 89 e0             	mov    rax,r12
     6bf:	48 63 d3             	movsxd rdx,ebx
     6c2:	48 89 c7             	mov    rdi,rax
     6c5:	e8 00 00 00 00       	call   6ca <_Z15InitHostBuffersv+0x23f>
     6ca:	48 8d 45 bb          	lea    rax,[rbp-0x45]
     6ce:	48 89 c7             	mov    rdi,rax
     6d1:	e8 00 00 00 00       	call   6d6 <_Z15InitHostBuffersv+0x24b>
     6d6:	ba 00 00 00 00       	mov    edx,0x0
     6db:	be 00 00 00 00       	mov    esi,0x0
     6e0:	48 89 df             	mov    rdi,rbx
     6e3:	e8 00 00 00 00       	call   6e8 <_Z15InitHostBuffersv+0x25d>
/home/odeshmukh/work/project/SSE/main.cpp:168

    srand(0);
     6e8:	bf 00 00 00 00       	mov    edi,0x0
     6ed:	e8 00 00 00 00       	call   6f2 <_Z15InitHostBuffersv+0x267>
/home/odeshmukh/work/project/SSE/main.cpp:170
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nInWidth * params.nInHeight; i++)
     6f2:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
     6f9:	eb 25                	jmp    720 <_Z15InitHostBuffersv+0x295>
/home/odeshmukh/work/project/SSE/main.cpp:172
    {
        hostBuffers.pInput[i] = float(rand());
     6fb:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 702 <_Z15InitHostBuffersv+0x277>
     702:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
     705:	48 63 d2             	movsxd rdx,edx
     708:	48 c1 e2 02          	shl    rdx,0x2
     70c:	48 8d 1c 10          	lea    rbx,[rax+rdx*1]
     710:	e8 00 00 00 00       	call   715 <_Z15InitHostBuffersv+0x28a>
     715:	f3 0f 2a c0          	cvtsi2ss xmm0,eax
     719:	f3 0f 11 03          	movss  DWORD PTR [rbx],xmm0
/home/odeshmukh/work/project/SSE/main.cpp:170
    if (!hostBuffers.pFilter) 
        throw(string("InitHostBuffers()::Could not allocate memory"));

    srand(0);
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nInWidth * params.nInHeight; i++)
     71d:	ff 45 d4             	inc    DWORD PTR [rbp-0x2c]
     720:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 726 <_Z15InitHostBuffersv+0x29b>
     726:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 72c <_Z15InitHostBuffersv+0x2a1>
     72c:	0f af c2             	imul   eax,edx
     72f:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
     732:	0f 9f c0             	setg   al
     735:	84 c0                	test   al,al
     737:	75 c2                	jne    6fb <_Z15InitHostBuffersv+0x270>
/home/odeshmukh/work/project/SSE/main.cpp:175
    {
        hostBuffers.pInput[i] = float(rand());
    }

    double dFilterSum = 0;
     739:	b8 00 00 00 00       	mov    eax,0x0
     73e:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
/home/odeshmukh/work/project/SSE/main.cpp:176
    int nFilterSize = params.nFilterWidth*params.nFilterWidth;
     742:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 748 <_Z15InitHostBuffersv+0x2bd>
     748:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 74e <_Z15InitHostBuffersv+0x2c3>
     74e:	0f af c2             	imul   eax,edx
     751:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
/home/odeshmukh/work/project/SSE/main.cpp:177
    for (int i = 0; i < nFilterSize; i++)
     754:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
     75b:	eb 4f                	jmp    7ac <_Z15InitHostBuffersv+0x321>
/home/odeshmukh/work/project/SSE/main.cpp:179
    {
        hostBuffers.pFilter[i] = float(rand());
     75d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 764 <_Z15InitHostBuffersv+0x2d9>
     764:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
     767:	48 63 d2             	movsxd rdx,edx
     76a:	48 c1 e2 02          	shl    rdx,0x2
     76e:	48 8d 1c 10          	lea    rbx,[rax+rdx*1]
     772:	e8 00 00 00 00       	call   777 <_Z15InitHostBuffersv+0x2ec>
     777:	f3 0f 2a c0          	cvtsi2ss xmm0,eax
     77b:	f3 0f 11 03          	movss  DWORD PTR [rbx],xmm0
/home/odeshmukh/work/project/SSE/main.cpp:180
        dFilterSum += hostBuffers.pFilter[i];
     77f:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 786 <_Z15InitHostBuffersv+0x2fb>
     786:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
     789:	48 63 d2             	movsxd rdx,edx
     78c:	48 c1 e2 02          	shl    rdx,0x2
     790:	48 01 d0             	add    rax,rdx
     793:	f3 0f 10 00          	movss  xmm0,DWORD PTR [rax]
     797:	f3 0f 5a c0          	cvtss2sd xmm0,xmm0
     79b:	f2 0f 10 4d c8       	movsd  xmm1,QWORD PTR [rbp-0x38]
     7a0:	f2 0f 58 c1          	addsd  xmm0,xmm1
     7a4:	f2 0f 11 45 c8       	movsd  QWORD PTR [rbp-0x38],xmm0
/home/odeshmukh/work/project/SSE/main.cpp:177
        hostBuffers.pInput[i] = float(rand());
    }

    double dFilterSum = 0;
    int nFilterSize = params.nFilterWidth*params.nFilterWidth;
    for (int i = 0; i < nFilterSize; i++)
     7a9:	ff 45 d8             	inc    DWORD PTR [rbp-0x28]
     7ac:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
     7af:	3b 45 d0             	cmp    eax,DWORD PTR [rbp-0x30]
     7b2:	0f 9c c0             	setl   al
     7b5:	84 c0                	test   al,al
     7b7:	75 a4                	jne    75d <_Z15InitHostBuffersv+0x2d2>
/home/odeshmukh/work/project/SSE/main.cpp:182
    {
        hostBuffers.pFilter[i] = float(rand());
        dFilterSum += hostBuffers.pFilter[i];
    }
    for (int i = 0; i < nFilterSize; i++)
     7b9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
     7c0:	eb 40                	jmp    802 <_Z15InitHostBuffersv+0x377>
/home/odeshmukh/work/project/SSE/main.cpp:183
        hostBuffers.pFilter[i] /= dFilterSum;
     7c2:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 7c9 <_Z15InitHostBuffersv+0x33e>
     7c9:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
     7cc:	48 63 d2             	movsxd rdx,edx
     7cf:	48 c1 e2 02          	shl    rdx,0x2
     7d3:	48 01 d0             	add    rax,rdx
     7d6:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 7dd <_Z15InitHostBuffersv+0x352>
     7dd:	8b 4d dc             	mov    ecx,DWORD PTR [rbp-0x24]
     7e0:	48 63 c9             	movsxd rcx,ecx
     7e3:	48 c1 e1 02          	shl    rcx,0x2
     7e7:	48 01 ca             	add    rdx,rcx
     7ea:	f3 0f 10 02          	movss  xmm0,DWORD PTR [rdx]
     7ee:	f3 0f 5a c0          	cvtss2sd xmm0,xmm0
     7f2:	f2 0f 5e 45 c8       	divsd  xmm0,QWORD PTR [rbp-0x38]
     7f7:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
     7fb:	f3 0f 11 00          	movss  DWORD PTR [rax],xmm0
/home/odeshmukh/work/project/SSE/main.cpp:182
    for (int i = 0; i < nFilterSize; i++)
    {
        hostBuffers.pFilter[i] = float(rand());
        dFilterSum += hostBuffers.pFilter[i];
    }
    for (int i = 0; i < nFilterSize; i++)
     7ff:	ff 45 dc             	inc    DWORD PTR [rbp-0x24]
     802:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     805:	3b 45 d0             	cmp    eax,DWORD PTR [rbp-0x30]
     808:	0f 9c c0             	setl   al
     80b:	84 c0                	test   al,al
     80d:	75 b3                	jne    7c2 <_Z15InitHostBuffersv+0x337>
/home/odeshmukh/work/project/SSE/main.cpp:184
        hostBuffers.pFilter[i] /= dFilterSum;
}
     80f:	48 83 c4 38          	add    rsp,0x38
     813:	5b                   	pop    rbx
     814:	41 5c                	pop    r12
     816:	41 5d                	pop    r13
     818:	c9                   	leave  
     819:	c3                   	ret    

000000000000081a <_Z11ClearBufferPf>:
_Z11ClearBufferPf():
/home/odeshmukh/work/project/SSE/main.cpp:187

void ClearBuffer(float * pBuf)
{
     81a:	55                   	push   rbp
     81b:	48 89 e5             	mov    rbp,rsp
     81e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
/home/odeshmukh/work/project/SSE/main.cpp:189
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nWidth*params.nHeight; i++)
     822:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
     829:	eb 17                	jmp    842 <_Z11ClearBufferPf+0x28>
/home/odeshmukh/work/project/SSE/main.cpp:191
    {
        pBuf[i] = -999.999f;
     82b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
     82e:	48 98                	cdqe   
     830:	48 c1 e0 02          	shl    rax,0x2
     834:	48 03 45 e8          	add    rax,QWORD PTR [rbp-0x18]
     838:	ba f0 ff 79 c4       	mov    edx,0xc479fff0
     83d:	89 10                	mov    DWORD PTR [rax],edx
/home/odeshmukh/work/project/SSE/main.cpp:189
}

void ClearBuffer(float * pBuf)
{
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nWidth*params.nHeight; i++)
     83f:	ff 45 fc             	inc    DWORD PTR [rbp-0x4]
     842:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 848 <_Z11ClearBufferPf+0x2e>
     848:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 84e <_Z11ClearBufferPf+0x34>
     84e:	0f af c2             	imul   eax,edx
     851:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
     854:	0f 9f c0             	setg   al
     857:	84 c0                	test   al,al
     859:	75 d0                	jne    82b <_Z11ClearBufferPf+0x11>
/home/odeshmukh/work/project/SSE/main.cpp:193
    {
        pBuf[i] = -999.999f;
    }
}
     85b:	c9                   	leave  
     85c:	c3                   	ret    

000000000000085d <_Z18ReleaseHostBuffersv>:
_Z18ReleaseHostBuffersv():
/home/odeshmukh/work/project/SSE/main.cpp:196

void ReleaseHostBuffers()
{
     85d:	55                   	push   rbp
     85e:	48 89 e5             	mov    rbp,rsp
/home/odeshmukh/work/project/SSE/main.cpp:197
    FREE(hostBuffers.pInput, NULL);
     861:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 868 <_Z18ReleaseHostBuffersv+0xb>
     868:	48 85 c0             	test   rax,rax
     86b:	74 1a                	je     887 <_Z18ReleaseHostBuffersv+0x2a>
     86d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 874 <_Z18ReleaseHostBuffersv+0x17>
     874:	48 89 c7             	mov    rdi,rax
     877:	e8 00 00 00 00       	call   87c <_Z18ReleaseHostBuffersv+0x1f>
     87c:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 887 <_Z18ReleaseHostBuffersv+0x2a>
     883:	00 00 00 00 
/home/odeshmukh/work/project/SSE/main.cpp:198
    FREE(hostBuffers.pOutputCPU, NULL);
     887:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 88e <_Z18ReleaseHostBuffersv+0x31>
     88e:	48 85 c0             	test   rax,rax
     891:	74 1a                	je     8ad <_Z18ReleaseHostBuffersv+0x50>
     893:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 89a <_Z18ReleaseHostBuffersv+0x3d>
     89a:	48 89 c7             	mov    rdi,rax
     89d:	e8 00 00 00 00       	call   8a2 <_Z18ReleaseHostBuffersv+0x45>
     8a2:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 8ad <_Z18ReleaseHostBuffersv+0x50>
     8a9:	00 00 00 00 
/home/odeshmukh/work/project/SSE/main.cpp:199
    FREE(hostBuffers.pFilter, NULL);
     8ad:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 8b4 <_Z18ReleaseHostBuffersv+0x57>
     8b4:	48 85 c0             	test   rax,rax
     8b7:	74 1a                	je     8d3 <_Z18ReleaseHostBuffersv+0x76>
     8b9:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 8c0 <_Z18ReleaseHostBuffersv+0x63>
     8c0:	48 89 c7             	mov    rdi,rax
     8c3:	e8 00 00 00 00       	call   8c8 <_Z18ReleaseHostBuffersv+0x6b>
     8c8:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 8d3 <_Z18ReleaseHostBuffersv+0x76>
     8cf:	00 00 00 00 
/home/odeshmukh/work/project/SSE/main.cpp:200
}
     8d3:	c9                   	leave  
     8d4:	c3                   	ret    

00000000000008d5 <_Z8ConvolvePfS_S_iiiii>:
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:209
/////////////////////////////////////////////////////////////////

void Convolve(float * pInput, float * pFilter, float * pOutput,
          const int nInWidth, const int nWidth, const int nHeight,
          const int nFilterWidth, const int nNumThreads)
{
     8d5:	55                   	push   rbp
     8d6:	48 89 e5             	mov    rbp,rsp
     8d9:	48 81 ec 28 01 00 00 	sub    rsp,0x128
     8e0:	48 89 bd 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rdi
     8e7:	48 89 b5 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],rsi
     8ee:	48 89 95 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],rdx
     8f5:	89 8d 74 fe ff ff    	mov    DWORD PTR [rbp-0x18c],ecx
     8fb:	44 89 85 70 fe ff ff 	mov    DWORD PTR [rbp-0x190],r8d
     902:	44 89 8d 6c fe ff ff 	mov    DWORD PTR [rbp-0x194],r9d
/home/odeshmukh/work/project/SSE/main.cpp:211
    #pragma omp parallel for num_threads(nNumThreads)
    for (int yOut = 0; yOut < nHeight; yOut++)
     909:	c7 85 9c fe ff ff 00 	mov    DWORD PTR [rbp-0x164],0x0
     910:	00 00 00 
     913:	e9 94 02 00 00       	jmp    bac <_Z8ConvolvePfS_S_iiiii+0x2d7>
/home/odeshmukh/work/project/SSE/main.cpp:213
    {
        const int yInTopLeft = yOut;
     918:	8b 85 9c fe ff ff    	mov    eax,DWORD PTR [rbp-0x164]
     91e:	89 85 a0 fe ff ff    	mov    DWORD PTR [rbp-0x160],eax
/home/odeshmukh/work/project/SSE/main.cpp:215

        for (int xOut = 0; xOut < nWidth; xOut++)
     924:	c7 85 a4 fe ff ff 00 	mov    DWORD PTR [rbp-0x15c],0x0
     92b:	00 00 00 
     92e:	e9 5c 02 00 00       	jmp    b8f <_Z8ConvolvePfS_S_iiiii+0x2ba>
/home/odeshmukh/work/project/SSE/main.cpp:217
        {
            const int xInTopLeft = xOut;
     933:	8b 85 a4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x15c]
     939:	89 85 a8 fe ff ff    	mov    DWORD PTR [rbp-0x158],eax
/home/odeshmukh/work/project/SSE/main.cpp:220

            // Core
            float sum = 0;
     93f:	b8 00 00 00 00       	mov    eax,0x0
     944:	89 85 ac fe ff ff    	mov    DWORD PTR [rbp-0x154],eax
     94a:	b8 00 00 00 00       	mov    eax,0x0
     94f:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
_mm_set1_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/xmmintrin.h:866

/* Create a vector with all four elements equal to F.  */
extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_ps (float __F)
{
  return __extension__ (__m128)(__v4sf){ __F, __F, __F, __F };
     955:	f3 0f 10 85 58 ff ff 	movss  xmm0,DWORD PTR [rbp-0xa8]
     95c:	ff 
     95d:	0f c6 c0 00          	shufps xmm0,xmm0,0x0
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:221
            __m128 prod __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
     961:	0f 29 85 b0 fe ff ff 	movaps XMMWORD PTR [rbp-0x150],xmm0
     968:	b8 00 00 00 00       	mov    eax,0x0
     96d:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
_mm_set1_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/xmmintrin.h:866
     973:	f3 0f 10 85 5c ff ff 	movss  xmm0,DWORD PTR [rbp-0xa4]
     97a:	ff 
     97b:	0f c6 c0 00          	shufps xmm0,xmm0,0x0
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:222
            __m128 acc __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
     97f:	0f 29 85 c0 fe ff ff 	movaps XMMWORD PTR [rbp-0x140],xmm0
/home/odeshmukh/work/project/SSE/main.cpp:225
            __m128 data __attribute__ ((aligned (16)));
            __m128 kernel __attribute__ ((aligned (16)));
            for (int r = 0; r < nFilterWidth; r++)
     986:	c7 85 f8 fe ff ff 00 	mov    DWORD PTR [rbp-0x108],0x0
     98d:	00 00 00 
     990:	e9 44 01 00 00       	jmp    ad9 <_Z8ConvolvePfS_S_iiiii+0x204>
/home/odeshmukh/work/project/SSE/main.cpp:227
            {
                const int idxFtmp = r * nFilterWidth;
     995:	8b 85 f8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x108]
     99b:	0f af 45 10          	imul   eax,DWORD PTR [rbp+0x10]
     99f:	89 85 fc fe ff ff    	mov    DWORD PTR [rbp-0x104],eax
/home/odeshmukh/work/project/SSE/main.cpp:229

                const int yIn = yInTopLeft + r;
     9a5:	8b 85 f8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x108]
     9ab:	8b 95 a0 fe ff ff    	mov    edx,DWORD PTR [rbp-0x160]
     9b1:	8d 04 02             	lea    eax,[rdx+rax*1]
     9b4:	89 85 00 ff ff ff    	mov    DWORD PTR [rbp-0x100],eax
/home/odeshmukh/work/project/SSE/main.cpp:230
                const int idxIntmp = yIn * nInWidth + xInTopLeft;
     9ba:	8b 85 00 ff ff ff    	mov    eax,DWORD PTR [rbp-0x100]
     9c0:	0f af 85 74 fe ff ff 	imul   eax,DWORD PTR [rbp-0x18c]
     9c7:	03 85 a8 fe ff ff    	add    eax,DWORD PTR [rbp-0x158]
     9cd:	89 85 04 ff ff ff    	mov    DWORD PTR [rbp-0xfc],eax
/home/odeshmukh/work/project/SSE/main.cpp:241
                    const int idxIn = idxIntmp + c;    
                    sum += pFilter[idxF]*pInput[idxIn];
                }
                }
                else {
                for (int c = 0; c < nFilterWidth; c+=4)
     9d3:	c7 85 14 ff ff ff 00 	mov    DWORD PTR [rbp-0xec],0x0
     9da:	00 00 00 
     9dd:	e9 dd 00 00 00       	jmp    abf <_Z8ConvolvePfS_S_iiiii+0x1ea>
/home/odeshmukh/work/project/SSE/main.cpp:243
                {
                  const int idxF  = idxFtmp  + c;
     9e2:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
     9e8:	8b 95 fc fe ff ff    	mov    edx,DWORD PTR [rbp-0x104]
     9ee:	8d 04 02             	lea    eax,[rdx+rax*1]
     9f1:	89 85 18 ff ff ff    	mov    DWORD PTR [rbp-0xe8],eax
/home/odeshmukh/work/project/SSE/main.cpp:244
                  const int idxIn = idxIntmp + c;    
     9f7:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
     9fd:	8b 95 04 ff ff ff    	mov    edx,DWORD PTR [rbp-0xfc]
     a03:	8d 04 02             	lea    eax,[rdx+rax*1]
     a06:	89 85 1c ff ff ff    	mov    DWORD PTR [rbp-0xe4],eax
/home/odeshmukh/work/project/SSE/main.cpp:245
                  data = _mm_loadu_ps(pInput + idxIn);
     a0c:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
     a12:	48 98                	cdqe   
     a14:	48 c1 e0 02          	shl    rax,0x2
     a18:	48 03 85 88 fe ff ff 	add    rax,QWORD PTR [rbp-0x178]
     a1f:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
_mm_loadu_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/xmmintrin.h:906

/* Load four SPFP values from P.  The address need not be 16-byte aligned.  */
extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadu_ps (float const *__P)
{
  return (__m128) __builtin_ia32_loadups (__P);
     a26:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
     a2d:	0f 10 00             	movups xmm0,XMMWORD PTR [rax]
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:245
     a30:	0f 29 85 d0 fe ff ff 	movaps XMMWORD PTR [rbp-0x130],xmm0
/home/odeshmukh/work/project/SSE/main.cpp:246
                  kernel = _mm_loadu_ps(pFilter + idxF);
     a37:	8b 85 18 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe8]
     a3d:	48 98                	cdqe   
     a3f:	48 c1 e0 02          	shl    rax,0x2
     a43:	48 03 85 80 fe ff ff 	add    rax,QWORD PTR [rbp-0x180]
     a4a:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
_mm_loadu_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/xmmintrin.h:906
     a51:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
     a58:	0f 10 00             	movups xmm0,XMMWORD PTR [rax]
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:246
     a5b:	0f 29 85 e0 fe ff ff 	movaps XMMWORD PTR [rbp-0x120],xmm0
     a62:	0f 28 85 d0 fe ff ff 	movaps xmm0,XMMWORD PTR [rbp-0x130]
     a69:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
     a6d:	0f 28 85 e0 fe ff ff 	movaps xmm0,XMMWORD PTR [rbp-0x120]
     a74:	0f 29 85 70 ff ff ff 	movaps XMMWORD PTR [rbp-0x90],xmm0
_mm_mul_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/xmmintrin.h:170
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_mulps ((__v4sf)__A, (__v4sf)__B);
     a7b:	0f 28 85 70 ff ff ff 	movaps xmm0,XMMWORD PTR [rbp-0x90]
     a82:	0f 28 4d 80          	movaps xmm1,XMMWORD PTR [rbp-0x80]
     a86:	0f 59 c1             	mulps  xmm0,xmm1
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:247
                  prod = _mm_mul_ps(data, kernel);
     a89:	0f 29 85 b0 fe ff ff 	movaps XMMWORD PTR [rbp-0x150],xmm0
     a90:	0f 28 85 b0 fe ff ff 	movaps xmm0,XMMWORD PTR [rbp-0x150]
     a97:	0f 29 45 a0          	movaps XMMWORD PTR [rbp-0x60],xmm0
     a9b:	0f 28 85 c0 fe ff ff 	movaps xmm0,XMMWORD PTR [rbp-0x140]
     aa2:	0f 29 45 90          	movaps XMMWORD PTR [rbp-0x70],xmm0
_mm_add_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/xmmintrin.h:158
/* Perform the respective operation on the four SPFP values in A and B.  */

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_addps ((__v4sf)__A, (__v4sf)__B);
     aa6:	0f 28 45 90          	movaps xmm0,XMMWORD PTR [rbp-0x70]
     aaa:	0f 28 4d a0          	movaps xmm1,XMMWORD PTR [rbp-0x60]
     aae:	0f 58 c1             	addps  xmm0,xmm1
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:248
                  acc = _mm_add_ps(prod, acc);
     ab1:	0f 29 85 c0 fe ff ff 	movaps XMMWORD PTR [rbp-0x140],xmm0
/home/odeshmukh/work/project/SSE/main.cpp:241
                    const int idxIn = idxIntmp + c;    
                    sum += pFilter[idxF]*pInput[idxIn];
                }
                }
                else {
                for (int c = 0; c < nFilterWidth; c+=4)
     ab8:	83 85 14 ff ff ff 04 	add    DWORD PTR [rbp-0xec],0x4
     abf:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
     ac5:	3b 45 10             	cmp    eax,DWORD PTR [rbp+0x10]
     ac8:	0f 9c c0             	setl   al
     acb:	84 c0                	test   al,al
     acd:	0f 85 0f ff ff ff    	jne    9e2 <_Z8ConvolvePfS_S_iiiii+0x10d>
/home/odeshmukh/work/project/SSE/main.cpp:225
            float sum = 0;
            __m128 prod __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
            __m128 acc __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
            __m128 data __attribute__ ((aligned (16)));
            __m128 kernel __attribute__ ((aligned (16)));
            for (int r = 0; r < nFilterWidth; r++)
     ad3:	ff 85 f8 fe ff ff    	inc    DWORD PTR [rbp-0x108]
     ad9:	8b 85 f8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x108]
     adf:	3b 45 10             	cmp    eax,DWORD PTR [rbp+0x10]
     ae2:	0f 9c c0             	setl   al
     ae5:	84 c0                	test   al,al
     ae7:	0f 85 a8 fe ff ff    	jne    995 <_Z8ConvolvePfS_S_iiiii+0xc0>
     aed:	0f 28 85 c0 fe ff ff 	movaps xmm0,XMMWORD PTR [rbp-0x140]
     af4:	0f 29 45 c0          	movaps XMMWORD PTR [rbp-0x40],xmm0
     af8:	0f 28 85 c0 fe ff ff 	movaps xmm0,XMMWORD PTR [rbp-0x140]
     aff:	0f 29 45 b0          	movaps XMMWORD PTR [rbp-0x50],xmm0
_mm_hadd_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/pmmintrin.h:57
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_ps (__m128 __X, __m128 __Y)
{
  return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
     b03:	0f 28 45 c0          	movaps xmm0,XMMWORD PTR [rbp-0x40]
     b07:	f2 0f 7c 45 b0       	haddps xmm0,XMMWORD PTR [rbp-0x50]
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:253
                  acc = _mm_add_ps(prod, acc);
                }
                }
            } 
            if (SSE) {
            __m128 t1 = _mm_hadd_ps(acc, acc);
     b0c:	0f 29 85 20 ff ff ff 	movaps XMMWORD PTR [rbp-0xe0],xmm0
     b13:	0f 28 85 20 ff ff ff 	movaps xmm0,XMMWORD PTR [rbp-0xe0]
     b1a:	0f 29 45 e0          	movaps XMMWORD PTR [rbp-0x20],xmm0
     b1e:	0f 28 85 20 ff ff ff 	movaps xmm0,XMMWORD PTR [rbp-0xe0]
     b25:	0f 29 45 d0          	movaps XMMWORD PTR [rbp-0x30],xmm0
_mm_hadd_ps():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/pmmintrin.h:57
     b29:	0f 28 45 e0          	movaps xmm0,XMMWORD PTR [rbp-0x20]
     b2d:	f2 0f 7c 45 d0       	haddps xmm0,XMMWORD PTR [rbp-0x30]
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:254
            __m128 t2 = _mm_hadd_ps(t1,t1);
     b32:	0f 29 85 30 ff ff ff 	movaps XMMWORD PTR [rbp-0xd0],xmm0
     b39:	0f 28 85 30 ff ff ff 	movaps xmm0,XMMWORD PTR [rbp-0xd0]
     b40:	0f 29 45 f0          	movaps XMMWORD PTR [rbp-0x10],xmm0
_mm_cvtss_f32():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/include/xmmintrin.h:941
}

extern __inline float __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_f32 (__m128 __A)
{
  return __builtin_ia32_vec_ext_v4sf ((__v4sf)__A, 0);
     b44:	0f 28 45 f0          	movaps xmm0,XMMWORD PTR [rbp-0x10]
     b48:	0f 28 c0             	movaps xmm0,xmm0
     b4b:	66 0f 7e c0          	movd   eax,xmm0
_Z8ConvolvePfS_S_iiiii():
/home/odeshmukh/work/project/SSE/main.cpp:255
            float sum2 = _mm_cvtss_f32(t2);
     b4f:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
/home/odeshmukh/work/project/SSE/main.cpp:256
            const int idxOut = yOut * nWidth + xOut;
     b55:	8b 85 9c fe ff ff    	mov    eax,DWORD PTR [rbp-0x164]
     b5b:	0f af 85 70 fe ff ff 	imul   eax,DWORD PTR [rbp-0x190]
     b62:	03 85 a4 fe ff ff    	add    eax,DWORD PTR [rbp-0x15c]
     b68:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
/home/odeshmukh/work/project/SSE/main.cpp:257
            pOutput[idxOut] = sum2;
     b6e:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
     b74:	48 98                	cdqe   
     b76:	48 c1 e0 02          	shl    rax,0x2
     b7a:	48 03 85 78 fe ff ff 	add    rax,QWORD PTR [rbp-0x188]
     b81:	8b 95 4c ff ff ff    	mov    edx,DWORD PTR [rbp-0xb4]
     b87:	89 10                	mov    DWORD PTR [rax],edx
/home/odeshmukh/work/project/SSE/main.cpp:215
    #pragma omp parallel for num_threads(nNumThreads)
    for (int yOut = 0; yOut < nHeight; yOut++)
    {
        const int yInTopLeft = yOut;

        for (int xOut = 0; xOut < nWidth; xOut++)
     b89:	ff 85 a4 fe ff ff    	inc    DWORD PTR [rbp-0x15c]
     b8f:	8b 85 a4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x15c]
     b95:	3b 85 70 fe ff ff    	cmp    eax,DWORD PTR [rbp-0x190]
     b9b:	0f 9c c0             	setl   al
     b9e:	84 c0                	test   al,al
     ba0:	0f 85 8d fd ff ff    	jne    933 <_Z8ConvolvePfS_S_iiiii+0x5e>
/home/odeshmukh/work/project/SSE/main.cpp:211
void Convolve(float * pInput, float * pFilter, float * pOutput,
          const int nInWidth, const int nWidth, const int nHeight,
          const int nFilterWidth, const int nNumThreads)
{
    #pragma omp parallel for num_threads(nNumThreads)
    for (int yOut = 0; yOut < nHeight; yOut++)
     ba6:	ff 85 9c fe ff ff    	inc    DWORD PTR [rbp-0x164]
     bac:	8b 85 9c fe ff ff    	mov    eax,DWORD PTR [rbp-0x164]
     bb2:	3b 85 6c fe ff ff    	cmp    eax,DWORD PTR [rbp-0x194]
     bb8:	0f 9c c0             	setl   al
     bbb:	84 c0                	test   al,al
     bbd:	0f 85 55 fd ff ff    	jne    918 <_Z8ConvolvePfS_S_iiiii+0x43>
/home/odeshmukh/work/project/SSE/main.cpp:266
            pOutput[idxOut] = sum;
            }

        } 
    }
}
     bc3:	c9                   	leave  
     bc4:	c3                   	ret    

0000000000000bc5 <_Z6RunCPUi>:
_Z6RunCPUi():
/home/odeshmukh/work/project/SSE/main.cpp:269

void RunCPU(int run)
{
     bc5:	55                   	push   rbp
     bc6:	48 89 e5             	mov    rbp,rsp
     bc9:	53                   	push   rbx
     bca:	48 83 ec 38          	sub    rsp,0x38
     bce:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
/home/odeshmukh/work/project/SSE/main.cpp:270
    if (params.bCPUTiming)
     bd1:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # bd8 <_Z6RunCPUi+0x13>
     bd8:	84 c0                	test   al,al
     bda:	0f 84 f6 00 00 00    	je     cd6 <_Z6RunCPUi+0x111>
/home/odeshmukh/work/project/SSE/main.cpp:273
    {
        cout << "\n********    Starting CPU (" << params.ompThreads[run]
             << "-threads) run    ********" << endl;
     be0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     be3:	48 98                	cdqe   
     be5:	48 89 c6             	mov    rsi,rax
     be8:	bf 00 00 00 00       	mov    edi,0x0
     bed:	e8 00 00 00 00       	call   bf2 <_Z6RunCPUi+0x2d>
     bf2:	8b 18                	mov    ebx,DWORD PTR [rax]
     bf4:	be 00 00 00 00       	mov    esi,0x0
     bf9:	bf 00 00 00 00       	mov    edi,0x0
     bfe:	e8 00 00 00 00       	call   c03 <_Z6RunCPUi+0x3e>
     c03:	89 de                	mov    esi,ebx
     c05:	48 89 c7             	mov    rdi,rax
     c08:	e8 00 00 00 00       	call   c0d <_Z6RunCPUi+0x48>
     c0d:	be 00 00 00 00       	mov    esi,0x0
     c12:	48 89 c7             	mov    rdi,rax
     c15:	e8 00 00 00 00       	call   c1a <_Z6RunCPUi+0x55>
     c1a:	be 00 00 00 00       	mov    esi,0x0
     c1f:	48 89 c7             	mov    rdi,rax
     c22:	e8 00 00 00 00       	call   c27 <_Z6RunCPUi+0x62>
/home/odeshmukh/work/project/SSE/main.cpp:275

        timers.counter.Reset();
     c27:	bf 00 00 00 00       	mov    edi,0x0
     c2c:	e8 00 00 00 00       	call   c31 <_Z6RunCPUi+0x6c>
/home/odeshmukh/work/project/SSE/main.cpp:276
        timers.counter.Start();
     c31:	bf 00 00 00 00       	mov    edi,0x0
     c36:	e8 00 00 00 00       	call   c3b <_Z6RunCPUi+0x76>
/home/odeshmukh/work/project/SSE/main.cpp:278

        for (int i = 0; i < params.nIterations; i++)
     c3b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
     c42:	eb 58                	jmp    c9c <_Z6RunCPUi+0xd7>
/home/odeshmukh/work/project/SSE/main.cpp:283
            Convolve(hostBuffers.pInput, hostBuffers.pFilter, hostBuffers.pOutputCPU,
                        params.nInWidth,
                        params.nWidth, params.nHeight, 
                        params.nFilterWidth,
                        params.ompThreads[run]);
     c44:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     c47:	48 98                	cdqe   
     c49:	48 89 c6             	mov    rsi,rax
     c4c:	bf 00 00 00 00       	mov    edi,0x0
     c51:	e8 00 00 00 00       	call   c56 <_Z6RunCPUi+0x91>
     c56:	8b 38                	mov    edi,DWORD PTR [rax]
     c58:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # c5e <_Z6RunCPUi+0x99>
     c5e:	44 8b 0d 00 00 00 00 	mov    r9d,DWORD PTR [rip+0x0]        # c65 <_Z6RunCPUi+0xa0>
     c65:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # c6c <_Z6RunCPUi+0xa7>
     c6c:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # c72 <_Z6RunCPUi+0xad>
     c72:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # c79 <_Z6RunCPUi+0xb4>
     c79:	48 8b 1d 00 00 00 00 	mov    rbx,QWORD PTR [rip+0x0]        # c80 <_Z6RunCPUi+0xbb>
     c80:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # c87 <_Z6RunCPUi+0xc2>
     c87:	89 7c 24 08          	mov    DWORD PTR [rsp+0x8],edi
     c8b:	89 34 24             	mov    DWORD PTR [rsp],esi
     c8e:	48 89 de             	mov    rsi,rbx
     c91:	48 89 c7             	mov    rdi,rax
     c94:	e8 00 00 00 00       	call   c99 <_Z6RunCPUi+0xd4>
/home/odeshmukh/work/project/SSE/main.cpp:278
             << "-threads) run    ********" << endl;

        timers.counter.Reset();
        timers.counter.Start();

        for (int i = 0; i < params.nIterations; i++)
     c99:	ff 45 ec             	inc    DWORD PTR [rbp-0x14]
     c9c:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # ca2 <_Z6RunCPUi+0xdd>
     ca2:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
     ca5:	0f 9f c0             	setg   al
     ca8:	84 c0                	test   al,al
     caa:	75 98                	jne    c44 <_Z6RunCPUi+0x7f>
/home/odeshmukh/work/project/SSE/main.cpp:285
                        params.nInWidth,
                        params.nWidth, params.nHeight, 
                        params.nFilterWidth,
                        params.ompThreads[run]);

        timers.counter.Stop();
     cac:	bf 00 00 00 00       	mov    edi,0x0
     cb1:	e8 00 00 00 00       	call   cb6 <_Z6RunCPUi+0xf1>
/home/odeshmukh/work/project/SSE/main.cpp:286
        timers.dCpuTime = timers.counter.GetElapsedTime()/double(params.nIterations);
     cb6:	bf 00 00 00 00       	mov    edi,0x0
     cbb:	e8 00 00 00 00       	call   cc0 <_Z6RunCPUi+0xfb>
     cc0:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # cc6 <_Z6RunCPUi+0x101>
     cc6:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
     cca:	f2 0f 5e c1          	divsd  xmm0,xmm1
     cce:	f2 0f 11 05 00 00 00 	movsd  QWORD PTR [rip+0x0],xmm0        # cd6 <_Z6RunCPUi+0x111>
     cd5:	00 
/home/odeshmukh/work/project/SSE/main.cpp:288
    }
}
     cd6:	48 83 c4 38          	add    rsp,0x38
     cda:	5b                   	pop    rbx
     cdb:	c9                   	leave  
     cdc:	c3                   	ret    

0000000000000cdd <_Z9PrintInfov>:
_Z9PrintInfov():
/home/odeshmukh/work/project/SSE/main.cpp:295
/////////////////////////////////////////////////////////////////
// Print info, timing 
/////////////////////////////////////////////////////////////////

void PrintInfo()
{
     cdd:	55                   	push   rbp
     cde:	48 89 e5             	mov    rbp,rsp
     ce1:	41 54                	push   r12
     ce3:	53                   	push   rbx
     ce4:	48 83 ec 10          	sub    rsp,0x10
/home/odeshmukh/work/project/SSE/main.cpp:296
    cout << endl;
     ce8:	be 00 00 00 00       	mov    esi,0x0
     ced:	bf 00 00 00 00       	mov    edi,0x0
     cf2:	e8 00 00 00 00       	call   cf7 <_Z9PrintInfov+0x1a>
/home/odeshmukh/work/project/SSE/main.cpp:297
    cout << "Width:          " << params.nWidth << endl;
     cf7:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # cfd <_Z9PrintInfov+0x20>
     cfd:	be 00 00 00 00       	mov    esi,0x0
     d02:	bf 00 00 00 00       	mov    edi,0x0
     d07:	e8 00 00 00 00       	call   d0c <_Z9PrintInfov+0x2f>
     d0c:	89 de                	mov    esi,ebx
     d0e:	48 89 c7             	mov    rdi,rax
     d11:	e8 00 00 00 00       	call   d16 <_Z9PrintInfov+0x39>
     d16:	be 00 00 00 00       	mov    esi,0x0
     d1b:	48 89 c7             	mov    rdi,rax
     d1e:	e8 00 00 00 00       	call   d23 <_Z9PrintInfov+0x46>
/home/odeshmukh/work/project/SSE/main.cpp:298
    cout << "Height:         " << params.nHeight << endl;
     d23:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # d29 <_Z9PrintInfov+0x4c>
     d29:	be 00 00 00 00       	mov    esi,0x0
     d2e:	bf 00 00 00 00       	mov    edi,0x0
     d33:	e8 00 00 00 00       	call   d38 <_Z9PrintInfov+0x5b>
     d38:	89 de                	mov    esi,ebx
     d3a:	48 89 c7             	mov    rdi,rax
     d3d:	e8 00 00 00 00       	call   d42 <_Z9PrintInfov+0x65>
     d42:	be 00 00 00 00       	mov    esi,0x0
     d47:	48 89 c7             	mov    rdi,rax
     d4a:	e8 00 00 00 00       	call   d4f <_Z9PrintInfov+0x72>
/home/odeshmukh/work/project/SSE/main.cpp:300
    cout << "Filter Size:    " << params.nFilterWidth << " x "
                                << params.nFilterWidth << endl;
     d4f:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # d55 <_Z9PrintInfov+0x78>
     d55:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # d5c <_Z9PrintInfov+0x7f>
     d5c:	be 00 00 00 00       	mov    esi,0x0
     d61:	bf 00 00 00 00       	mov    edi,0x0
     d66:	e8 00 00 00 00       	call   d6b <_Z9PrintInfov+0x8e>
     d6b:	44 89 e6             	mov    esi,r12d
     d6e:	48 89 c7             	mov    rdi,rax
     d71:	e8 00 00 00 00       	call   d76 <_Z9PrintInfov+0x99>
     d76:	be 00 00 00 00       	mov    esi,0x0
     d7b:	48 89 c7             	mov    rdi,rax
     d7e:	e8 00 00 00 00       	call   d83 <_Z9PrintInfov+0xa6>
     d83:	89 de                	mov    esi,ebx
     d85:	48 89 c7             	mov    rdi,rax
     d88:	e8 00 00 00 00       	call   d8d <_Z9PrintInfov+0xb0>
     d8d:	be 00 00 00 00       	mov    esi,0x0
     d92:	48 89 c7             	mov    rdi,rax
     d95:	e8 00 00 00 00       	call   d9a <_Z9PrintInfov+0xbd>
/home/odeshmukh/work/project/SSE/main.cpp:301
    cout << "Iterations:     " << params.nIterations << endl;
     d9a:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # da0 <_Z9PrintInfov+0xc3>
     da0:	be 00 00 00 00       	mov    esi,0x0
     da5:	bf 00 00 00 00       	mov    edi,0x0
     daa:	e8 00 00 00 00       	call   daf <_Z9PrintInfov+0xd2>
     daf:	89 de                	mov    esi,ebx
     db1:	48 89 c7             	mov    rdi,rax
     db4:	e8 00 00 00 00       	call   db9 <_Z9PrintInfov+0xdc>
     db9:	be 00 00 00 00       	mov    esi,0x0
     dbe:	48 89 c7             	mov    rdi,rax
     dc1:	e8 00 00 00 00       	call   dc6 <_Z9PrintInfov+0xe9>
/home/odeshmukh/work/project/SSE/main.cpp:302
    cout << "CPU Timing:     " << (params.bCPUTiming ? "True":"False") << endl;
     dc6:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # dcd <_Z9PrintInfov+0xf0>
     dcd:	84 c0                	test   al,al
     dcf:	74 07                	je     dd8 <_Z9PrintInfov+0xfb>
     dd1:	bb 00 00 00 00       	mov    ebx,0x0
     dd6:	eb 05                	jmp    ddd <_Z9PrintInfov+0x100>
     dd8:	bb 00 00 00 00       	mov    ebx,0x0
     ddd:	be 00 00 00 00       	mov    esi,0x0
     de2:	bf 00 00 00 00       	mov    edi,0x0
     de7:	e8 00 00 00 00       	call   dec <_Z9PrintInfov+0x10f>
     dec:	48 89 de             	mov    rsi,rbx
     def:	48 89 c7             	mov    rdi,rax
     df2:	e8 00 00 00 00       	call   df7 <_Z9PrintInfov+0x11a>
     df7:	be 00 00 00 00       	mov    esi,0x0
     dfc:	48 89 c7             	mov    rdi,rax
     dff:	e8 00 00 00 00       	call   e04 <_Z9PrintInfov+0x127>
/home/odeshmukh/work/project/SSE/main.cpp:303
    cout << "Testing:        ";
     e04:	be 00 00 00 00       	mov    esi,0x0
     e09:	bf 00 00 00 00       	mov    edi,0x0
     e0e:	e8 00 00 00 00       	call   e13 <_Z9PrintInfov+0x136>
/home/odeshmukh/work/project/SSE/main.cpp:305

    if (params.bCPUTiming)
     e13:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # e1a <_Z9PrintInfov+0x13d>
     e1a:	84 c0                	test   al,al
     e1c:	74 56                	je     e74 <_Z9PrintInfov+0x197>
/home/odeshmukh/work/project/SSE/main.cpp:306
        for (int run = 0; run < params.nOmpRuns; run++)
     e1e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
     e25:	eb 3d                	jmp    e64 <_Z9PrintInfov+0x187>
/home/odeshmukh/work/project/SSE/main.cpp:307
            cout << "CPU (" << params.ompThreads[run] << "-threads) , ";
     e27:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     e2a:	48 98                	cdqe   
     e2c:	48 89 c6             	mov    rsi,rax
     e2f:	bf 00 00 00 00       	mov    edi,0x0
     e34:	e8 00 00 00 00       	call   e39 <_Z9PrintInfov+0x15c>
     e39:	8b 18                	mov    ebx,DWORD PTR [rax]
     e3b:	be 00 00 00 00       	mov    esi,0x0
     e40:	bf 00 00 00 00       	mov    edi,0x0
     e45:	e8 00 00 00 00       	call   e4a <_Z9PrintInfov+0x16d>
     e4a:	89 de                	mov    esi,ebx
     e4c:	48 89 c7             	mov    rdi,rax
     e4f:	e8 00 00 00 00       	call   e54 <_Z9PrintInfov+0x177>
     e54:	be 00 00 00 00       	mov    esi,0x0
     e59:	48 89 c7             	mov    rdi,rax
     e5c:	e8 00 00 00 00       	call   e61 <_Z9PrintInfov+0x184>
/home/odeshmukh/work/project/SSE/main.cpp:306
    cout << "Iterations:     " << params.nIterations << endl;
    cout << "CPU Timing:     " << (params.bCPUTiming ? "True":"False") << endl;
    cout << "Testing:        ";

    if (params.bCPUTiming)
        for (int run = 0; run < params.nOmpRuns; run++)
     e61:	ff 45 ec             	inc    DWORD PTR [rbp-0x14]
     e64:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # e6a <_Z9PrintInfov+0x18d>
     e6a:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
     e6d:	0f 9f c0             	setg   al
     e70:	84 c0                	test   al,al
     e72:	75 b3                	jne    e27 <_Z9PrintInfov+0x14a>
/home/odeshmukh/work/project/SSE/main.cpp:309
            cout << "CPU (" << params.ompThreads[run] << "-threads) , ";

    cout << endl << endl;
     e74:	be 00 00 00 00       	mov    esi,0x0
     e79:	bf 00 00 00 00       	mov    edi,0x0
     e7e:	e8 00 00 00 00       	call   e83 <_Z9PrintInfov+0x1a6>
     e83:	be 00 00 00 00       	mov    esi,0x0
     e88:	48 89 c7             	mov    rdi,rax
     e8b:	e8 00 00 00 00       	call   e90 <_Z9PrintInfov+0x1b3>
/home/odeshmukh/work/project/SSE/main.cpp:310
}
     e90:	48 83 c4 10          	add    rsp,0x10
     e94:	5b                   	pop    rbx
     e95:	41 5c                	pop    r12
     e97:	c9                   	leave  
     e98:	c3                   	ret    

0000000000000e99 <_Z12PrintCPUTimei>:
_Z12PrintCPUTimei():
/home/odeshmukh/work/project/SSE/main.cpp:313

void PrintCPUTime(int run)
{
     e99:	55                   	push   rbp
     e9a:	48 89 e5             	mov    rbp,rsp
     e9d:	53                   	push   rbx
     e9e:	48 83 ec 18          	sub    rsp,0x18
     ea2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
/home/odeshmukh/work/project/SSE/main.cpp:314
    if (params.bCPUTiming)
     ea5:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # eac <_Z12PrintCPUTimei+0x13>
     eac:	84 c0                	test   al,al
     eae:	74 61                	je     f11 <_Z12PrintCPUTimei+0x78>
/home/odeshmukh/work/project/SSE/main.cpp:315
        cout << "CPU (" << params.ompThreads[run] << "-threads): " << timers.dCpuTime << endl;
     eb0:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # eb8 <_Z12PrintCPUTimei+0x1f>
     eb7:	00 
     eb8:	f2 0f 11 45 e0       	movsd  QWORD PTR [rbp-0x20],xmm0
     ebd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     ec0:	48 98                	cdqe   
     ec2:	48 89 c6             	mov    rsi,rax
     ec5:	bf 00 00 00 00       	mov    edi,0x0
     eca:	e8 00 00 00 00       	call   ecf <_Z12PrintCPUTimei+0x36>
     ecf:	8b 18                	mov    ebx,DWORD PTR [rax]
     ed1:	be 00 00 00 00       	mov    esi,0x0
     ed6:	bf 00 00 00 00       	mov    edi,0x0
     edb:	e8 00 00 00 00       	call   ee0 <_Z12PrintCPUTimei+0x47>
     ee0:	89 de                	mov    esi,ebx
     ee2:	48 89 c7             	mov    rdi,rax
     ee5:	e8 00 00 00 00       	call   eea <_Z12PrintCPUTimei+0x51>
     eea:	be 00 00 00 00       	mov    esi,0x0
     eef:	48 89 c7             	mov    rdi,rax
     ef2:	e8 00 00 00 00       	call   ef7 <_Z12PrintCPUTimei+0x5e>
     ef7:	f2 0f 10 45 e0       	movsd  xmm0,QWORD PTR [rbp-0x20]
     efc:	48 89 c7             	mov    rdi,rax
     eff:	e8 00 00 00 00       	call   f04 <_Z12PrintCPUTimei+0x6b>
     f04:	be 00 00 00 00       	mov    esi,0x0
     f09:	48 89 c7             	mov    rdi,rax
     f0c:	e8 00 00 00 00       	call   f11 <_Z12PrintCPUTimei+0x78>
/home/odeshmukh/work/project/SSE/main.cpp:316
}
     f11:	48 83 c4 18          	add    rsp,0x18
     f15:	5b                   	pop    rbx
     f16:	c9                   	leave  
     f17:	c3                   	ret    

0000000000000f18 <main>:
main():
/home/odeshmukh/work/project/SSE/main.cpp:323
/////////////////////////////////////////////////////////////////
// Main 
/////////////////////////////////////////////////////////////////

int main(int argc, char * argv[])
{
     f18:	55                   	push   rbp
     f19:	48 89 e5             	mov    rbp,rsp
     f1c:	41 54                	push   r12
     f1e:	53                   	push   rbx
     f1f:	48 83 ec 20          	sub    rsp,0x20
     f23:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
     f26:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
/home/odeshmukh/work/project/SSE/main.cpp:326
    try
    {
        InitParams(argc, argv);
     f2a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
     f2e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
     f31:	48 89 d6             	mov    rsi,rdx
     f34:	89 c7                	mov    edi,eax
     f36:	e8 00 00 00 00       	call   f3b <main+0x23>
/home/odeshmukh/work/project/SSE/main.cpp:327
        PrintInfo();
     f3b:	e8 00 00 00 00       	call   f40 <main+0x28>
/home/odeshmukh/work/project/SSE/main.cpp:329

        InitHostBuffers();
     f40:	e8 00 00 00 00       	call   f45 <main+0x2d>
/home/odeshmukh/work/project/SSE/main.cpp:331

        for (int run = 0; run < params.nOmpRuns; run++)
     f45:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
     f4c:	eb 26                	jmp    f74 <main+0x5c>
/home/odeshmukh/work/project/SSE/main.cpp:333
        {
            ClearBuffer(hostBuffers.pOutputCPU);
     f4e:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # f55 <main+0x3d>
     f55:	48 89 c7             	mov    rdi,rax
     f58:	e8 00 00 00 00       	call   f5d <main+0x45>
/home/odeshmukh/work/project/SSE/main.cpp:334
            RunCPU(run);
     f5d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     f60:	89 c7                	mov    edi,eax
     f62:	e8 00 00 00 00       	call   f67 <main+0x4f>
/home/odeshmukh/work/project/SSE/main.cpp:335
            PrintCPUTime(run);
     f67:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
     f6a:	89 c7                	mov    edi,eax
     f6c:	e8 00 00 00 00       	call   f71 <main+0x59>
/home/odeshmukh/work/project/SSE/main.cpp:331
        InitParams(argc, argv);
        PrintInfo();

        InitHostBuffers();

        for (int run = 0; run < params.nOmpRuns; run++)
     f71:	ff 45 ec             	inc    DWORD PTR [rbp-0x14]
     f74:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # f7a <main+0x62>
     f7a:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
     f7d:	0f 9f c0             	setg   al
     f80:	84 c0                	test   al,al
     f82:	75 ca                	jne    f4e <main+0x36>
/home/odeshmukh/work/project/SSE/main.cpp:338
            ClearBuffer(hostBuffers.pOutputCPU);
            RunCPU(run);
            PrintCPUTime(run);
        }

        ReleaseHostBuffers();
     f84:	e8 00 00 00 00       	call   f89 <main+0x71>
     f89:	e9 06 01 00 00       	jmp    1094 <main+0x17c>
     f8e:	48 89 c3             	mov    rbx,rax
     f91:	48 89 d0             	mov    rax,rdx
     f94:	48 83 f8 02          	cmp    rax,0x2
     f98:	0f 85 ad 00 00 00    	jne    104b <main+0x133>
/home/odeshmukh/work/project/SSE/main.cpp:340
    }
    catch(std::string msg)
     f9e:	48 89 df             	mov    rdi,rbx
     fa1:	e8 00 00 00 00       	call   fa6 <main+0x8e>
     fa6:	48 89 c2             	mov    rdx,rax
     fa9:	48 8d 45 e0          	lea    rax,[rbp-0x20]
     fad:	48 89 d6             	mov    rsi,rdx
     fb0:	48 89 c7             	mov    rdi,rax
     fb3:	e8 00 00 00 00       	call   fb8 <main+0xa0>
     fb8:	eb 11                	jmp    fcb <main+0xb3>
     fba:	48 89 c3             	mov    rbx,rax
     fbd:	48 89 d0             	mov    rax,rdx
     fc0:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
     fc4:	75 6b                	jne    1031 <main+0x119>
     fc6:	e8 00 00 00 00       	call   fcb <main+0xb3>
     fcb:	48 89 df             	mov    rdi,rbx
     fce:	e8 00 00 00 00       	call   fd3 <main+0xbb>
/home/odeshmukh/work/project/SSE/main.cpp:342
    {
        cerr << "Exception caught in main(): " << msg << endl;
     fd3:	be 00 00 00 00       	mov    esi,0x0
     fd8:	bf 00 00 00 00       	mov    edi,0x0
     fdd:	e8 00 00 00 00       	call   fe2 <main+0xca>
     fe2:	48 8d 55 e0          	lea    rdx,[rbp-0x20]
     fe6:	48 89 d6             	mov    rsi,rdx
     fe9:	48 89 c7             	mov    rdi,rax
     fec:	e8 00 00 00 00       	call   ff1 <main+0xd9>
     ff1:	be 00 00 00 00       	mov    esi,0x0
     ff6:	48 89 c7             	mov    rdi,rax
     ff9:	e8 00 00 00 00       	call   ffe <main+0xe6>
/home/odeshmukh/work/project/SSE/main.cpp:343
        ReleaseHostBuffers();
     ffe:	e8 00 00 00 00       	call   1003 <main+0xeb>
/home/odeshmukh/work/project/SSE/main.cpp:340
            PrintCPUTime(run);
        }

        ReleaseHostBuffers();
    }
    catch(std::string msg)
    1003:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    1007:	48 89 c7             	mov    rdi,rax
    100a:	e8 00 00 00 00       	call   100f <main+0xf7>
    100f:	eb 33                	jmp    1044 <main+0x12c>
    1011:	48 89 c3             	mov    rbx,rax
    1014:	48 89 d0             	mov    rax,rdx
    1017:	41 89 c4             	mov    r12d,eax
    101a:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    101e:	48 89 c7             	mov    rdi,rax
    1021:	e8 00 00 00 00       	call   1026 <main+0x10e>
    1026:	49 63 c4             	movsxd rax,r12d
    1029:	eb 06                	jmp    1031 <main+0x119>
    102b:	48 89 c3             	mov    rbx,rax
    102e:	48 89 d0             	mov    rax,rdx
    1031:	41 89 c4             	mov    r12d,eax
    1034:	e8 00 00 00 00       	call   1039 <main+0x121>
    1039:	49 63 c4             	movsxd rax,r12d
    103c:	48 89 df             	mov    rdi,rbx
    103f:	e8 00 00 00 00       	call   1044 <main+0x12c>
    1044:	e8 00 00 00 00       	call   1049 <main+0x131>
    1049:	eb 49                	jmp    1094 <main+0x17c>
/home/odeshmukh/work/project/SSE/main.cpp:345
    {
        cerr << "Exception caught in main(): " << msg << endl;
        ReleaseHostBuffers();
    }
    catch(...)
    104b:	48 89 df             	mov    rdi,rbx
    104e:	e8 00 00 00 00       	call   1053 <main+0x13b>
/home/odeshmukh/work/project/SSE/main.cpp:347
    {
        cerr << "Exception caught in main()" << endl;
    1053:	be 00 00 00 00       	mov    esi,0x0
    1058:	bf 00 00 00 00       	mov    edi,0x0
    105d:	e8 00 00 00 00       	call   1062 <main+0x14a>
    1062:	be 00 00 00 00       	mov    esi,0x0
    1067:	48 89 c7             	mov    rdi,rax
    106a:	e8 00 00 00 00       	call   106f <main+0x157>
/home/odeshmukh/work/project/SSE/main.cpp:348
        ReleaseHostBuffers();
    106f:	e8 00 00 00 00       	call   1074 <main+0x15c>
/home/odeshmukh/work/project/SSE/main.cpp:345
    catch(std::string msg)
    {
        cerr << "Exception caught in main(): " << msg << endl;
        ReleaseHostBuffers();
    }
    catch(...)
    1074:	e8 00 00 00 00       	call   1079 <main+0x161>
    1079:	eb 19                	jmp    1094 <main+0x17c>
    107b:	48 89 c3             	mov    rbx,rax
    107e:	48 89 d0             	mov    rax,rdx
    1081:	41 89 c4             	mov    r12d,eax
    1084:	e8 00 00 00 00       	call   1089 <main+0x171>
    1089:	49 63 c4             	movsxd rax,r12d
    108c:	48 89 df             	mov    rdi,rbx
    108f:	e8 00 00 00 00       	call   1094 <main+0x17c>
/home/odeshmukh/work/project/SSE/main.cpp:351
    {
        cerr << "Exception caught in main()" << endl;
        ReleaseHostBuffers();
    }

    return 0;
    1094:	b8 00 00 00 00       	mov    eax,0x0
/home/odeshmukh/work/project/SSE/main.cpp:352
}
    1099:	48 83 c4 20          	add    rsp,0x20
    109d:	5b                   	pop    rbx
    109e:	41 5c                	pop    r12
    10a0:	c9                   	leave  
    10a1:	c3                   	ret    

00000000000010a2 <_Z41__static_initialization_and_destruction_0ii>:
__static_initialization_and_destruction_0():
    10a2:	55                   	push   rbp
    10a3:	48 89 e5             	mov    rbp,rsp
    10a6:	48 83 ec 10          	sub    rsp,0x10
    10aa:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    10ad:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
    10b0:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
    10b4:	75 6c                	jne    1122 <_Z41__static_initialization_and_destruction_0ii+0x80>
    10b6:	81 7d f8 ff ff 00 00 	cmp    DWORD PTR [rbp-0x8],0xffff
    10bd:	75 63                	jne    1122 <_Z41__static_initialization_and_destruction_0ii+0x80>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/iostream:72
  extern wostream wclog;	///< Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
    10bf:	bf 00 00 00 00       	mov    edi,0x0
    10c4:	e8 00 00 00 00       	call   10c9 <_Z41__static_initialization_and_destruction_0ii+0x27>
    10c9:	b8 00 00 00 00       	mov    eax,0x0
    10ce:	ba 00 00 00 00       	mov    edx,0x0
    10d3:	be 00 00 00 00       	mov    esi,0x0
    10d8:	48 89 c7             	mov    rdi,rax
    10db:	e8 00 00 00 00       	call   10e0 <_Z41__static_initialization_and_destruction_0ii+0x3e>
/home/odeshmukh/work/project/SSE/Params.h:113
    std::vector<int> ompThreads;
    int nOmpRuns;       //ompThreads.size()

    bool bCPUTiming;            //Time CPU performance

} params;
    10e0:	bf 00 00 00 00       	mov    edi,0x0
    10e5:	e8 00 00 00 00       	call   10ea <_Z41__static_initialization_and_destruction_0ii+0x48>
    10ea:	b8 00 00 00 00       	mov    eax,0x0
    10ef:	ba 00 00 00 00       	mov    edx,0x0
    10f4:	be 00 00 00 00       	mov    esi,0x0
    10f9:	48 89 c7             	mov    rdi,rax
    10fc:	e8 00 00 00 00       	call   1101 <_Z41__static_initialization_and_destruction_0ii+0x5f>
/home/odeshmukh/work/project/SSE/main.cpp:139

struct timerStruct
{
    double dCpuTime;
    CPerfCounter counter;
} timers;
    1101:	bf 00 00 00 00       	mov    edi,0x0
    1106:	e8 00 00 00 00       	call   110b <_Z41__static_initialization_and_destruction_0ii+0x69>
    110b:	b8 00 00 00 00       	mov    eax,0x0
    1110:	ba 00 00 00 00       	mov    edx,0x0
    1115:	be 00 00 00 00       	mov    esi,0x0
    111a:	48 89 c7             	mov    rdi,rax
    111d:	e8 00 00 00 00       	call   1122 <_Z41__static_initialization_and_destruction_0ii+0x80>
/home/odeshmukh/work/project/SSE/main.cpp:352
        cerr << "Exception caught in main()" << endl;
        ReleaseHostBuffers();
    }

    return 0;
}
    1122:	c9                   	leave  
    1123:	c3                   	ret    

0000000000001124 <_GLOBAL__I_params>:
_GLOBAL__I_params():
    1124:	55                   	push   rbp
    1125:	48 89 e5             	mov    rbp,rsp
    1128:	be ff ff 00 00       	mov    esi,0xffff
    112d:	bf 01 00 00 00       	mov    edi,0x1
    1132:	e8 6b ff ff ff       	call   10a2 <_Z41__static_initialization_and_destruction_0ii>
    1137:	c9                   	leave  
    1138:	c3                   	ret    

Disassembly of section .text._ZnwmPv:

0000000000000000 <_ZnwmPv>:
_ZnwmPv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/new:101
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
  10:	c9                   	leave  
  11:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEE9push_backERKi:

0000000000000000 <_ZNSt6vectorIiSaIiEE9push_backERKi>:
_ZNSt6vectorIiSaIiEE9push_backERKi():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:733
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:735
      {
	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
  10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  14:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  20:	48 39 c2             	cmp    rdx,rax
  23:	74 31                	je     56 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x56>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:737
	  {
	    this->_M_impl.construct(this->_M_impl._M_finish, __x);
  25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  29:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  31:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  35:	48 89 ce             	mov    rsi,rcx
  38:	48 89 c7             	mov    rdi,rax
  3b:	e8 00 00 00 00       	call   40 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x40>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:738
	    ++this->_M_impl._M_finish;
  40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  44:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  48:	48 8d 50 04          	lea    rdx,[rax+0x4]
  4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  50:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  54:	eb 22                	jmp    78 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x78>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:741
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:742
      }
  78:	c9                   	leave  
  79:	c3                   	ret    

Disassembly of section .text._ZNKSt6vectorIiSaIiEE4sizeEv:

0000000000000000 <_ZNKSt6vectorIiSaIiEE4sizeEv>:
_ZNKSt6vectorIiSaIiEE4sizeEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:532
#endif

      // [23.2.4.2] capacity
      /**  Returns the number of elements in the %vector.  */
      size_type
      size() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:533
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
  27:	c9                   	leave  
  28:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEEixEm:

0000000000000000 <_ZNSt6vectorIiSaIiEEixEm>:
_ZNSt6vectorIiSaIiEEixEm():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:610
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:611
      { return *(this->_M_impl._M_start + __n); }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 8b 00             	mov    rax,QWORD PTR [rax]
  13:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  17:	48 c1 e2 02          	shl    rdx,0x2
  1b:	48 01 d0             	add    rax,rdx
  1e:	c9                   	leave  
  1f:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi>:
_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:104
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:105
      { ::new((void *)__p) _Tp(__val); }
  14:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  18:	48 89 c6             	mov    rsi,rax
  1b:	bf 04 00 00 00       	mov    edi,0x4
  20:	e8 00 00 00 00       	call   25 <_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi+0x25>
  25:	48 89 c2             	mov    rdx,rax
  28:	48 85 d2             	test   rdx,rdx
  2b:	74 08                	je     35 <_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi+0x35>
  2d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  31:	8b 12                	mov    edx,DWORD PTR [rdx]
  33:	89 10                	mov    DWORD PTR [rax],edx
  35:	c9                   	leave  
  36:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi:

0000000000000000 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi>:
_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:295
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:299
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:301
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:304
				  _GLIBCXX_MOVE(*(this->_M_impl._M_finish
						  - 1)));
	  ++this->_M_impl._M_finish;
  53:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  57:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  5b:	48 8d 50 04          	lea    rdx,[rax+0x4]
  5f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  63:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:306
#ifndef __GXX_EXPERIMENTAL_CXX0X__
	  _Tp __x_copy = __x;
  67:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  6b:	8b 00                	mov    eax,DWORD PTR [rax]
  6d:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:308
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:312
				  this->_M_impl._M_finish - 2,
				  this->_M_impl._M_finish - 1);
#ifndef __GXX_EXPERIMENTAL_CXX0X__
	  *__position = __x_copy;
  a5:	48 8d 45 b0          	lea    rax,[rbp-0x50]
  a9:	48 89 c7             	mov    rdi,rax
  ac:	e8 00 00 00 00       	call   b1 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0xb1>
  b1:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  b4:	89 10                	mov    DWORD PTR [rax],edx
  b6:	e9 1f 02 00 00       	jmp    2da <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2da>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:320
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:321
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:322
	  pointer __new_start(this->_M_allocate(__len));
  fc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 100:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
 104:	48 89 d6             	mov    rsi,rdx
 107:	48 89 c7             	mov    rdi,rax
 10a:	e8 00 00 00 00       	call   10f <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x10f>
 10f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:323
	  pointer __new_finish(__new_start);
 113:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 117:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:330
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:336
#ifdef __GXX_EXPERIMENTAL_CXX0X__
				      std::forward<_Args>(__args)...);
#else
	                              __x);
#endif
	      __new_finish = 0;
 13d:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
 144:	00 
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:338

	      __new_finish =
 145:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 149:	48 89 c7             	mov    rdi,rax
 14c:	e8 00 00 00 00       	call   151 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x151>
 151:	49 89 c4             	mov    r12,rax
 154:	48 8d 45 b0          	lea    rax,[rbp-0x50]
 158:	48 89 c7             	mov    rdi,rax
 15b:	e8 00 00 00 00       	call   160 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x160>
 160:	48 8b 18             	mov    rbx,QWORD PTR [rax]
 163:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 167:	48 8b 00             	mov    rax,QWORD PTR [rax]
 16a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
 16e:	4c 89 e1             	mov    rcx,r12
 171:	48 89 de             	mov    rsi,rbx
 174:	48 89 c7             	mov    rdi,rax
 177:	e8 00 00 00 00       	call   17c <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x17c>
 17c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:342
		std::__uninitialized_move_a(this->_M_impl._M_start,
					    __position.base(), __new_start,
					    _M_get_Tp_allocator());
	      ++__new_finish;
 180:	48 83 45 e8 04       	add    QWORD PTR [rbp-0x18],0x4
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:344

	      __new_finish =
 185:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 189:	48 89 c7             	mov    rdi,rax
 18c:	e8 00 00 00 00       	call   191 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x191>
 191:	49 89 c4             	mov    r12,rax
 194:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 198:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
 19c:	48 8d 45 b0          	lea    rax,[rbp-0x50]
 1a0:	48 89 c7             	mov    rdi,rax
 1a3:	e8 00 00 00 00       	call   1a8 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1a8>
 1a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
 1ab:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
 1af:	4c 89 e1             	mov    rcx,r12
 1b2:	48 89 de             	mov    rsi,rbx
 1b5:	48 89 c7             	mov    rdi,rax
 1b8:	e8 00 00 00 00       	call   1bd <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1bd>
 1bd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:359
	      else
		std::_Destroy(__new_start, __new_finish, _M_get_Tp_allocator());
	      _M_deallocate(__new_start, __len);
	      __throw_exception_again;
	    }
	  std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
 1c1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1c5:	48 89 c7             	mov    rdi,rax
 1c8:	e8 00 00 00 00       	call   1cd <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1cd>
 1cd:	48 89 c2             	mov    rdx,rax
 1d0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1d4:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
 1d8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1dc:	48 8b 00             	mov    rax,QWORD PTR [rax]
 1df:	48 89 ce             	mov    rsi,rcx
 1e2:	48 89 c7             	mov    rdi,rax
 1e5:	e8 00 00 00 00       	call   1ea <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x1ea>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:361
			_M_get_Tp_allocator());
	  _M_deallocate(this->_M_impl._M_start,
 1ea:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1ee:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
 1f2:	48 89 c2             	mov    rdx,rax
 1f5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 1f9:	48 8b 00             	mov    rax,QWORD PTR [rax]
 1fc:	48 89 d1             	mov    rcx,rdx
 1ff:	48 29 c1             	sub    rcx,rax
 202:	48 89 c8             	mov    rax,rcx
 205:	48 c1 f8 02          	sar    rax,0x2
 209:	48 89 c2             	mov    rdx,rax
 20c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 210:	48 8b 08             	mov    rcx,QWORD PTR [rax]
 213:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 217:	48 89 ce             	mov    rsi,rcx
 21a:	48 89 c7             	mov    rdi,rax
 21d:	e8 00 00 00 00       	call   222 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x222>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:364
			this->_M_impl._M_end_of_storage
			- this->_M_impl._M_start);
	  this->_M_impl._M_start = __new_start;
 222:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 226:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
 22a:	48 89 10             	mov    QWORD PTR [rax],rdx
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:365
	  this->_M_impl._M_finish = __new_finish;
 22d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 231:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
 235:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:366
	  this->_M_impl._M_end_of_storage = __new_start + __len;
 239:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
 23d:	48 c1 e0 02          	shl    rax,0x2
 241:	48 89 c2             	mov    rdx,rax
 244:	48 03 55 e0          	add    rdx,QWORD PTR [rbp-0x20]
 248:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 24c:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
 250:	e9 85 00 00 00       	jmp    2da <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2da>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:350
		std::__uninitialized_move_a(__position.base(),
					    this->_M_impl._M_finish,
					    __new_finish,
					    _M_get_Tp_allocator());
	    }
          __catch(...)
 255:	48 89 c7             	mov    rdi,rax
 258:	e8 00 00 00 00       	call   25d <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x25d>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:352
	    {
	      if (!__new_finish)
 25d:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
 262:	75 20                	jne    284 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x284>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:353
		this->_M_impl.destroy(__new_start + __elems_before);
 264:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 268:	48 c1 e0 02          	shl    rax,0x2
 26c:	48 89 c2             	mov    rdx,rax
 26f:	48 03 55 e0          	add    rdx,QWORD PTR [rbp-0x20]
 273:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 277:	48 89 d6             	mov    rsi,rdx
 27a:	48 89 c7             	mov    rdi,rax
 27d:	e8 00 00 00 00       	call   282 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x282>
 282:	eb 22                	jmp    2a6 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2a6>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:355
	      else
		std::_Destroy(__new_start, __new_finish, _M_get_Tp_allocator());
 284:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 288:	48 89 c7             	mov    rdi,rax
 28b:	e8 00 00 00 00       	call   290 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x290>
 290:	48 89 c2             	mov    rdx,rax
 293:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
 297:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 29b:	48 89 ce             	mov    rsi,rcx
 29e:	48 89 c7             	mov    rdi,rax
 2a1:	e8 00 00 00 00       	call   2a6 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2a6>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:356
	      _M_deallocate(__new_start, __len);
 2a6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
 2aa:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
 2ae:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
 2b2:	48 89 ce             	mov    rsi,rcx
 2b5:	48 89 c7             	mov    rdi,rax
 2b8:	e8 00 00 00 00       	call   2bd <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2bd>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:357
	      __throw_exception_again;
 2bd:	e8 00 00 00 00       	call   2c2 <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2c2>
 2c2:	89 d3                	mov    ebx,edx
 2c4:	49 89 c4             	mov    r12,rax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:350
		std::__uninitialized_move_a(__position.base(),
					    this->_M_impl._M_finish,
					    __new_finish,
					    _M_get_Tp_allocator());
	    }
          __catch(...)
 2c7:	e8 00 00 00 00       	call   2cc <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2cc>
 2cc:	4c 89 e0             	mov    rax,r12
 2cf:	48 63 d3             	movsxd rdx,ebx
 2d2:	48 89 c7             	mov    rdi,rax
 2d5:	e8 00 00 00 00       	call   2da <_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi+0x2da>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/vector.tcc:368
			- this->_M_impl._M_start);
	  this->_M_impl._M_start = __new_start;
	  this->_M_impl._M_finish = __new_finish;
	  this->_M_impl._M_end_of_storage = __new_start + __len;
	}
    }
 2da:	48 83 c4 50          	add    rsp,0x50
 2de:	5b                   	pop    rbx
 2df:	41 5c                	pop    r12
 2e1:	c9                   	leave  
 2e2:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEE3endEv:

0000000000000000 <_ZNSt6vectorIiSaIiEE3endEv>:
_ZNSt6vectorIiSaIiEE3endEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:443
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:444
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

Disassembly of section .text._ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv:

0000000000000000 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>:
_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_iterator.h:750
      __normal_iterator
      operator-(const difference_type& __n) const
      { return __normal_iterator(_M_current - __n); }

      const _Iterator&
      base() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_iterator.h:751
      { return _M_current; }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	c9                   	leave  
   d:	c3                   	ret    

Disassembly of section .text._ZSt13copy_backwardIPiS0_ET0_T_S2_S1_:

0000000000000000 <_ZSt13copy_backwardIPiS0_ET0_T_S2_S1_>:
_ZSt13copy_backwardIPiS0_ET0_T_S2_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:628
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:640
	    typename iterator_traits<_BI2>::value_type>)
      __glibcxx_requires_valid_range(__first, __last);

      return (std::__copy_move_backward_a2<__is_move_iterator<_BI1>::__value>
	      (std::__miter_base<_BI1>::__b(__first),
	       std::__miter_base<_BI1>::__b(__last), __result));
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:641
    }
  3f:	48 83 c4 28          	add    rsp,0x28
  43:	5b                   	pop    rbx
  44:	c9                   	leave  
  45:	c3                   	ret    

Disassembly of section .text._ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv:

0000000000000000 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv>:
_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_iterator.h:698
		      _Container>::__type>& __i)
        : _M_current(__i.base()) { }

      // Forward iterator requirements
      reference
      operator*() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_iterator.h:699
      { return *_M_current; }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	48 8b 00             	mov    rax,QWORD PTR [rax]
   f:	c9                   	leave  
  10:	c3                   	ret    

Disassembly of section .text._ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc:

0000000000000000 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc>:
_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:1134
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:1136
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:1137
	  __throw_length_error(__N(__s));
  44:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  48:	48 89 c7             	mov    rdi,rax
  4b:	e8 00 00 00 00       	call   50 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x50>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:1139

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
  85:	48 8d 04 03          	lea    rax,[rbx+rax*1]
  89:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:1140
	return (__len < size() || __len > max_size()) ? max_size() : __len;
  8d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  91:	48 89 c7             	mov    rdi,rax
  94:	e8 00 00 00 00       	call   99 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x99>
  99:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  9d:	77 12                	ja     b1 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xb1>
  9f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  a3:	48 89 c7             	mov    rdi,rax
  a6:	e8 00 00 00 00       	call   ab <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xab>
  ab:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  af:	73 0e                	jae    bf <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xbf>
  b1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  b5:	48 89 c7             	mov    rdi,rax
  b8:	e8 00 00 00 00       	call   bd <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xbd>
  bd:	eb 04                	jmp    c3 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xc3>
  bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:1141
      }
  c3:	48 83 c4 38          	add    rsp,0x38
  c7:	5b                   	pop    rbx
  c8:	c9                   	leave  
  c9:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEE5beginEv:

0000000000000000 <_ZNSt6vectorIiSaIiEE5beginEv>:
_ZNSt6vectorIiSaIiEE5beginEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:425
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:426
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_iterator.h:856
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_iterator.h:858
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
  44:	c9                   	leave  
  45:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm>:
_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:139

    public:
      _Vector_impl _M_impl;

      typename _Tp_alloc_type::pointer
      _M_allocate(size_t __n)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:140
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

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>:
_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:93
      
    public:
      typedef _Alloc allocator_type;

      _Tp_alloc_type&
      _M_get_Tp_allocator()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:94
      { return *static_cast<_Tp_alloc_type*>(&this->_M_impl); }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	c9                   	leave  
   d:	c3                   	ret    

Disassembly of section .text._ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_:

0000000000000000 <_ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_>:
_ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:262
    { return std::uninitialized_copy(__first, __last, __result); }

  template<typename _InputIterator, typename _ForwardIterator,
	   typename _Allocator>
    inline _ForwardIterator
    __uninitialized_move_a(_InputIterator __first, _InputIterator __last,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	53                   	push   rbx
   5:	48 83 ec 28          	sub    rsp,0x28
   9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
   d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  11:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  15:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:267
			   _ForwardIterator __result, _Allocator& __alloc)
    {
      return std::__uninitialized_copy_a(_GLIBCXX_MAKE_MOVE_ITERATOR(__first),
					 _GLIBCXX_MAKE_MOVE_ITERATOR(__last),
					 __result, __alloc);
  19:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  1d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  21:	48 8b 5d e0          	mov    rbx,QWORD PTR [rbp-0x20]
  25:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  29:	48 89 de             	mov    rsi,rbx
  2c:	48 89 c7             	mov    rdi,rax
  2f:	e8 00 00 00 00       	call   34 <_ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_+0x34>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:268
    }
  34:	48 83 c4 28          	add    rsp,0x28
  38:	5b                   	pop    rbx
  39:	c9                   	leave  
  3a:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE7destroyEPi:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE7destroyEPi>:
_ZN9__gnu_cxx13new_allocatorIiE7destroyEPi():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:115
        construct(pointer __p, _Args&&... __args)
	{ ::new((void *)__p) _Tp(std::forward<_Args>(__args)...); }
#endif

      void 
      destroy(pointer __p) { __p->~_Tp(); }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
   c:	c9                   	leave  
   d:	c3                   	ret    

Disassembly of section .text._ZSt8_DestroyIPiiEvT_S1_RSaIT0_E:

0000000000000000 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E>:
_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_construct.h:139
	__alloc.destroy(&*__first);
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_construct.h:142
	     allocator<_Tp>&)
    {
      _Destroy(__first, __last);
  14:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1c:	48 89 d6             	mov    rsi,rdx
  1f:	48 89 c7             	mov    rdi,rax
  22:	e8 00 00 00 00       	call   27 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E+0x27>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_construct.h:143
    }
  27:	c9                   	leave  
  28:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>:
_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim():
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:145
      {
	if (__p)
  14:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  19:	74 17                	je     32 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim+0x32>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:146
	  _M_impl.deallocate(__p, __n);
  1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  23:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  27:	48 89 ce             	mov    rsi,rcx
  2a:	48 89 c7             	mov    rdi,rax
  2d:	e8 00 00 00 00       	call   32 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim+0x32>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:147
      }
  32:	c9                   	leave  
  33:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_:

0000000000000000 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_>:
__normal_iterator():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_iterator.h:686
      typedef typename iterator_traits<_Iterator>::pointer   pointer;

      __normal_iterator() : _M_current(_Iterator()) { }

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
  1a:	c9                   	leave  
  1b:	c3                   	ret    

Disassembly of section .text._ZNSt12__miter_baseIPiLb0EE3__bES0_:

0000000000000000 <_ZNSt12__miter_baseIPiLb0EE3__bES0_>:
_ZNSt12__miter_baseIPiLb0EE3__bES0_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:287
  template<typename _Iterator,
	   bool _IsMove = __is_move_iterator<_Iterator>::__value>
    struct __miter_base
    {
      static _Iterator
      __b(_Iterator __it)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:288
      { return __it; }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	c9                   	leave  
   d:	c3                   	ret    

Disassembly of section .text._ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:600
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:605
    {
      return _BI2(std::__copy_move_backward_a<_IsMove>
		  (std::__niter_base<_BI1>::__b(__first),
		   std::__niter_base<_BI1>::__b(__last),
		   std::__niter_base<_BI2>::__b(__result)));
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:606
    }
  4f:	48 83 c4 20          	add    rsp,0x20
  53:	5b                   	pop    rbx
  54:	41 5c                	pop    r12
  56:	c9                   	leave  
  57:	c3                   	ret    

Disassembly of section .text._ZNKSt6vectorIiSaIiEE8max_sizeEv:

0000000000000000 <_ZNKSt6vectorIiSaIiEE8max_sizeEv>:
_ZNKSt6vectorIiSaIiEE8max_sizeEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:537
      size() const
      { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }

      /**  Returns the size() of the largest possible %vector.  */
      size_type
      max_size() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:538
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:209
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:214
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:215
	return __b;
  1f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23:	eb 04                	jmp    29 <_ZSt3maxImERKT_S2_S2_+0x29>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:216
      return __a;
  25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:217
    }
  29:	c9                   	leave  
  2a:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv>:
_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:84
      address(const_reference __x) const { return &__x; }

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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:86
      { 
	if (__builtin_expect(__n > this->max_size(), false))
  14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  18:	48 89 c7             	mov    rdi,rax
  1b:	e8 00 00 00 00       	call   20 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x20>
  20:	48 3b 45 f0          	cmp    rax,QWORD PTR [rbp-0x10]
  24:	0f 92 c0             	setb   al
  27:	0f b6 c0             	movzx  eax,al
  2a:	48 85 c0             	test   rax,rax
  2d:	0f 95 c0             	setne  al
  30:	84 c0                	test   al,al
  32:	74 05                	je     39 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x39>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:87
	  std::__throw_bad_alloc();
  34:	e8 00 00 00 00       	call   39 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x39>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:89

	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
  39:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  3d:	48 c1 e0 02          	shl    rax,0x2
  41:	48 89 c7             	mov    rdi,rax
  44:	e8 00 00 00 00       	call   49 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x49>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:90
      }
  49:	c9                   	leave  
  4a:	c3                   	ret    

Disassembly of section .text._ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E:

0000000000000000 <_ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E>:
_ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:255
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:257
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

Disassembly of section .text._ZSt8_DestroyIPiEvT_S1_:

0000000000000000 <_ZSt8_DestroyIPiEvT_S1_>:
_ZSt8_DestroyIPiEvT_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_construct.h:112
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_construct.h:116
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;
      std::_Destroy_aux<__has_trivial_destructor(_Value_type)>::
  10:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  18:	48 89 d6             	mov    rsi,rdx
  1b:	48 89 c7             	mov    rdi,rax
  1e:	e8 00 00 00 00       	call   23 <_ZSt8_DestroyIPiEvT_S1_+0x23>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_construct.h:118
	__destroy(__first, __last);
    }
  23:	c9                   	leave  
  24:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim>:
_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:94

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:95
      { ::operator delete(__p); }
  14:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  18:	48 89 c7             	mov    rdi,rax
  1b:	e8 00 00 00 00       	call   20 <_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim+0x20>
  20:	c9                   	leave  
  21:	c3                   	ret    

Disassembly of section .text._ZNSt12__niter_baseIPiLb0EE3__bES0_:

0000000000000000 <_ZNSt12__niter_baseIPiLb0EE3__bES0_>:
_ZNSt12__niter_baseIPiLb0EE3__bES0_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:269
  template<typename _Iterator,
	   bool _IsNormal = __is_normal_iterator<_Iterator>::__value>
    struct __niter_base
    {
      static _Iterator
      __b(_Iterator __it)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:270
      { return __it; }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	c9                   	leave  
   d:	c3                   	ret    

Disassembly of section .text._ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:582
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:590
      typedef typename iterator_traits<_BI2>::value_type _ValueType2;
      typedef typename iterator_traits<_BI1>::iterator_category _Category;
      const bool __simple = (__is_pod(_ValueType1)
	                     && __is_pointer<_BI1>::__value
	                     && __is_pointer<_BI2>::__value
			     && __are_same<_ValueType1, _ValueType2>::__value);
  14:	c6 45 ff 01          	mov    BYTE PTR [rbp-0x1],0x1
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:595

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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:596
    }
  2f:	c9                   	leave  
  30:	c3                   	ret    

Disassembly of section .text._ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv:

0000000000000000 <_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>:
_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:97
      _Tp_alloc_type&
      _M_get_Tp_allocator()
      { return *static_cast<_Tp_alloc_type*>(&this->_M_impl); }

      const _Tp_alloc_type&
      _M_get_Tp_allocator() const
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:98
      { return *static_cast<const _Tp_alloc_type*>(&this->_M_impl); }
   8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   c:	c9                   	leave  
   d:	c3                   	ret    

Disassembly of section .text._ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv:

0000000000000000 <_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv>:
_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv():

      size_type
      max_size() const throw() 
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:99
      { return size_t(-1) / sizeof(_Tp); }
   8:	48 b8 ff ff ff ff ff 	mov    rax,0x3fffffffffffffff
   f:	ff ff 3f 
  12:	c9                   	leave  
  13:	c3                   	ret    

Disassembly of section .text._ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_:

0000000000000000 <_ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_>:
_ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:107
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:117
      typedef typename iterator_traits<_ForwardIterator>::value_type
	_ValueType2;

      return std::__uninitialized_copy<(__is_pod(_ValueType1)
					&& __is_pod(_ValueType2))>::
	uninitialized_copy(__first, __last, __result);
  14:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  18:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  20:	48 89 ce             	mov    rsi,rcx
  23:	48 89 c7             	mov    rdi,rax
  26:	e8 00 00 00 00       	call   2b <_ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_+0x2b>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:118
    }
  2b:	c9                   	leave  
  2c:	c3                   	ret    

Disassembly of section .text._ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_:

0000000000000000 <_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_>:
_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_construct.h:102
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
   c:	c9                   	leave  
   d:	c3                   	ret    

Disassembly of section .text._ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_:

0000000000000000 <_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_>:
_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:572
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:574
        {
	  const ptrdiff_t _Num = __last - __first;
  14:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1c:	48 89 d1             	mov    rcx,rdx
  1f:	48 29 c1             	sub    rcx,rax
  22:	48 89 c8             	mov    rax,rcx
  25:	48 c1 f8 02          	sar    rax,0x2
  29:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:575
	  __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
  2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  31:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  38:	00 
  39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  3d:	48 c1 e0 02          	shl    rax,0x2
  41:	48 f7 d8             	neg    rax
  44:	48 03 45 d8          	add    rax,QWORD PTR [rbp-0x28]
  48:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  4c:	48 89 ce             	mov    rsi,rcx
  4f:	48 89 c7             	mov    rdi,rax
  52:	e8 00 00 00 00       	call   57 <_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_+0x57>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:576
	  return __result - _Num;
  57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  5b:	48 c1 e0 02          	shl    rax,0x2
  5f:	48 f7 d8             	neg    rax
  62:	48 03 45 d8          	add    rax,QWORD PTR [rbp-0x28]
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:577
	}
  66:	c9                   	leave  
  67:	c3                   	ret    

Disassembly of section .text._ZNSt20__uninitialized_copyILb1EE18uninitialized_copyIPiS2_EET0_T_S4_S3_:

0000000000000000 <_ZNSt20__uninitialized_copyILb1EE18uninitialized_copyIPiS2_EET0_T_S4_S3_>:
_ZNSt20__uninitialized_copyILb1EE18uninitialized_copyIPiS2_EET0_T_S4_S3_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:91
  template<>
    struct __uninitialized_copy<true>
    {
      template<typename _InputIterator, typename _ForwardIterator>
        static _ForwardIterator
        uninitialized_copy(_InputIterator __first, _InputIterator __last,
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_uninitialized.h:93
			   _ForwardIterator __result)
        { return std::copy(__first, __last, __result); }
  14:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  18:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  20:	48 89 ce             	mov    rsi,rcx
  23:	48 89 c7             	mov    rdi,rax
  26:	e8 00 00 00 00       	call   2b <_ZNSt20__uninitialized_copyILb1EE18uninitialized_copyIPiS2_EET0_T_S4_S3_+0x2b>
  2b:	c9                   	leave  
  2c:	c3                   	ret    

Disassembly of section .text._ZSt4copyIPiS0_ET0_T_S2_S1_:

0000000000000000 <_ZSt4copyIPiS0_ET0_T_S2_S1_>:
_ZSt4copyIPiS0_ET0_T_S2_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:458
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:468
	    typename iterator_traits<_II>::value_type>)
      __glibcxx_requires_valid_range(__first, __last);

      return (std::__copy_move_a2<__is_move_iterator<_II>::__value>
	      (std::__miter_base<_II>::__b(__first),
	       std::__miter_base<_II>::__b(__last), __result));
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:469
    }
  3f:	48 83 c4 28          	add    rsp,0x28
  43:	5b                   	pop    rbx
  44:	c9                   	leave  
  45:	c3                   	ret    

Disassembly of section .text._ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:431
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:436
    {
      return _OI(std::__copy_move_a<_IsMove>
		 (std::__niter_base<_II>::__b(__first),
		  std::__niter_base<_II>::__b(__last),
		  std::__niter_base<_OI>::__b(__result)));
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:437
    }
  4f:	48 83 c4 20          	add    rsp,0x20
  53:	5b                   	pop    rbx
  54:	41 5c                	pop    r12
  56:	c9                   	leave  
  57:	c3                   	ret    

Disassembly of section .text._ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_:

0000000000000000 <_ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_>:
_ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:386
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:394
      typedef typename iterator_traits<_OI>::value_type _ValueTypeO;
      typedef typename iterator_traits<_II>::iterator_category _Category;
      const bool __simple = (__is_pod(_ValueTypeI)
	                     && __is_pointer<_II>::__value
	                     && __is_pointer<_OI>::__value
			     && __are_same<_ValueTypeI, _ValueTypeO>::__value);
  14:	c6 45 ff 01          	mov    BYTE PTR [rbp-0x1],0x1
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:397

      return std::__copy_move<_IsMove, __simple,
	                      _Category>::__copy_m(__first, __last, __result);
  18:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  1c:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  24:	48 89 ce             	mov    rsi,rcx
  27:	48 89 c7             	mov    rdi,rax
  2a:	e8 00 00 00 00       	call   2f <_ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_+0x2f>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:398
    }
  2f:	c9                   	leave  
  30:	c3                   	ret    

Disassembly of section .text._ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_:

0000000000000000 <_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_>:
_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:376
  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 20          	sub    rsp,0x20
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  10:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:378
        {
	  __builtin_memmove(__result, __first,
  14:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1c:	48 89 d1             	mov    rcx,rdx
  1f:	48 29 c1             	sub    rcx,rax
  22:	48 89 c8             	mov    rax,rcx
  25:	48 c1 f8 02          	sar    rax,0x2
  29:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  30:	00 
  31:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  35:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  39:	48 89 ce             	mov    rsi,rcx
  3c:	48 89 c7             	mov    rdi,rax
  3f:	e8 00 00 00 00       	call   44 <_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_+0x44>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:380
			    sizeof(_Tp) * (__last - __first));
	  return __result + (__last - __first);
  44:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4c:	48 89 d1             	mov    rcx,rdx
  4f:	48 29 c1             	sub    rcx,rax
  52:	48 89 c8             	mov    rax,rcx
  55:	48 c1 f8 02          	sar    rax,0x2
  59:	48 c1 e0 02          	shl    rax,0x2
  5d:	48 03 45 e8          	add    rax,QWORD PTR [rbp-0x18]
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_algobase.h:381
	}
  61:	c9                   	leave  
  62:	c3                   	ret    

Disassembly of section .text._ZN11paramStructD2Ev:

0000000000000000 <_ZN11paramStructD1Ev>:
~paramStruct():
/home/odeshmukh/work/project/SSE/Params.h:99
#define PARAMS_H_

#define DEFAULT_NUM_THREADS 4

struct paramStruct
{
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
/home/odeshmukh/work/project/SSE/main.cpp:136
    float * pFilter;
    float * pOutputCPU;
} hostBuffers;

struct timerStruct
{
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

Disassembly of section .text._ZN11paramStructC2Ev:

0000000000000000 <_ZN11paramStructC1Ev>:
paramStruct():
/home/odeshmukh/work/project/SSE/Params.h:99
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
/home/odeshmukh/work/project/SSE/main.cpp:136
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

Disassembly of section .text._ZNSt6vectorIiSaIiEED2Ev:

0000000000000000 <_ZNSt6vectorIiSaIiEED1Ev>:
~vector():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:312
       *  The dtor only erases the elements, and note that if the
       *  elements themselves are pointers, the pointed-to memory is
       *  not touched in any way.  Managing the pointer is the user's
       *  responsibility.
       */
      ~vector()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	41 54                	push   r12
   6:	53                   	push   rbx
   7:	48 83 ec 10          	sub    rsp,0x10
   b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:313
      { std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
   f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13:	48 89 c7             	mov    rdi,rax
  16:	e8 00 00 00 00       	call   1b <_ZNSt6vectorIiSaIiEED1Ev+0x1b>
  1b:	48 89 c2             	mov    rdx,rax
  1e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  22:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  26:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  2a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2d:	48 89 ce             	mov    rsi,rcx
  30:	48 89 c7             	mov    rdi,rax
  33:	e8 00 00 00 00       	call   38 <_ZNSt6vectorIiSaIiEED1Ev+0x38>
  38:	eb 1f                	jmp    59 <_ZNSt6vectorIiSaIiEED1Ev+0x59>
  3a:	89 d3                	mov    ebx,edx
  3c:	49 89 c4             	mov    r12,rax
  3f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  43:	48 89 c7             	mov    rdi,rax
  46:	e8 00 00 00 00       	call   4b <_ZNSt6vectorIiSaIiEED1Ev+0x4b>
  4b:	4c 89 e0             	mov    rax,r12
  4e:	48 63 d3             	movsxd rdx,ebx
  51:	48 89 c7             	mov    rdi,rax
  54:	e8 00 00 00 00       	call   59 <_ZNSt6vectorIiSaIiEED1Ev+0x59>
  59:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  5d:	48 89 c7             	mov    rdi,rax
  60:	e8 00 00 00 00       	call   65 <_ZNSt6vectorIiSaIiEED1Ev+0x65>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:314
		      _M_get_Tp_allocator()); }
  65:	48 83 c4 10          	add    rsp,0x10
  69:	5b                   	pop    rbx
  6a:	41 5c                	pop    r12
  6c:	c9                   	leave  
  6d:	c3                   	ret    

Disassembly of section .text._ZNSt6vectorIiSaIiEEC2Ev:

0000000000000000 <_ZNSt6vectorIiSaIiEEC1Ev>:
vector():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:207
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:208
      : _Base() { }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSt6vectorIiSaIiEEC1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev>:
~_Vector_impl():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:75
    {
      typedef typename _Alloc::template rebind<_Tp>::other _Tp_alloc_type;

      struct _Vector_impl 
      : public _Tp_alloc_type
      {
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEED2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEED1Ev>:
~_Vector_base():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:131
	__x._M_impl._M_finish = 0;
	__x._M_impl._M_end_of_storage = 0;
      }
#endif

      ~_Vector_base()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:132
      { _M_deallocate(this->_M_impl._M_start, this->_M_impl._M_end_of_storage
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  14:	48 89 c2             	mov    rdx,rax
  17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1e:	48 89 d1             	mov    rcx,rdx
  21:	48 29 c1             	sub    rcx,rax
  24:	48 89 c8             	mov    rax,rcx
  27:	48 c1 f8 02          	sar    rax,0x2
  2b:	48 89 c2             	mov    rdx,rax
  2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  32:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  39:	48 89 ce             	mov    rsi,rcx
  3c:	48 89 c7             	mov    rdi,rax
  3f:	e8 00 00 00 00       	call   44 <_ZNSt12_Vector_baseIiSaIiEED1Ev+0x44>
  44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  48:	48 89 c7             	mov    rdi,rax
  4b:	e8 00 00 00 00       	call   50 <_ZNSt12_Vector_baseIiSaIiEED1Ev+0x50>
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:133
		      - this->_M_impl._M_start); }
  50:	c9                   	leave  
  51:	c3                   	ret    

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEEC2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEEC1Ev>:
_Vector_base():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:104

      allocator_type
      get_allocator() const
      { return allocator_type(_M_get_Tp_allocator()); }

      _Vector_base()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:105
      : _M_impl() { }
   c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  10:	48 89 c7             	mov    rdi,rax
  13:	e8 00 00 00 00       	call   18 <_ZNSt12_Vector_baseIiSaIiEEC1Ev+0x18>
  18:	c9                   	leave  
  19:	c3                   	ret    

Disassembly of section .text._ZNSaIiED2Ev:

0000000000000000 <_ZNSaIiED1Ev>:
~allocator():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/allocator.h:109
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

Disassembly of section .text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev:

0000000000000000 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev>:
_Vector_impl():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:80
      {
	typename _Tp_alloc_type::pointer _M_start;
	typename _Tp_alloc_type::pointer _M_finish;
	typename _Tp_alloc_type::pointer _M_end_of_storage;

	_Vector_impl()
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 10          	sub    rsp,0x10
   8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:81
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
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/stl_vector.h:82
	{ }
  3b:	c9                   	leave  
  3c:	c3                   	ret    

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiED2Ev:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiED1Ev>:
~new_allocator():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:73
      new_allocator(const new_allocator&) throw() { }

      template<typename _Tp1>
        new_allocator(const new_allocator<_Tp1>&) throw() { }

      ~new_allocator() throw() { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	c9                   	leave  
   9:	c3                   	ret    

Disassembly of section .text._ZNSaIiEC2Ev:

0000000000000000 <_ZNSaIiEC1Ev>:
allocator():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/bits/allocator.h:101

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

Disassembly of section .text._ZN9__gnu_cxx13new_allocatorIiEC2Ev:

0000000000000000 <_ZN9__gnu_cxx13new_allocatorIiEC1Ev>:
new_allocator():
/usr/lib/gcc/x86_64-redhat-linux/4.4.6/../../../../include/c++/4.4.6/ext/new_allocator.h:66

      template<typename _Tp1>
        struct rebind
        { typedef new_allocator<_Tp1> other; };

      new_allocator() throw() { }
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
   8:	c9                   	leave  
   9:	c3                   	ret    
