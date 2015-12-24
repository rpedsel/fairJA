set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2807, <2> 24.8439, <3> 27.6119, <4> 29.3073, <5> 20.695, <6> 24.1752, <7> 16.4595, <8> 20.7345, <9> 24.0286, <10> 22.0736;
param workload[JOB] := <1> 5.4204, <2> 19.5499, <3> 5.2136, <4> 21.4162, <5> 10.9731, <6> 45.9034, <7> 48.162, <8> 17.644, <9> 4.5134, <10> 3.9808;
param capacity[MACHINE] := <1> 182.7768, <2> 182.7768, <3> 182.7768;

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
