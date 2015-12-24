set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.0926, <2> 23.7306, <3> 26.273, <4> 23.9609, <5> 19.6585, <6> 29.074, <7> 30.6317, <8> 28.8335, <9> 24.0325, <10> 20.6476;
param workload[JOB] := <1> 4.2535, <2> 4.8714, <3> 5.1257, <4> 4.895, <5> 4.4338, <6> 5.392, <7> 5.5346, <8> 5.3697, <9> 4.9023, <10> 4.544;
param capacity[MACHINE] := <1> 49.322, <2> 49.322, <3> 49.322;

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
