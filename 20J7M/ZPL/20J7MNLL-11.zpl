set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4572, <2> 22.6386, <3> 22.0987, <4> 28.3216, <5> 23.5, <6> 24.0262, <7> 22.8776, <8> 21.8912, <9> 27.439, <10> 34.7322, <11> 22.216, <12> 25.7443, <13> 30.7487, <14> 19.6193, <15> 21.6444, <16> 19.8309, <17> 30.0024, <18> 31.6974, <19> 27.8946, <20> 24.3552;
param workload[JOB] := <1> 24.4572, <2> 22.6386, <3> 22.0987, <4> 28.3216, <5> 23.5, <6> 24.0262, <7> 22.8776, <8> 21.8912, <9> 27.439, <10> 34.7322, <11> 22.216, <12> 25.7443, <13> 30.7487, <14> 19.6193, <15> 21.6444, <16> 19.8309, <17> 30.0024, <18> 31.6974, <19> 27.8946, <20> 24.3552;
param capacity[MACHINE] := <1> 72.2479, <2> 72.2479, <3> 72.2479, <4> 72.2479, <5> 72.2479, <6> 72.2479, <7> 72.2479;

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
