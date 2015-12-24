set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7996, <2> 30.3002, <3> 25.9195, <4> 25.5882, <5> 28.3275, <6> 32.0838, <7> 39.046, <8> 21.6635, <9> 30.8606, <10> 27.5454;
param workload[JOB] := <1> 665.6194, <2> 918.1021, <3> 671.8205, <4> 654.756, <5> 802.4473, <6> 1029.3702, <7> 1524.5901, <8> 469.3072, <9> 952.3766, <10> 758.7491;
param capacity[MACHINE] := <1> 2815.7128, <2> 2815.7128, <3> 2815.7128;

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
