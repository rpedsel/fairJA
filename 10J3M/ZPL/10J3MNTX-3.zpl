set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.424, <2> 10.7807, <3> 19.9538, <4> 30.8543, <5> 24.8141, <6> 23.294, <7> 35.1629, <8> 29.0989, <9> 20.3188, <10> 29.4748;
param workload[JOB] := <1> 5.1404, <2> 3.2834, <3> 4.467, <4> 5.5547, <5> 4.9814, <6> 4.8264, <7> 5.9298, <8> 5.3943, <9> 4.5076, <10> 5.4291;
param capacity[MACHINE] := <1> 12.3785, <2> 12.3785, <3> 12.3785;

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
