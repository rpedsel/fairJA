set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.2611, <2> 24.6448, <3> 9.227, <4> 17.7968, <5> 20.0401, <6> 45.2966, <7> 18.1552, <8> 46.8489, <9> 43.8333, <10> 39.1732;
param workload[JOB] := <1> 46.2611, <2> 24.6448, <3> 9.227, <4> 17.7968, <5> 20.0401, <6> 45.2966, <7> 18.1552, <8> 46.8489, <9> 43.8333, <10> 39.1732;
param capacity[MACHINE] := <1> 311.277, <2> 311.277, <3> 311.277;

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
