set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1038, <2> 20.5258, <3> 28.2237, <4> 24.7434, <5> 32.7305, <6> 19.8955, <7> 14.0333, <8> 30.904, <9> 23.9104, <10> 23.1559, <11> 29.0005, <12> 15.4403, <13> 25.8409, <14> 30.0511, <15> 26.1607, <16> 26.8778, <17> 20.8842, <18> 18.5891, <19> 23.3016, <20> 23.0393;
param workload[JOB] := <1> 5.0104, <2> 4.5305, <3> 5.3126, <4> 4.9743, <5> 5.7211, <6> 4.4604, <7> 3.7461, <8> 5.5591, <9> 4.8898, <10> 4.8121, <11> 5.3852, <12> 3.9294, <13> 5.0834, <14> 5.4819, <15> 5.1148, <16> 5.1844, <17> 4.5699, <18> 4.3115, <19> 4.8272, <20> 4.7999;
param capacity[MACHINE] := <1> 13.9577, <2> 13.9577, <3> 13.9577, <4> 13.9577, <5> 13.9577, <6> 13.9577, <7> 13.9577;

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
