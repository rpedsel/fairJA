set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.5595, <2> 30.8108, <3> 9.8431, <4> 43.6214, <5> 29.0371, <6> 31.0968, <7> 19.2577, <8> 31.0319, <9> 15.9077, <10> 16.2396;
param workload[JOB] := <1> 0.9895, <2> 48.891, <3> 12.9206, <4> 2.4008, <5> 21.4034, <6> 46.5598, <7> 35.1761, <8> 5.7438, <9> 33.2401, <10> 44.4702;
param capacity[MACHINE] := <1> 62.9488, <2> 62.9488, <3> 62.9488;

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
