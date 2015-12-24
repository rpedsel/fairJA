set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.954, <2> 29.7802, <3> 27.8974, <4> 26.2291, <5> 20.7054, <6> 22.6217, <7> 24.4241, <8> 17.5601, <9> 30.5418, <10> 29.952;
param workload[JOB] := <1> 13.8131, <2> 34.0571, <3> 0.7851, <4> 21.2885, <5> 46.3851, <6> 44.888, <7> 46.6068, <8> 34.2307, <9> 40.3749, <10> 37.8882;
param capacity[MACHINE] := <1> 80.0794, <2> 80.0794, <3> 80.0794;

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
