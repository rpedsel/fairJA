set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6789, <2> 24.4218, <3> 38.6297, <4> 33.6424, <5> 31.1646, <6> 46.8356, <7> 10.783, <8> 28.6253, <9> 44.483, <10> 41.8711;
param workload[JOB] := <1> 2.0817, <2> 17.1427, <3> 26.8132, <4> 49.2639, <5> 6.945, <6> 36.4609, <7> 47.385, <8> 42.1382, <9> 42.0538, <10> 30.51;
param capacity[MACHINE] := <1> 75.1986, <2> 75.1986, <3> 75.1986;

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
