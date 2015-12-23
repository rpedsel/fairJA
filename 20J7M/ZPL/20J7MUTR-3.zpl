set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6178, <2> 8.4425, <3> 47.1934, <4> 27.2034, <5> 33.7349, <6> 22.7987, <7> 7.2606, <8> 21.2411, <9> 0.9678, <10> 15.2209, <11> 23.5211, <12> 4.0741, <13> 7.6961, <14> 44.0713, <15> 22.9385, <16> 45.4587, <17> 24.4267, <18> 13.5628, <19> 40.6731, <20> 2.4341;
param workload[JOB] := <1> 32.5451, <2> 2.6229, <3> 43.1775, <4> 11.6689, <5> 20.9717, <6> 38.8301, <7> 10.3926, <8> 10.2676, <9> 31.129, <10> 26.435, <11> 27.491, <12> 44.7673, <13> 35.3385, <14> 49.1169, <15> 11.8649, <16> 27.1496, <17> 45.2772, <18> 32.8868, <19> 4.0297, <20> 12.3262;
param capacity[MACHINE] := <1> 55.5309, <2> 55.5309, <3> 55.5309, <4> 55.5309, <5> 55.5309, <6> 55.5309, <7> 55.5309;

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
