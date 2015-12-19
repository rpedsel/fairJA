set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7618, <2> 20.3825, <3> 26.2406, <4> 14.7392, <5> 22.6086, <6> 25.6926, <7> 23.4756, <8> 17.9863, <9> 23.1051, <10> 28.6668;
param workload[JOB] := <1> 827.2411, <2> 415.4463, <3> 688.5691, <4> 217.244, <5> 511.1488, <6> 660.1097, <7> 551.1038, <8> 323.507, <9> 533.8456, <10> 821.7854;
param capacity[MACHINE] := <1> 1850.0003, <2> 1850.0003, <3> 1850.0003;

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
