set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.896, <2> 31.0669, <3> 22.9962, <4> 26.3025, <5> 21.6957, <6> 27.0204, <7> 23.1202, <8> 24.2872, <9> 26.2266, <10> 28.9032;
param workload[JOB] := <1> 5.0888, <2> 5.5738, <3> 4.7954, <4> 5.1286, <5> 4.6579, <6> 5.1981, <7> 4.8083, <8> 4.9282, <9> 5.1212, <10> 5.3762;
param capacity[MACHINE] := <1> 50.6765, <2> 50.6765, <3> 50.6765;

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
