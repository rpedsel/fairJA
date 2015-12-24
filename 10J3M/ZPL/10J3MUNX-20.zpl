set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.088, <2> 43.4138, <3> 46.6014, <4> 28.6206, <5> 15.0816, <6> 25.7983, <7> 41.7883, <8> 48.1391, <9> 17.2766, <10> 21.9112;
param workload[JOB] := <1> 4.5922, <2> 6.5889, <3> 6.8265, <4> 5.3498, <5> 3.8835, <6> 5.0792, <7> 6.4644, <8> 6.9382, <9> 4.1565, <10> 4.6809;
param capacity[MACHINE] := <1> 54.5601, <2> 54.5601, <3> 54.5601;

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
