set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.8811, <2> 21.7484, <3> 25.4255, <4> 23.9308, <5> 19.6008, <6> 23.7191, <7> 21.2993, <8> 25.1227, <9> 30.0123, <10> 15.2602;
param workload[JOB] := <1> 30.8811, <2> 21.7484, <3> 25.4255, <4> 23.9308, <5> 19.6008, <6> 23.7191, <7> 21.2993, <8> 25.1227, <9> 30.0123, <10> 15.2602;
param capacity[MACHINE] := <1> 59.2501, <2> 59.2501, <3> 59.2501;

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
