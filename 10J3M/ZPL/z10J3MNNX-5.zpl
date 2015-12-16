set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4818, <2> 15.3017, <3> 20.1032, <4> 24.4985, <5> 28.8422, <6> 30.2782, <7> 28.5516, <8> 22.1541, <9> 15.0393, <10> 31.9395;
param workload[JOB] := <1> 5.8721, <2> 3.9117, <3> 4.4837, <4> 4.9496, <5> 5.3705, <6> 5.5026, <7> 5.3434, <8> 4.7068, <9> 3.8781, <10> 5.6515;
param capacity[MACHINE] := <1> 49.67, <2> 49.67, <3> 49.67;

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
