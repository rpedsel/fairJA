set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.6885, <2> 34.1305, <3> 17.3152, <4> 34.5569, <5> 49.1429, <6> 28.9345, <7> 42.2784, <8> 22.1825, <9> 19.8327, <10> 36.9778;
param workload[JOB] := <1> 41.6885, <2> 34.1305, <3> 17.3152, <4> 34.5569, <5> 49.1429, <6> 28.9345, <7> 42.2784, <8> 22.1825, <9> 19.8327, <10> 36.9778;
param capacity[MACHINE] := <1> 81.76, <2> 81.76, <3> 81.76;

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
