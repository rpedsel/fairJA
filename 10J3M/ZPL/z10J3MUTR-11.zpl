set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.0334, <2> 9.2184, <3> 29.4598, <4> 12.8983, <5> 39.5375, <6> 7.0585, <7> 43.5377, <8> 0.227, <9> 21.0803, <10> 14.1337;
param workload[JOB] := <1> 21.7902, <2> 5.6215, <3> 2.6286, <4> 32.0044, <5> 5.6163, <6> 14.6605, <7> 14.4839, <8> 44.062, <9> 25.255, <10> 4.587;
param capacity[MACHINE] := <1> 64.7803, <2> 64.7803, <3> 64.7803;

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
