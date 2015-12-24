set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1067, <2> 30.872, <3> 26.7118, <4> 24.7983, <5> 25.3115, <6> 15.775, <7> 32.2994, <8> 26.026, <9> 21.3493, <10> 25.9084, <11> 26.7313, <12> 23.5369, <13> 22.3003, <14> 17.4039, <15> 20.3185, <16> 23.9245, <17> 32.2312, <18> 15.0214, <19> 24.0047, <20> 21.4253;
param workload[JOB] := <1> 5.3951, <2> 5.5563, <3> 5.1683, <4> 4.9798, <5> 5.0311, <6> 3.9718, <7> 5.6833, <8> 5.1016, <9> 4.6205, <10> 5.09, <11> 5.1702, <12> 4.8515, <13> 4.7223, <14> 4.1718, <15> 4.5076, <16> 4.8913, <17> 5.6773, <18> 3.8757, <19> 4.8995, <20> 4.6287;
param capacity[MACHINE] := <1> 97.9937, <2> 97.9937, <3> 97.9937, <4> 97.9937, <5> 97.9937, <6> 97.9937, <7> 97.9937;

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
