set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3375, <2> 1.6112, <3> 14.6868, <4> 30.2003, <5> 44.3807, <6> 22.7697, <7> 47.5216, <8> 5.4209, <9> 26.795, <10> 0.047;
param workload[JOB] := <1> 4.6193, <2> 1.2693, <3> 3.8323, <4> 5.4955, <5> 6.6619, <6> 4.7718, <7> 6.8936, <8> 2.3283, <9> 5.1764, <10> 0.2168;
param capacity[MACHINE] := <1> 10.3163, <2> 10.3163, <3> 10.3163;

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
