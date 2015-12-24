set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.7807, <2> 23.2731, <3> 23.3319, <4> 23.2432, <5> 25.0484, <6> 23.4065, <7> 18.8143, <8> 34.3007, <9> 26.8153, <10> 25.6492;
param workload[JOB] := <1> 3.8446, <2> 4.8242, <3> 4.8303, <4> 4.8211, <5> 5.0048, <6> 4.838, <7> 4.3375, <8> 5.8567, <9> 5.1783, <10> 5.0645;
param capacity[MACHINE] := <1> 48.6, <2> 48.6, <3> 48.6;

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
