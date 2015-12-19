set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1666, <2> 43.1614, <3> 22.076, <4> 31.3346, <5> 23.682, <6> 21.9839, <7> 48.9742, <8> 26.6496, <9> 48.7518, <10> 6.7281;
param workload[JOB] := <1> 5.1153, <2> 6.5697, <3> 4.6985, <4> 5.5977, <5> 4.8664, <6> 4.6887, <7> 6.9982, <8> 5.1623, <9> 6.9822, <10> 2.5939;
param capacity[MACHINE] := <1> 17.7576, <2> 17.7576, <3> 17.7576;

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
