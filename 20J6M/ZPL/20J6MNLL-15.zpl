set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.525, <2> 24.9373, <3> 20.2362, <4> 25.0551, <5> 28.382, <6> 25.0982, <7> 21.7893, <8> 23.3243, <9> 28.7077, <10> 28.1114, <11> 22.4888, <12> 25.1522, <13> 17.1059, <14> 27.0986, <15> 27.3917, <16> 26.137, <17> 26.1324, <18> 28.0908, <19> 29.3689, <20> 15.8941;
param workload[JOB] := <1> 32.525, <2> 24.9373, <3> 20.2362, <4> 25.0551, <5> 28.382, <6> 25.0982, <7> 21.7893, <8> 23.3243, <9> 28.7077, <10> 28.1114, <11> 22.4888, <12> 25.1522, <13> 17.1059, <14> 27.0986, <15> 27.3917, <16> 26.137, <17> 26.1324, <18> 28.0908, <19> 29.3689, <20> 15.8941;
param capacity[MACHINE] := <1> 83.8378, <2> 83.8378, <3> 83.8378, <4> 83.8378, <5> 83.8378, <6> 83.8378;

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
