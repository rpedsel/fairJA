set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.2371, <2> 33.6582, <3> 10.2655, <4> 28.2524, <5> 1.9602, <6> 21.3032, <7> 19.7384, <8> 30.1834, <9> 2.3741, <10> 39.4226, <11> 9.7121, <12> 4.4284, <13> 38.4222, <14> 48.7598, <15> 21.8504, <16> 12.8707, <17> 31.4822, <18> 32.5401, <19> 3.0608, <20> 23.9669;
param workload[JOB] := <1> 2.6902, <2> 5.8016, <3> 3.204, <4> 5.3153, <5> 1.4001, <6> 4.6155, <7> 4.4428, <8> 5.4939, <9> 1.5408, <10> 6.2787, <11> 3.1164, <12> 2.1044, <13> 6.1986, <14> 6.9828, <15> 4.6744, <16> 3.5876, <17> 5.6109, <18> 5.7044, <19> 1.7495, <20> 4.8956;
param capacity[MACHINE] := <1> 85.4075, <2> 85.4075, <3> 85.4075, <4> 85.4075, <5> 85.4075, <6> 85.4075, <7> 85.4075;

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
