set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.5006, <2> 39.8851, <3> 15.7119, <4> 31.933, <5> 45.4524, <6> 17.6884, <7> 10.7036, <8> 43.6745, <9> 22.8183, <10> 21.5657, <11> 46.1113, <12> 9.5996, <13> 9.6931, <14> 6.665, <15> 28.8111, <16> 20.2512, <17> 3.5745, <18> 20.5353, <19> 41.4245, <20> 0.4891;
param workload[JOB] := <1> 37.9878, <2> 29.2934, <3> 41.7299, <4> 38.1534, <5> 22.2447, <6> 8.228, <7> 7.3154, <8> 5.8786, <9> 31.2275, <10> 2.7655, <11> 16.9552, <12> 33.8301, <13> 15.3686, <14> 39.6577, <15> 36.8455, <16> 33.4712, <17> 47.7152, <18> 36.708, <19> 17.9976, <20> 10.4982;
param capacity[MACHINE] := <1> 55.0577, <2> 55.0577, <3> 55.0577, <4> 55.0577, <5> 55.0577, <6> 55.0577, <7> 55.0577;

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
