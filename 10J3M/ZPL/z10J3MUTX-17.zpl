set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.5135, <2> 38.4177, <3> 16.59, <4> 33.0773, <5> 10.9269, <6> 12.7689, <7> 37.425, <8> 21.601, <9> 13.1065, <10> 18.4527;
param workload[JOB] := <1> 5.4326, <2> 6.1982, <3> 4.0731, <4> 5.7513, <5> 3.3056, <6> 3.5734, <7> 6.1176, <8> 4.6477, <9> 3.6203, <10> 4.2957;
param capacity[MACHINE] := <1> 11.7538, <2> 11.7538, <3> 11.7538;

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
