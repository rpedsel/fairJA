set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0705, <2> 13.1725, <3> 23.5584, <4> 13.1576, <5> 48.3275, <6> 0.369, <7> 3.8978, <8> 30.7573, <9> 38.4691, <10> 27.4951;
param workload[JOB] := <1> 5.1059, <2> 3.6294, <3> 4.8537, <4> 3.6273, <5> 6.9518, <6> 0.6075, <7> 1.9743, <8> 5.5459, <9> 6.2023, <10> 5.2436;
param capacity[MACHINE] := <1> 10.9354, <2> 10.9354, <3> 10.9354;

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
