set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.5778, <2> 31.77, <3> 32.1561, <4> 49.5285, <5> 6.2267, <6> 30.9874, <7> 15.3669, <8> 8.1331, <9> 6.5134, <10> 27.4241;
param workload[JOB] := <1> 26.9551, <2> 38.9316, <3> 21.1179, <4> 38.9668, <5> 20.0217, <6> 21.7555, <7> 15.5025, <8> 35.3976, <9> 3.2458, <10> 35.2836;
param capacity[MACHINE] := <1> 257.1781, <2> 257.1781, <3> 257.1781;

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
