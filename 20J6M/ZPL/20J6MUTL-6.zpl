set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.518, <2> 2.6311, <3> 23.7118, <4> 37.2307, <5> 12.536, <6> 4.3962, <7> 24.09, <8> 0.9901, <9> 46.05, <10> 12.7152, <11> 3.9519, <12> 29.0746, <13> 19.7535, <14> 47.2513, <15> 26.3689, <16> 49.4468, <17> 12.7376, <18> 32.836, <19> 44.9508, <20> 14.2215;
param workload[JOB] := <1> 35.518, <2> 2.6311, <3> 23.7118, <4> 37.2307, <5> 12.536, <6> 4.3962, <7> 24.09, <8> 0.9901, <9> 46.05, <10> 12.7152, <11> 3.9519, <12> 29.0746, <13> 19.7535, <14> 47.2513, <15> 26.3689, <16> 49.4468, <17> 12.7376, <18> 32.836, <19> 44.9508, <20> 14.2215;
param capacity[MACHINE] := <1> 60.0577, <2> 60.0577, <3> 60.0577, <4> 60.0577, <5> 60.0577, <6> 60.0577;

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
