set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.6062, <2> 37.018, <3> 18.2805, <4> 45.6241, <5> 32.3494, <6> 27.6297, <7> 26.4975, <8> 5.1205, <9> 23.4015, <10> 45.6365, <11> 9.2972, <12> 22.2159, <13> 25.5521, <14> 23.9119, <15> 11.0328, <16> 15.7323, <17> 43.0362, <18> 27.1218, <19> 33.3112, <20> 38.6792;
param workload[JOB] := <1> 0.6062, <2> 37.018, <3> 18.2805, <4> 45.6241, <5> 32.3494, <6> 27.6297, <7> 26.4975, <8> 5.1205, <9> 23.4015, <10> 45.6365, <11> 9.2972, <12> 22.2159, <13> 25.5521, <14> 23.9119, <15> 11.0328, <16> 15.7323, <17> 43.0362, <18> 27.1218, <19> 33.3112, <20> 38.6792;
param capacity[MACHINE] := <1> 512.0545, <2> 512.0545, <3> 512.0545, <4> 512.0545, <5> 512.0545, <6> 512.0545, <7> 512.0545;

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
