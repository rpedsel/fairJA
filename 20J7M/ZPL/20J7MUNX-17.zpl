set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.5999, <2> 26.9798, <3> 11.721, <4> 34.7098, <5> 16.8882, <6> 49.7828, <7> 21.9208, <8> 14.8611, <9> 5.9064, <10> 24.479, <11> 41.6207, <12> 17.3224, <13> 16.7117, <14> 13.0417, <15> 39.0835, <16> 49.1148, <17> 33.7409, <18> 26.7391, <19> 16.7416, <20> 8.8269;
param workload[JOB] := <1> 2.569, <2> 5.1942, <3> 3.4236, <4> 5.8915, <5> 4.1095, <6> 7.0557, <7> 4.682, <8> 3.855, <9> 2.4303, <10> 4.9476, <11> 6.4514, <12> 4.162, <13> 4.088, <14> 3.6113, <15> 6.2517, <16> 7.0082, <17> 5.8087, <18> 5.171, <19> 4.0917, <20> 2.971;
param capacity[MACHINE] := <1> 93.7734, <2> 93.7734, <3> 93.7734, <4> 93.7734, <5> 93.7734, <6> 93.7734, <7> 93.7734;

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
