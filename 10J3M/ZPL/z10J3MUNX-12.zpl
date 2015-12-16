set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.6792, <2> 22.9815, <3> 43.3558, <4> 7.0294, <5> 20.9668, <6> 36.9983, <7> 13.1576, <8> 11.3434, <9> 31.281, <10> 34.361;
param workload[JOB] := <1> 1.6368, <2> 4.7939, <3> 6.5845, <4> 2.6513, <5> 4.579, <6> 6.0826, <7> 3.6273, <8> 3.368, <9> 5.5929, <10> 5.8618;
param capacity[MACHINE] := <1> 44.7781, <2> 44.7781, <3> 44.7781;

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
