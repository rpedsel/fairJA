set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.7912, <2> 5.2778, <3> 40.2671, <4> 21.7905, <5> 2.0843, <6> 33.3275, <7> 4.2673, <8> 27.0236, <9> 49.8037, <10> 0.8656;
param workload[JOB] := <1> 13.0927, <2> 34.6299, <3> 13.5704, <4> 4.6588, <5> 46.8793, <6> 31.8472, <7> 28.6631, <8> 27.7783, <9> 13.5795, <10> 35.1673;
param capacity[MACHINE] := <1> 83.2888, <2> 83.2888, <3> 83.2888;

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
