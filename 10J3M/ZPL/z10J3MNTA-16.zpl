set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0631, <2> 23.3739, <3> 23.6532, <4> 23.7757, <5> 35.6373, <6> 14.9053, <7> 30.0417, <8> 31.0405, <9> 19.4482, <10> 17.7957;
param workload[JOB] := <1> 579.0328, <2> 546.3392, <3> 559.4739, <4> 565.2839, <5> 1270.0172, <6> 222.168, <7> 902.5037, <8> 963.5126, <9> 378.2325, <10> 316.6869;
param capacity[MACHINE] := <1> 1575.8127, <2> 1575.8127, <3> 1575.8127;

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
