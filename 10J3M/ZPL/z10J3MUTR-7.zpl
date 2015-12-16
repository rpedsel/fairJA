set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7539, <2> 49.1858, <3> 7.8933, <4> 34.1123, <5> 37.6083, <6> 14.8999, <7> 17.8534, <8> 8.8526, <9> 8.8903, <10> 6.561;
param workload[JOB] := <1> 33.178, <2> 23.3325, <3> 17.7223, <4> 14.9681, <5> 14.4071, <6> 23.4008, <7> 7.0062, <8> 7.727, <9> 25.0804, <10> 12.9756;
param capacity[MACHINE] := <1> 44.9495, <2> 44.9495, <3> 44.9495;

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
