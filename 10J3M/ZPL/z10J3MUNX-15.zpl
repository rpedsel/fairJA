set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.8566, <2> 16.8485, <3> 12.0324, <4> 37.3514, <5> 4.6153, <6> 9.0316, <7> 46.5633, <8> 46.8395, <9> 32.5199, <10> 24.1017;
param workload[JOB] := <1> 5.988, <2> 4.1047, <3> 3.4688, <4> 6.1116, <5> 2.1483, <6> 3.0053, <7> 6.8237, <8> 6.8439, <9> 5.7026, <10> 4.9093;
param capacity[MACHINE] := <1> 49.1062, <2> 49.1062, <3> 49.1062;

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
