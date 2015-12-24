set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8466, <2> 24.5635, <3> 36.08, <4> 24.1384, <5> 31.1598, <6> 19.2099, <7> 28.6586, <8> 27.9806, <9> 18.1156, <10> 16.3969, <11> 37.8979, <12> 20.0688, <13> 35.0516, <14> 22.7466, <15> 27.2739, <16> 29.9764, <17> 28.5668, <18> 24.5567, <19> 28.8771, <20> 23.7889;
param workload[JOB] := <1> 19.059, <2> 17.9013, <3> 7.1227, <4> 43.4378, <5> 22.5669, <6> 38.0683, <7> 20.779, <8> 20.11, <9> 40.8022, <10> 46.4153, <11> 36.6026, <12> 21.798, <13> 2.3376, <14> 48.915, <15> 18.2108, <16> 9.4285, <17> 26.2478, <18> 20.6973, <19> 14.3418, <20> 12.5557;
param capacity[MACHINE] := <1> 52.2212, <2> 52.2212, <3> 52.2212, <4> 52.2212, <5> 52.2212, <6> 52.2212, <7> 52.2212;

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
