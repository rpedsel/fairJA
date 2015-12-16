set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.4092, <2> 6.1712, <3> 32.4427, <4> 30.2932, <5> 49.7466, <6> 29.0656, <7> 35.0446, <8> 45.4773, <9> 46.5935, <10> 24.3746, <11> 32.9899, <12> 14.9791, <13> 30.0655, <14> 16.7355, <15> 24.3955, <16> 27.1996, <17> 3.4963, <18> 3.3516, <19> 18.453, <20> 28.5346;
param workload[JOB] := <1> 6.4092, <2> 6.1712, <3> 32.4427, <4> 30.2932, <5> 49.7466, <6> 29.0656, <7> 35.0446, <8> 45.4773, <9> 46.5935, <10> 24.3746, <11> 32.9899, <12> 14.9791, <13> 30.0655, <14> 16.7355, <15> 24.3955, <16> 27.1996, <17> 3.4963, <18> 3.3516, <19> 18.453, <20> 28.5346;
param capacity[MACHINE] := <1> 505.8191, <2> 505.8191, <3> 505.8191, <4> 505.8191, <5> 505.8191, <6> 505.8191;

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
