set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.8994, <2> 32.1156, <3> 40.5568, <4> 2.4872, <5> 34.1852, <6> 18.1187, <7> 31.7493, <8> 24.7915, <9> 45.4139, <10> 2.872;
param workload[JOB] := <1> 1.7028, <2> 5.6671, <3> 6.3684, <4> 1.5771, <5> 5.8468, <6> 4.2566, <7> 5.6347, <8> 4.9791, <9> 6.739, <10> 1.6947;
param capacity[MACHINE] := <1> 11.1166, <2> 11.1166, <3> 11.1166;

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
