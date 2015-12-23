set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.891, <2> 27.2442, <3> 21.5041, <4> 24.098, <5> 28.1104, <6> 24.3248, <7> 19.7543, <8> 26.36, <9> 30.3109, <10> 27.1558, <11> 28.2185, <12> 27.2469, <13> 22.7602, <14> 26.7383, <15> 22.7552, <16> 15.8068, <17> 20.561, <18> 26.7489, <19> 22.5343, <20> 26.4533;
param workload[JOB] := <1> 20.891, <2> 27.2442, <3> 21.5041, <4> 24.098, <5> 28.1104, <6> 24.3248, <7> 19.7543, <8> 26.36, <9> 30.3109, <10> 27.1558, <11> 28.2185, <12> 27.2469, <13> 22.7602, <14> 26.7383, <15> 22.7552, <16> 15.8068, <17> 20.561, <18> 26.7489, <19> 22.5343, <20> 26.4533;
param capacity[MACHINE] := <1> 52.4547, <2> 52.4547, <3> 52.4547, <4> 52.4547, <5> 52.4547, <6> 52.4547, <7> 52.4547;

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
