set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7182, <2> 13.9827, <3> 23.3426, <4> 16.149, <5> 18.5733, <6> 23.2714, <7> 20.8417, <8> 27.8043, <9> 24.7338, <10> 28.389, <11> 24.8804, <12> 27.0009, <13> 25.4918, <14> 26.9562, <15> 24.6884, <16> 16.8117, <17> 37.8646, <18> 23.4042, <19> 20.9403, <20> 24.7398;
param workload[JOB] := <1> 4.8701, <2> 3.7393, <3> 4.8314, <4> 4.0186, <5> 4.3097, <6> 4.824, <7> 4.5653, <8> 5.273, <9> 4.9733, <10> 5.3281, <11> 4.988, <12> 5.1962, <13> 5.0489, <14> 5.1919, <15> 4.9687, <16> 4.1002, <17> 6.1534, <18> 4.8378, <19> 4.5761, <20> 4.9739;
param capacity[MACHINE] := <1> 13.824, <2> 13.824, <3> 13.824, <4> 13.824, <5> 13.824, <6> 13.824, <7> 13.824;

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
