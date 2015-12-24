set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.8808, <2> 30.1318, <3> 34.4144, <4> 26.2978, <5> 17.5343, <6> 29.417, <7> 22.7129, <8> 22.6246, <9> 20.4162, <10> 26.2853;
param workload[JOB] := <1> 5.0873, <2> 5.4892, <3> 5.8664, <4> 5.1281, <5> 4.1874, <6> 5.4237, <7> 4.7658, <8> 4.7565, <9> 4.5184, <10> 5.1269;
param capacity[MACHINE] := <1> 16.7832, <2> 16.7832, <3> 16.7832;

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
