set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.0349, <2> 2.7573, <3> 7.5283, <4> 12.131, <5> 6.6372, <6> 43.8986, <7> 45.7741, <8> 16.6013, <9> 21.9044, <10> 31.9293;
param workload[JOB] := <1> 39.0349, <2> 2.7573, <3> 7.5283, <4> 12.131, <5> 6.6372, <6> 43.8986, <7> 45.7741, <8> 16.6013, <9> 21.9044, <10> 31.9293;
param capacity[MACHINE] := <1> 57.0491, <2> 57.0491, <3> 57.0491;

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
