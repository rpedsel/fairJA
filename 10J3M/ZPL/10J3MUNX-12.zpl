set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.8582, <2> 27.798, <3> 42.3709, <4> 12.8277, <5> 49.2613, <6> 5.2679, <7> 44.8912, <8> 36.9924, <9> 16.9057, <10> 21.5946;
param workload[JOB] := <1> 7.061, <2> 5.2724, <3> 6.5093, <4> 3.5816, <5> 7.0186, <6> 2.2952, <7> 6.7001, <8> 6.0821, <9> 4.1117, <10> 4.647;
param capacity[MACHINE] := <1> 53.279, <2> 53.279, <3> 53.279;

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
