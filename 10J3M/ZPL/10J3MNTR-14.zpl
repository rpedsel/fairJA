set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2813, <2> 26.5987, <3> 30.9113, <4> 35.9442, <5> 24.5089, <6> 19.4676, <7> 20.258, <8> 19.3894, <9> 27.9307, <10> 25.4;
param workload[JOB] := <1> 34.742, <2> 24.2764, <3> 48.4136, <4> 31.6445, <5> 4.3632, <6> 2.3399, <7> 7.8631, <8> 36.6622, <9> 23.3872, <10> 28.5992;
param capacity[MACHINE] := <1> 60.5729, <2> 60.5729, <3> 60.5729;

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
