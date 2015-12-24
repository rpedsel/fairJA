set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9996, <2> 16.4643, <3> 22.7906, <4> 37.2538, <5> 22.0708, <6> 28.6954, <7> 25.2745, <8> 24.3619, <9> 27.1057, <10> 17.4313, <11> 22.7954, <12> 23.1411, <13> 22.4928, <14> 16.909, <15> 25.3723, <16> 23.42, <17> 25.5539, <18> 23.6696, <19> 27.1089, <20> 18.6866;
param workload[JOB] := <1> 5.2915, <2> 4.0576, <3> 4.774, <4> 6.1036, <5> 4.698, <6> 5.3568, <7> 5.0274, <8> 4.9358, <9> 5.2063, <10> 4.1751, <11> 4.7745, <12> 4.8105, <13> 4.7427, <14> 4.1121, <15> 5.0371, <16> 4.8394, <17> 5.0551, <18> 4.8651, <19> 5.2066, <20> 4.3228;
param capacity[MACHINE] := <1> 10.4348, <2> 10.4348, <3> 10.4348, <4> 10.4348, <5> 10.4348, <6> 10.4348, <7> 10.4348;

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
