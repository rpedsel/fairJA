set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0219, <2> 26.8807, <3> 30.866, <4> 30.5528, <5> 27.7354, <6> 29.2505, <7> 27.0326, <8> 26.1309, <9> 28.5265, <10> 23.3847, <11> 23.2243, <12> 24.7093, <13> 27.8393, <14> 18.4529, <15> 19.0392, <16> 19.5691, <17> 36.4374, <18> 30.9061, <19> 33.3427, <20> 20.7507;
param workload[JOB] := <1> 24.0219, <2> 26.8807, <3> 30.866, <4> 30.5528, <5> 27.7354, <6> 29.2505, <7> 27.0326, <8> 26.1309, <9> 28.5265, <10> 23.3847, <11> 23.2243, <12> 24.7093, <13> 27.8393, <14> 18.4529, <15> 19.0392, <16> 19.5691, <17> 36.4374, <18> 30.9061, <19> 33.3427, <20> 20.7507;
param capacity[MACHINE] := <1> 66.0816, <2> 66.0816, <3> 66.0816, <4> 66.0816, <5> 66.0816, <6> 66.0816;

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
