set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.5736, <2> 42.8557, <3> 36.2824, <4> 42.6631, <5> 21.7833, <6> 24.1128, <7> 48.7805, <8> 44.8026, <9> 40.3133, <10> 37.6514;
param workload[JOB] := <1> 22.9005, <2> 19.7102, <3> 29.1219, <4> 44.709, <5> 37.1314, <6> 33.0947, <7> 25.7154, <8> 5.9657, <9> 11.7751, <10> 22.5968;
param capacity[MACHINE] := <1> 63.1801, <2> 63.1801, <3> 63.1801;

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
