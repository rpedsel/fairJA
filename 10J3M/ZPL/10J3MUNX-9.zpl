set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.8245, <2> 27.6983, <3> 8.5179, <4> 0.0036, <5> 39.8675, <6> 0.0635, <7> 11.0161, <8> 11.9488, <9> 35.7709, <10> 2.8349;
param workload[JOB] := <1> 2.1965, <2> 5.2629, <3> 2.9185, <4> 0.06, <5> 6.3141, <6> 0.252, <7> 3.3191, <8> 3.4567, <9> 5.9809, <10> 1.6837;
param capacity[MACHINE] := <1> 31.4444, <2> 31.4444, <3> 31.4444;

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
