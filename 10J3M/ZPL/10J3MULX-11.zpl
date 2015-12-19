set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2043, <2> 26.3309, <3> 31.5527, <4> 22.1002, <5> 34.6762, <6> 49.5695, <7> 49.5084, <8> 21.3271, <9> 19.7681, <10> 12.7307;
param workload[JOB] := <1> 4.6048, <2> 5.1314, <3> 5.6172, <4> 4.7011, <5> 5.8887, <6> 7.0406, <7> 7.0362, <8> 4.6181, <9> 4.4461, <10> 3.568;
param capacity[MACHINE] := <1> 17.5507, <2> 17.5507, <3> 17.5507;

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
