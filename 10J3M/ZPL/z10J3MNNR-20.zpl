set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2781, <2> 26.3404, <3> 31.1372, <4> 28.9117, <5> 22.6394, <6> 30.1223, <7> 29.0302, <8> 20.4792, <9> 24.3949, <10> 24.7133;
param workload[JOB] := <1> 28.0983, <2> 4.4693, <3> 16.4145, <4> 42.051, <5> 13.4601, <6> 5.0499, <7> 29.4237, <8> 8.5134, <9> 20.1575, <10> 12.3799;
param capacity[MACHINE] := <1> 180.0176, <2> 180.0176, <3> 180.0176;

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
