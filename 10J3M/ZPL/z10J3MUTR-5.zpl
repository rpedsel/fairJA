set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.1848, <2> 11.0624, <3> 7.8641, <4> 33.2249, <5> 13.5228, <6> 38.0275, <7> 46.0599, <8> 23.6729, <9> 20.4443, <10> 34.5616;
param workload[JOB] := <1> 9.4348, <2> 24.2669, <3> 10.2448, <4> 1.0842, <5> 45.1546, <6> 46.4918, <7> 11.0795, <8> 20.1009, <9> 28.374, <10> 23.4817;
param capacity[MACHINE] := <1> 54.9283, <2> 54.9283, <3> 54.9283;

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
