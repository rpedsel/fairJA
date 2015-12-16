set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.9485, <2> 22.4958, <3> 20.439, <4> 21.0404, <5> 37.2378, <6> 24.1881, <7> 16.5239, <8> 23.3346, <9> 23.5895, <10> 24.1403, <11> 18.4412, <12> 27.5412, <13> 20.618, <14> 25.3585, <15> 24.8696, <16> 26.3898, <17> 19.7934, <18> 13.8108, <19> 25.4935, <20> 25.9198;
param workload[JOB] := <1> 26.9485, <2> 22.4958, <3> 20.439, <4> 21.0404, <5> 37.2378, <6> 24.1881, <7> 16.5239, <8> 23.3346, <9> 23.5895, <10> 24.1403, <11> 18.4412, <12> 27.5412, <13> 20.618, <14> 25.3585, <15> 24.8696, <16> 26.3898, <17> 19.7934, <18> 13.8108, <19> 25.4935, <20> 25.9198;
param capacity[MACHINE] := <1> 58.5217, <2> 58.5217, <3> 58.5217, <4> 58.5217, <5> 58.5217, <6> 58.5217;

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
