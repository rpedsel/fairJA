set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.9116, <2> 28.7902, <3> 18.8183, <4> 27.5503, <5> 20.1352, <6> 31.6595, <7> 23.9358, <8> 20.6401, <9> 30.7484, <10> 23.7998;
param workload[JOB] := <1> 571.7646, <2> 828.8756, <3> 354.1284, <4> 759.019, <5> 405.4263, <6> 1002.3239, <7> 572.9225, <8> 426.0137, <9> 945.4641, <10> 566.4305;
param capacity[MACHINE] := <1> 1608.0922, <2> 1608.0922, <3> 1608.0922;

var x[JM];
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
