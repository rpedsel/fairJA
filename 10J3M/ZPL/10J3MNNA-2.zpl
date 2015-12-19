set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7139, <2> 28.889, <3> 24.2681, <4> 30.0064, <5> 27.5016, <6> 23.7056, <7> 24.8945, <8> 25.5824, <9> 19.9258, <10> 29.4599;
param workload[JOB] := <1> 562.3491, <2> 834.5743, <3> 588.9407, <4> 900.384, <5> 756.338, <6> 561.9555, <7> 619.7361, <8> 654.4592, <9> 397.0375, <10> 867.8857;
param capacity[MACHINE] := <1> 6743.6601, <2> 6743.6601, <3> 6743.6601;

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
