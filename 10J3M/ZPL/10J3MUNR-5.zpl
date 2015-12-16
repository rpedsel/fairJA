set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.3476, <2> 0.09, <3> 9.1435, <4> 7.8262, <5> 8.8501, <6> 26.8542, <7> 11.6717, <8> 40.7134, <9> 12.5661, <10> 0.1141;
param workload[JOB] := <1> 9.3156, <2> 37.1835, <3> 11.429, <4> 20.3785, <5> 12.7952, <6> 19.0109, <7> 45.3119, <8> 24.6681, <9> 13.0147, <10> 15.2735;
param capacity[MACHINE] := <1> 208.3809, <2> 208.3809, <3> 208.3809;

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
