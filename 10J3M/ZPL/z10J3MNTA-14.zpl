set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0387, <2> 27.445, <3> 20.7198, <4> 20.2391, <5> 31.1504, <6> 21.3247, <7> 15.8948, <8> 23.1685, <9> 21.3701, <10> 20.6643;
param workload[JOB] := <1> 626.9365, <2> 753.228, <3> 429.3101, <4> 409.6212, <5> 970.3474, <6> 454.7428, <7> 252.6447, <8> 536.7794, <9> 456.6812, <10> 427.0133;
param capacity[MACHINE] := <1> 1329.3262, <2> 1329.3262, <3> 1329.3262;

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
