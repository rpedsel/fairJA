set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3899, <2> 43.775, <3> 26.1314, <4> 14.6701, <5> 3.6067, <6> 7.6043, <7> 48.7899, <8> 2.7446, <9> 49.7514, <10> 31.0987, <11> 3.5407, <12> 11.6745, <13> 43.1064, <14> 44.9815, <15> 7.3884, <16> 47.5156, <17> 21.2952, <18> 7.38, <19> 4.4223, <20> 39.9527;
param workload[JOB] := <1> 0.176, <2> 15.9892, <3> 12.2127, <4> 19.4989, <5> 48.3492, <6> 35.9915, <7> 48.1183, <8> 24.3989, <9> 39.4374, <10> 41.6775, <11> 7.9754, <12> 20.8456, <13> 37.4014, <14> 41.3355, <15> 17.0103, <16> 28.0304, <17> 22.3157, <18> 25.681, <19> 19.4143, <20> 38.8483;
param capacity[MACHINE] := <1> 90.7846, <2> 90.7846, <3> 90.7846, <4> 90.7846, <5> 90.7846, <6> 90.7846;

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
