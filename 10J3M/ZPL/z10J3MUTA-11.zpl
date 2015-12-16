set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.3911, <2> 3.9499, <3> 15.8887, <4> 38.0611, <5> 44.7974, <6> 3.4442, <7> 14.3423, <8> 19.7945, <9> 26.03, <10> 6.7465;
param workload[JOB] := <1> 11.4996, <2> 15.6017, <3> 252.4508, <4> 1448.6473, <5> 2006.807, <6> 11.8625, <7> 205.7016, <8> 391.8222, <9> 677.5609, <10> 45.5153;
param capacity[MACHINE] := <1> 1266.8672, <2> 1266.8672, <3> 1266.8672;

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
