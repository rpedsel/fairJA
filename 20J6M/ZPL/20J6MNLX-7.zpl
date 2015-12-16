set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.014, <2> 23.7778, <3> 23.2275, <4> 27.4074, <5> 25.0616, <6> 24.5707, <7> 31.6314, <8> 19.0509, <9> 24.5538, <10> 26.6827, <11> 32.0558, <12> 19.9941, <13> 34.1544, <14> 23.3912, <15> 23.8424, <16> 32.1281, <17> 22.9608, <18> 24.0182, <19> 28.8351, <20> 22.0897;
param workload[JOB] := <1> 5.1004, <2> 4.8762, <3> 4.8195, <4> 5.2352, <5> 5.0062, <6> 4.9569, <7> 5.6242, <8> 4.3647, <9> 4.9552, <10> 5.1655, <11> 5.6618, <12> 4.4715, <13> 5.8442, <14> 4.8364, <15> 4.8829, <16> 5.6682, <17> 4.7917, <18> 4.9008, <19> 5.3698, <20> 4.7;
param capacity[MACHINE] := <1> 16.8719, <2> 16.8719, <3> 16.8719, <4> 16.8719, <5> 16.8719, <6> 16.8719;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
