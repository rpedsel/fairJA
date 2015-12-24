set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.9789, <2> 24.1384, <3> 24.2891, <4> 34.6753, <5> 26.6497, <6> 29.3552, <7> 26.9414, <8> 25.8585, <9> 25.292, <10> 18.4241;
param workload[JOB] := <1> 11.813, <2> 10.8069, <3> 23.4646, <4> 29.5154, <5> 32.534, <6> 10.1803, <7> 45.723, <8> 27.2203, <9> 18.9523, <10> 23.235;
param capacity[MACHINE] := <1> 77.8149, <2> 77.8149, <3> 77.8149;

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
