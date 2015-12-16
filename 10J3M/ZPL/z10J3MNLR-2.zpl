set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.6231, <2> 26.1242, <3> 19.4443, <4> 26.6865, <5> 26.272, <6> 26.7313, <7> 38.4754, <8> 28.4429, <9> 26.7848, <10> 21.211;
param workload[JOB] := <1> 43.9745, <2> 37.4894, <3> 29.0406, <4> 18.826, <5> 36.6919, <6> 23.5092, <7> 18.0837, <8> 21.4626, <9> 46.3857, <10> 8.4887;
param capacity[MACHINE] := <1> 94.6508, <2> 94.6508, <3> 94.6508;

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
