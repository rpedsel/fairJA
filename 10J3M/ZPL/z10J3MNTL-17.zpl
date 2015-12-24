set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.5729, <2> 36.1306, <3> 29.3298, <4> 18.6643, <5> 31.5173, <6> 32.3299, <7> 26.6462, <8> 19.7936, <9> 21.8276, <10> 24.4293;
param workload[JOB] := <1> 22.5729, <2> 36.1306, <3> 29.3298, <4> 18.6643, <5> 31.5173, <6> 32.3299, <7> 26.6462, <8> 19.7936, <9> 21.8276, <10> 24.4293;
param capacity[MACHINE] := <1> 65.8104, <2> 65.8104, <3> 65.8104;

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
