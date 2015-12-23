set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.749, <2> 28.2964, <3> 23.5327, <4> 26.1, <5> 28.4179, <6> 28.6371, <7> 30.322, <8> 23.3627, <9> 20.1772, <10> 25.2136, <11> 16.6321, <12> 18.1158, <13> 23.4747, <14> 28.3274, <15> 29.0742, <16> 21.9745, <17> 22.3807, <18> 25.2706, <19> 32.228, <20> 17.1107;
param workload[JOB] := <1> 4.9748, <2> 5.3194, <3> 4.8511, <4> 5.1088, <5> 5.3308, <6> 5.3514, <7> 5.5065, <8> 4.8335, <9> 4.4919, <10> 5.0213, <11> 4.0782, <12> 4.2563, <13> 4.8451, <14> 5.3223, <15> 5.392, <16> 4.6877, <17> 4.7308, <18> 5.027, <19> 5.677, <20> 4.1365;
param capacity[MACHINE] := <1> 14.1346, <2> 14.1346, <3> 14.1346, <4> 14.1346, <5> 14.1346, <6> 14.1346, <7> 14.1346;

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
