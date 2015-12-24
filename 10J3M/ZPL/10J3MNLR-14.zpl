set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5677, <2> 22.9557, <3> 29.735, <4> 23.2993, <5> 23.5964, <6> 29.1889, <7> 29.2118, <8> 28.1597, <9> 28.8881, <10> 34.73;
param workload[JOB] := <1> 34.4401, <2> 33.6613, <3> 48.3402, <4> 20.5978, <5> 26.1835, <6> 20.2084, <7> 30.5332, <8> 43.9405, <9> 37.811, <10> 14.5986;
param capacity[MACHINE] := <1> 103.4382, <2> 103.4382, <3> 103.4382;

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
