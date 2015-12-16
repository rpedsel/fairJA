set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.2941, <2> 15.044, <3> 13.7323, <4> 44.9114, <5> 6.2365, <6> 24.6144, <7> 30.995, <8> 39.9362, <9> 5.2191, <10> 19.82, <11> 12.7831, <12> 34.0984, <13> 38.5928, <14> 38.7129, <15> 26.4289, <16> 20.5917, <17> 28.4638, <18> 14.313, <19> 1.3759, <20> 0.7102;
param workload[JOB] := <1> 38.2941, <2> 15.044, <3> 13.7323, <4> 44.9114, <5> 6.2365, <6> 24.6144, <7> 30.995, <8> 39.9362, <9> 5.2191, <10> 19.82, <11> 12.7831, <12> 34.0984, <13> 38.5928, <14> 38.7129, <15> 26.4289, <16> 20.5917, <17> 28.4638, <18> 14.313, <19> 1.3759, <20> 0.7102;
param capacity[MACHINE] := <1> 75.8123, <2> 75.8123, <3> 75.8123, <4> 75.8123, <5> 75.8123, <6> 75.8123;

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
