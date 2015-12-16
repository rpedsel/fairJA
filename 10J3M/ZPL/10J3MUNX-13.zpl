set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.0143, <2> 32.8293, <3> 46.6951, <4> 19.3056, <5> 33.8405, <6> 44.6472, <7> 21.3196, <8> 3.2424, <9> 8.5894, <10> 3.7223;
param workload[JOB] := <1> 6.2461, <2> 5.7297, <3> 6.8334, <4> 4.3938, <5> 5.8173, <6> 6.6819, <7> 4.6173, <8> 1.8007, <9> 2.9308, <10> 1.9293;
param capacity[MACHINE] := <1> 46.9803, <2> 46.9803, <3> 46.9803;

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
