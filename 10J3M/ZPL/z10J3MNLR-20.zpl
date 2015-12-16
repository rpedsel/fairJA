set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.162, <2> 24.2519, <3> 23.6677, <4> 37.7537, <5> 32.5704, <6> 33.0002, <7> 14.6813, <8> 16.4692, <9> 21.0167, <10> 29.4379;
param workload[JOB] := <1> 25.3685, <2> 10.3233, <3> 35.004, <4> 40.5151, <5> 22.8531, <6> 27.0048, <7> 12.08, <8> 37.3726, <9> 32.6053, <10> 43.8944;
param capacity[MACHINE] := <1> 95.6737, <2> 95.6737, <3> 95.6737;

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
