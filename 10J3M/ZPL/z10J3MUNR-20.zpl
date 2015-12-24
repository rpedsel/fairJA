set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2011, <2> 4.1763, <3> 7.7294, <4> 31.1742, <5> 36.0945, <6> 28.1215, <7> 21.9674, <8> 33.2071, <9> 44.8336, <10> 45.0592;
param workload[JOB] := <1> 9.7792, <2> 40.5005, <3> 10.7529, <4> 16.5387, <5> 35.8201, <6> 26.6615, <7> 0.3758, <8> 24.2961, <9> 26.6582, <10> 38.642;
param capacity[MACHINE] := <1> 230.025, <2> 230.025, <3> 230.025;

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
