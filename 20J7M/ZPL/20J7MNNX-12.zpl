set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.0286, <2> 22.3439, <3> 18.2914, <4> 29.737, <5> 33.9354, <6> 23.963, <7> 26.3538, <8> 20.8762, <9> 18.5604, <10> 24.0468, <11> 26.0038, <12> 30.9231, <13> 21.1364, <14> 25.7987, <15> 20.4236, <16> 27.8779, <17> 23.489, <18> 31.8895, <19> 27.776, <20> 23.2959;
param workload[JOB] := <1> 5.4798, <2> 4.7269, <3> 4.2768, <4> 5.4532, <5> 5.8254, <6> 4.8952, <7> 5.1336, <8> 4.569, <9> 4.3082, <10> 4.9038, <11> 5.0994, <12> 5.5609, <13> 4.5974, <14> 5.0792, <15> 4.5192, <16> 5.28, <17> 4.8465, <18> 5.6471, <19> 5.2703, <20> 4.8266;
param capacity[MACHINE] := <1> 100.2985, <2> 100.2985, <3> 100.2985, <4> 100.2985, <5> 100.2985, <6> 100.2985, <7> 100.2985;

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
