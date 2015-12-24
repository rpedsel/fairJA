set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.8956, <2> 16.6969, <3> 17.8433, <4> 5.8561, <5> 34.1988, <6> 7.5239, <7> 12.2741, <8> 29.8517, <9> 45.1311, <10> 7.4113, <11> 32.1496, <12> 42.549, <13> 4.9355, <14> 17.2289, <15> 16.3269, <16> 27.6245, <17> 19.9145, <18> 18.4826, <19> 42.032, <20> 30.2908;
param workload[JOB] := <1> 670.5821, <2> 278.7865, <3> 318.3834, <4> 34.2939, <5> 1169.5579, <6> 56.6091, <7> 150.6535, <8> 891.124, <9> 2036.8162, <10> 54.9274, <11> 1033.5968, <12> 1810.4174, <13> 24.3592, <14> 296.835, <15> 266.5677, <16> 763.113, <17> 396.5873, <18> 341.6065, <19> 1766.689, <20> 917.5326;
param capacity[MACHINE] := <1> 2128.4272, <2> 2128.4272, <3> 2128.4272, <4> 2128.4272, <5> 2128.4272, <6> 2128.4272, <7> 2128.4272;

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
