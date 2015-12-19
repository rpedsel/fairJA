set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.6421, <2> 26.5474, <3> 49.6802, <4> 46.9628, <5> 1.8622, <6> 23.623, <7> 27.3401, <8> 40.1554, <9> 45.0091, <10> 39.2942;
param workload[JOB] := <1> 6.4531, <2> 5.1524, <3> 7.0484, <4> 6.8529, <5> 1.3646, <6> 4.8603, <7> 5.2288, <8> 6.3368, <9> 6.7089, <10> 6.2685;
param capacity[MACHINE] := <1> 14.0686, <2> 14.0686, <3> 14.0686;

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
