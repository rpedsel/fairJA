set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.2149, <2> 40.7826, <3> 38.7217, <4> 32.7389, <5> 9.7019, <6> 10.2819, <7> 8.495, <8> 37.5589, <9> 32.7568, <10> 15.9204;
param workload[JOB] := <1> 6.2149, <2> 40.7826, <3> 38.7217, <4> 32.7389, <5> 9.7019, <6> 10.2819, <7> 8.495, <8> 37.5589, <9> 32.7568, <10> 15.9204;
param capacity[MACHINE] := <1> 77.7243, <2> 77.7243, <3> 77.7243;

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
