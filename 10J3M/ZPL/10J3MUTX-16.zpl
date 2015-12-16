set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.4078, <2> 25.6276, <3> 14.1512, <4> 11.3505, <5> 15.3186, <6> 6.8588, <7> 19.8323, <8> 23.1676, <9> 25.9112, <10> 16.2824;
param workload[JOB] := <1> 4.1723, <2> 5.0624, <3> 3.7618, <4> 3.3691, <5> 3.9139, <6> 2.6189, <7> 4.4533, <8> 4.8133, <9> 5.0903, <10> 4.0351;
param capacity[MACHINE] := <1> 10.3226, <2> 10.3226, <3> 10.3226;

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
