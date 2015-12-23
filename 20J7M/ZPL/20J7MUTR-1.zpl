set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.6697, <2> 19.0604, <3> 9.414, <4> 22.037, <5> 22.3782, <6> 11.1611, <7> 47.5963, <8> 14.2302, <9> 16.8206, <10> 4.7702, <11> 45.11, <12> 38.4009, <13> 39.0606, <14> 8.4181, <15> 8.3014, <16> 19.5457, <17> 36.8094, <18> 30.8213, <19> 49.1255, <20> 42.6536;
param workload[JOB] := <1> 41.7487, <2> 24.8972, <3> 44.3662, <4> 42.0639, <5> 45.0147, <6> 39.9228, <7> 14.7911, <8> 15.0666, <9> 5.5159, <10> 22.8048, <11> 3.8765, <12> 17.9765, <13> 18.9155, <14> 17.502, <15> 33.2669, <16> 33.0737, <17> 43.9164, <18> 49.1277, <19> 27.8029, <20> 15.6991;
param capacity[MACHINE] := <1> 59.716, <2> 59.716, <3> 59.716, <4> 59.716, <5> 59.716, <6> 59.716, <7> 59.716;

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
