set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.4001, <2> 26.759, <3> 33.1326, <4> 43.1397, <5> 18.0438, <6> 3.6546, <7> 46.1212, <8> 35.0205, <9> 22.8533, <10> 0.321, <11> 10.0403, <12> 26.654, <13> 44.3491, <14> 31.8257, <15> 21.5193, <16> 3.5696, <17> 28.4552, <18> 44.3773, <19> 49.5714, <20> 18.6888;
param workload[JOB] := <1> 36.5713, <2> 49.2592, <3> 14.7595, <4> 47.8456, <5> 34.4452, <6> 9.1617, <7> 48.7737, <8> 27.1887, <9> 4.3442, <10> 35.9152, <11> 38.3401, <12> 37.9873, <13> 8.4479, <14> 12.6783, <15> 42.6268, <16> 37.5828, <17> 37.3217, <18> 39.3552, <19> 36.4124, <20> 2.1193;
param capacity[MACHINE] := <1> 75.142, <2> 75.142, <3> 75.142, <4> 75.142, <5> 75.142, <6> 75.142;

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
