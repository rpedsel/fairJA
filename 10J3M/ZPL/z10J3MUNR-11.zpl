set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.9241, <2> 6.1054, <3> 41.4244, <4> 24.9367, <5> 14.7161, <6> 6.956, <7> 5.8061, <8> 18.8774, <9> 9.8792, <10> 32.8862;
param workload[JOB] := <1> 9.0605, <2> 2.2701, <3> 5.3737, <4> 34.4367, <5> 18.4477, <6> 27.661, <7> 16.494, <8> 0.8223, <9> 46.6766, <10> 6.2248;
param capacity[MACHINE] := <1> 167.4674, <2> 167.4674, <3> 167.4674;

var x[JM] binary;
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
