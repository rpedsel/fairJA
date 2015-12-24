set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.474, <2> 20.7946, <3> 34.4629, <4> 29.1881, <5> 26.4154, <6> 27.711, <7> 23.7245, <8> 30.2519, <9> 18.9996, <10> 23.1822;
param workload[JOB] := <1> 5.429, <2> 4.5601, <3> 5.8705, <4> 5.4026, <5> 5.1396, <6> 5.2641, <7> 4.8708, <8> 5.5002, <9> 4.3589, <10> 4.8148;
param capacity[MACHINE] := <1> 51.2106, <2> 51.2106, <3> 51.2106;

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
