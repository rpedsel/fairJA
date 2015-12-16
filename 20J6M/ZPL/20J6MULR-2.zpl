set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.3589, <2> 28.4905, <3> 48.4762, <4> 26.9451, <5> 7.0599, <6> 46.7195, <7> 7.9453, <8> 47.1934, <9> 5.0642, <10> 29.6032, <11> 35.0339, <12> 27.5418, <13> 43.2531, <14> 32.2387, <15> 15.0186, <16> 16.3269, <17> 14.616, <18> 20.8415, <19> 15.318, <20> 6.1786;
param workload[JOB] := <1> 10.1613, <2> 29.0635, <3> 22.232, <4> 30.879, <5> 33.5849, <6> 0.8469, <7> 5.0302, <8> 30.8275, <9> 44.761, <10> 44.8013, <11> 49.8462, <12> 30.6228, <13> 29.2889, <14> 30.7409, <15> 7.4781, <16> 21.1255, <17> 27.3169, <18> 5.7669, <19> 32.9818, <20> 37.3128;
param capacity[MACHINE] := <1> 87.4447, <2> 87.4447, <3> 87.4447, <4> 87.4447, <5> 87.4447, <6> 87.4447;

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
