set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.3298, <2> 20.7016, <3> 0.4521, <4> 3.0154, <5> 8.761, <6> 46.5478, <7> 29.9155, <8> 46.3115, <9> 28.7016, <10> 44.0582, <11> 24.5107, <12> 17.336, <13> 6.8755, <14> 15.2655, <15> 15.8916, <16> 7.2917, <17> 29.8424, <18> 27.2261, <19> 16.0253, <20> 5.1433;
param workload[JOB] := <1> 4.2813, <2> 4.5499, <3> 0.6724, <4> 1.7365, <5> 2.9599, <6> 6.8226, <7> 5.4695, <8> 6.8053, <9> 5.3574, <10> 6.6376, <11> 4.9508, <12> 4.1637, <13> 2.6221, <14> 3.9071, <15> 3.9864, <16> 2.7003, <17> 5.4628, <18> 5.2179, <19> 4.0032, <20> 2.2679;
param capacity[MACHINE] := <1> 84.5746, <2> 84.5746, <3> 84.5746, <4> 84.5746, <5> 84.5746, <6> 84.5746, <7> 84.5746;

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
