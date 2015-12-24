set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.5008, <2> 23.0918, <3> 32.8015, <4> 6.2189, <5> 38.3324, <6> 9.7659, <7> 49.3611, <8> 22.101, <9> 46.1912, <10> 7.6122;
param workload[JOB] := <1> 27.3609, <2> 18.7205, <3> 47.3447, <4> 45.6672, <5> 25.6407, <6> 28.6492, <7> 14.3629, <8> 33.5826, <9> 9.8639, <10> 32.9652;
param capacity[MACHINE] := <1> 284.1578, <2> 284.1578, <3> 284.1578;

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
